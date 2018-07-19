% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%     Kerberos Planner -- failure recovery planning by plan adaptation
%     (c) L. Seabra Lopes, 1996-2005
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

virec :- system('vi recovery.pro').
viop  :- system('vi models/operators_mth.pro').

%% failure_recovery_planning/4
%% -- determine a failure recovery strategy based on experience:
%%
%%    Prob: the problem for which a plan was being executed
%%    Op:   the failed operation template
%%    Diag: failure diagnosis template
%%    IS:   initial state (state in which the failed operation was applied)


failure_recovery_planning(Prob,Op,Diag,IS)
:- prepare_recovery_planning(Prob,Op,Diag,IS, FS,Plan_sk,LG),
write('ABSTRACT PLAN: '),write(Plan_sk),nl,
   adapt_recovery_skeleton(Prob,FS,Plan_sk,LG).

%% failure_recovery_planning/5
%% -- determine a failure recovery strategy based on experience:
%% -- está versão é mais recente e está melhor organizada, embora
%%    seja equivalente à anterior
%%
%%    Prob: the problem for which a plan was being executed
%%    Op:   the failed operation
%%    Diag: failure diagnosis template
%%    SBF:  state before failure (state in which the failed op. was applied)
%%    Plan: the recovery plan (output)

failure_recovery_planning(Prob,Op,Diag,SBF,Plan)
:- planning_gc,        % defined in planeador.pro
   prepare_abstract_planning(Prob,Op,Diag,SBF, FS,LG,AFS,ALG,Plan_sk),
   abstract_planning(AFS,ALG,Plan_sk,APlan),
nl, nl,
show_list(APlan),
nl,
   initialize_detailed_planning(Prob,FS,APlan,LG),
   detailed_recovery_planning,
   last_recovery_plan(Plan).

prepare_recovery_planning_OLD(Prob,Op,Diag,IS,FS,Skeleton,LG)
:- determine_expected_goals(Prob,IS,Op,LG),
   fr_schema(Op,Diag,Plan_sk),
   concretize_clusters(Plan_sk,Skeleton),
   determine_failure_state(IS,Diag,Op,FS).
   
%                          in  in  in  in out out  out
prepare_recovery_planning(Prob,Op,Diag,IS,FS,APlan,LG)  % not used
:- determine_expected_goals(Prob,IS,Op,LG),
   fr_schema(Op,Diag,Plan_sk),
   determine_failure_state(IS,Diag,Op,FS),
   abstract_situation_description(FS,AFS),
   abstract_situation_description(LG,ALG),
   define_current_state(0,AFS),
   assert(abs_sits(AFS,ALG)),
assert(semiconcrete_skeleton(Plan_sk)),
write('merda 1'), nl,
   build_abstract_plan(AFS,ALG,Plan_sk,APlan_num),
   replace_numbers_by_variables([],APlan_num,APlan).


prepare_abstract_planning(Prob,Op,Diag,SBF, FS,LG,AFS,ALG,Plan_sk)
:- determine_expected_goals(Prob,SBF,Op,LG),        % corresponde à parte inicial
   fr_schema(Op,Diag,Plan_sk),                      % do predicado anterior
   determine_failure_state(SBF,Diag,Op,FS),
   abstract_situation_description(FS,AFS),
   abstract_situation_description(LG,ALG),
   assert(failure_state(AFS)).
%  define_current_state(0,AFS).
%  assert(abs_sits(AFS,ALG)). % assert for debug

abstract_planning(AFS, ALG, Plan_sk, APlan)         % corresponde ao resto do
:- build_abstract_plan(AFS,ALG,Plan_sk, APlan_num), % dito predicado
writeln(a),
   replace_numbers_by_variables([],APlan_num,APlan).


%%%
%%
%

determine_expected_goals(Prob,IS,Op,LG)
:- goal_state(Prob,GS),
   operator_functionality(Op,_,_,Del,Add),
   strict_set_difference(IS,Del,St_1),
   append_no_bt(St_1,Add,ExpSt),
   strict_intersection(ExpSt,GS,LG).

%
   
is_a_cluster([[_|_],_]).

%

concretize_clusters([],[])
:- !.

concretize_clusters([Cluster|Plan_sk],[Expansion|Skeleton])
:- is_a_cluster(Cluster), !, 
   Cluster = [LAOp,LProp],
   instanciate_cluster(LAOp,LProp,ClusterInstances),
   distribute_properties_for_operations(ClusterInstances,Expansion),
   concretize_clusters(Plan_sk,Skeleton).

concretize_clusters([Step|Plan_sk],[Step|Skeleton])
:- concretize_clusters(Plan_sk,Skeleton).


%

instanciate_cluster(LAOp,LProp,ClusterInstances)
:- findall([LAOp,LProp],instanciate_properties(LProp),ClusterInstances).

instanciate_properties([]).

instanciate_properties([Prop|LProp])
:- verify_property(Prop),
   instanciate_properties(LProp).

%

distribute_properties_for_operations([],[])
:- !.

distribute_properties_for_operations([CI|LCI],[Seq|LSeq])
:- CI = [LOp,LProp],
   distribute_properties_for_operations(LOp,LProp,Seq),
   distribute_properties_for_operations(LCI,LSeq).

%

distribute_properties_for_operations([],_,[]).

distribute_properties_for_operations([AOp|LOp],LProp,[[AOp,LProp_1]|Sequence])
:- AOp =.. [_|OApArgs],
   get_properties_for_operation(OApArgs,LProp,LProp_1),
   distribute_properties_for_operations(LOp,LProp,Sequence), !.

get_properties_for_operation(_,[],[])
:- !.

get_properties_for_operation(OApArgs,[Prop|LProp],[Prop|LProp_1])
:- Prop =.. [_,Arg|_], strict_member(Arg,OApArgs), !,
   get_properties_for_operation(OApArgs,LProp,LProp_1).

get_properties_for_operation(OApArgs,[_|LProp],LProp_1)
:- get_properties_for_operation(OApArgs,LProp,LProp_1).

%

determine_failure_state(IS,Diag,Op,FS)
:- failure_description(Diag,Op,Del,Add),
   strict_set_difference(IS,Del,St_1),
   append_no_bt(St_1,Add,FS).

%%%
%%
%


build_abstract_plan(AIS,ALG,_,[])
:- goals_satisfied(AIS,ALG),!, write('Goals satisfied !!'), nl.

build_abstract_plan(AIS,ALG,[AO|Plan_sk],APlan)
:- \+ is_a_cluster(AO),!,
write('Considering '),write(AO),nl, %special1(AO,AIS),
   generate_abstract_operations(AIS,AO,LAOA),
   % special1(AO,LAOA),
   try_abstract_operations(AIS,ALG,LAOA,Plan_sk,APlan).

build_abstract_plan(AIS,ALG,[CLUSTER|Plan_sk],APlan)
:- write('Preparing to handle cluster ...'), nl,
   handle_cluster_in_plan_skeleton(AIS,ALG,CLUSTER,Plan_sk,APlan).

special1([assemble(_,cranf_peg2),_],AIS) 
:- % X == _1618, 
   write(AIS),nl,!.
special1(_,_).


generate_abstract_operations(AIS,AO,LAOA_sort)
:- 
writeln('----- generate_abstract_operations'),
   findall(AOA,generate_abstract_operation(AIS,AO,AOA),LAOA),
% write('ALL: '),write(LAOA),nl,
writeln('+++++ generate_abstract_operations'),
   sort_abstract_operations(LAOA,LAOA_sort).

generate_abstract_operation(AIS,[AO,LF],[AO,LF]/Score) % was: [AO,nil]/Score)
                                                       % why???
:- abstract_operator(AO,IL,KL,DL,AL),
   prove_abstract_preconditions(AIS,DL),
   prove_information_list(AIS,IL),
   prove_abstract_preconditions(AIS,KL),
   strict_set_difference(AIS,DL,Next1),
   append_no_bt(Next1,AL,Next2),
   verify_properties(Next2,LF,V,ALL),
   Score is (V+1.0)/(ALL+1.0),
   ( AO = disassemble(_,_), write('==> '), write(AO), write(' '), writeln(Score);
     true
   ).


generate_abstract_operation(AIS,[pick(X),LF],[pick(X),LF]/0)
:- var(X), pickvarnum(X),
   prove_abstract_preconditions(AIS,[free]).

pickvarnum(M)
:- retract(pickvarnum_(N)),!,
   M is N+1, assert(pickvarnum_(M)).

pickvarnum(0)
:- assert(pickvarnum_(0)), !.


prove_information_list(_,[]).

prove_information_list(AIS,[I|IL])
:- ( clause(planning_info(I),true); 
     member_bt(I,AIS);
     I = object_type(X,_), number(X) ),
   prove_information_list(AIS,IL).

prove_abstract_preconditions(_,[]).

prove_abstract_preconditions(AIS,[PC|LPC])
:- prove_abstract_precondition(AIS,PC),
   prove_abstract_preconditions(AIS,LPC).

prove_abstract_precondition(AIS,all(X,SET,Term))
:- ( setof(Term,X^(member_bt(X,SET)),LPC),!; LPC = []),
   prove_abstract_preconditions(AIS,LPC).

prove_abstract_precondition(AIS,(L1->_))
:- \+ prove_abstract_preconditions(AIS,L1).

prove_abstract_precondition(AIS,(L1->L2))
:- prove_abstract_preconditions(AIS,L1),
   prove_abstract_precondition(AIS,L2).

prove_abstract_precondition(AIS,not(PC))
:- \+ prove_abstract_precondition(AIS,PC).

prove_abstract_precondition(AIS,PC)
:- member_bt(PC,AIS).

sort_abstract_operations([AOA/_],[AOA])
:- !.

sort_abstract_operations(LAOA,[AOA|NewLAOA_sort])
:- extract_best_AOA(LAOA,NewLAOA,AOA,_),
   sort_abstract_operations(NewLAOA,NewLAOA_sort),!.

extract_best_AOA([AOA/Score],[],AOA,Score)
:- !.

extract_best_AOA([AOA/Score|LAOA],
                 [OldBestAOA/OldBestScore|NewLAOA],
                 NewBestAOA,NewBestScore)
:- extract_best_AOA(LAOA,NewLAOA,BestAOA,BestScore),
   ( Score > BestScore, !,
        NewBestAOA = AOA, NewBestScore = Score,
        OldBestAOA = BestAOA, OldBestScore = BestScore;
        OldBestAOA = AOA, OldBestScore = Score,
        NewBestAOA = BestAOA, NewBestScore = BestScore
   ).


try_abstract_operations(AIS,ALG,[AOA|_],Plan_sk,APlan)
:- try_abstract_operation(AIS,ALG,AOA,Plan_sk,APlan).

try_abstract_operations(AIS,ALG,[_|LAOA],Plan_sk,APlan)
:- try_abstract_operations(AIS,ALG,LAOA,Plan_sk,APlan).

special_show(pick('obj_#16'),Sit)
:- write('Current sit.: '), write(Sit), nl, !.

special_show(_,_).

try_abstract_operation(AIS,ALG,[AOA,LF],Plan_sk,[[AOA,LF]|APlan])
:- write('Trying ... '),write(AOA), nl,
   apply_abstract_operation(AIS,AOA,NextAIS),
% write('... done'),nl,
% special_show(AOA,NextAIS),
   build_abstract_plan(NextAIS,ALG,Plan_sk,APlan).

apply_abstract_operation(AIS,assemble(X,C),NextAIS)
:- number(X), \+ member_bt(object_type(X,_),AIS),!,
   clause(planning_info(part_mate(_,C,Type,_,_,_,_,_)),true),
   apply_abstract_operation([object_type(X,Type)|AIS],assemble(X,C),NextAIS).

apply_abstract_operation(AIS,AOA,NextAIS)
:- abstract_operator(AOA,_,_,DL,AL),
   strict_set_difference(AIS,DL,LL),
   append_no_bt(LL,AL,NextAIS).

handle_cluster_in_plan_skeleton(AIS,ALG,_,Plan_sk,APlan)
:- write('Ignoring cluster ...'),nl,
   build_abstract_plan(AIS,ALG,Plan_sk,APlan).

handle_cluster_in_plan_skeleton(AIS,ALG,CLUSTER,Plan_sk,APlan)
:- write('Duplicating cluster ...'),write(CLUSTER),nl,
   duplicate_cluster(CLUSTER,[LAO,LF]),
   distribute_cluster_features(LAO,LF,NewLAO),
   append_no_bt(NewLAO,[CLUSTER|Plan_sk],NewPlan_sk),
   build_abstract_plan(AIS,ALG,NewPlan_sk,APlan).

duplicate_cluster([LAO,LF],[NewLAO,NewLF])
:- duplicate_list_of_abstract_operations(LAO,NewLAO,[],VarTable),
   duplicate_list_of_features(LF,VarTable,NewLF).

duplicate_list_of_abstract_operations([],[],VarTable,VarTable)
:- !.

duplicate_list_of_abstract_operations([AO|LAO],[NewAO|NewLAO],VarIn,VarOut)
:- AO =.. [F|Vars], 
   duplicate_var_list(Vars,NewVars,VarIn,Var2),
   NewAO =.. [F|NewVars], !,
   duplicate_list_of_abstract_operations(LAO,NewLAO,Var2,VarOut).

duplicate_var_list([],[],VarIn,VarIn)
:- !.

duplicate_var_list([Atom|Vars],[Atom|NewVars],VarIn,VarOut)
:- atom(Atom), !,
   duplicate_var_list(Vars,NewVars,VarIn,VarOut).


duplicate_var_list([Var|Vars],[NewVar|NewVars],VarIn,VarOut)
:- member_bt([OldVar,NewVar],VarIn), Var == OldVar, !,
   duplicate_var_list(Vars,NewVars,VarIn,VarOut).

duplicate_var_list([Var|Vars],[NewVar|NewVars],VarIn,VarOut)
:- !, duplicate_var_list(Vars,NewVars,[[Var,NewVar]|VarIn],VarOut).

duplicate_list_of_features([],_,[])
:- !.

duplicate_list_of_features([F|LF],VarTable,[NewF|NewLF])
:- F =.. [Fname,Var|Vars],
   member_bt([OldVar,NewVar],VarTable),
   OldVar == Var,
   NewF =.. [Fname,NewVar|Vars], !,
   duplicate_list_of_features(LF,VarTable,NewLF).


distribute_cluster_features([],_,[])
:- !.

distribute_cluster_features([AO|LAO],LF,[[AO,NewLF]|NewLAO])
:- AO =.. [_|Vars],
   find_operation_features(Vars,LF,NewLF), !,
   distribute_cluster_features(LAO,LF,NewLAO).


find_operation_features(_,[],[])
:- !.

find_operation_features(Vars,[F|LF],[F|NewLF])
:- F =.. [_,Var|_], strict_member(Var,Vars), !,
   find_operation_features(Vars,LF,NewLF).

find_operation_features(Vars,[_|LF],NewLF)
:- !, find_operation_features(Vars,LF,NewLF).

%

replace_numbers_by_variables(_,[],[]).

replace_numbers_by_variables(VarList,[Step_num|APlan_num],[Step|APlan])
:- replace_step_numbers_by_variables(VarList,LV,Step_num,Step),
   replace_numbers_by_variables(LV,APlan_num,APlan).


replace_step_numbers_by_variables(VarList,LV,[Op_num,nil],[Op,nil])
:- !, replace_term_numbers_by_variables(VarList,LV,Op_num,Op).

replace_step_numbers_by_variables(VarList,LV2,[Op_num,LF_num],[Op,LF])
:- replace_term_numbers_by_variables(VarList,LV1,Op_num,Op),
   replace_termlist_numbers_by_variables(LV1,LV2,LF_num,LF).

replace_termlist_numbers_by_variables(VarList,VarList,[],[]).

replace_termlist_numbers_by_variables(VarList,LV2,[F_num|LF_num],[F|LF])
:- replace_term_numbers_by_variables(VarList,LV1,F_num,F),
   replace_termlist_numbers_by_variables(LV1,LV2,LF_num,LF).

replace_term_numbers_by_variables(VarList,LV,F_num,F)
:- F_num =.. [Funct|Args_num],
   replace_args_numbers_by_variables(VarList,LV,Args_num,Args),
   F =.. [Funct|Args].

replace_args_numbers_by_variables(VarList,VarList,[],[]).

replace_args_numbers_by_variables(VarList,LV2,[Arg_num|Args_num],[Arg|Args])
:- replace_number_by_variable(VarList,LV1,Arg_num,Arg),
   replace_args_numbers_by_variables(LV1,LV2,Args_num,Args).

replace_number_by_variable(VarList,VarList,Arg_num,Arg_num)
:- \+ number(Arg_num), !.

replace_number_by_variable(VarList,VarList,Arg_num,Arg)
:- member_bt([Arg_num,Arg],VarList), !.

replace_number_by_variable(VarList,[[Arg_num,Arg]|VarList],Arg_num,Arg)
:- !.

%%%
%%
%

adapt_recovery_skeleton(Prob,FS,Skeleton,LG)
:- initialize_detailed_planning(Prob,FS,Skeleton,LG),
   detailed_recovery_planning.

initialize_detailed_planning(Prob,FS,Skeleton,LG)
:- % planning_gc,        % defined in planeador.pro
   assert(current_problem(Prob)),
   assert(recovery_goals(LG)),
   init_identifier(0),
   init_closed_node_counter(0),
   estimate_skeleton_expansion(Skeleton,Est),
   assert(no(open,0,-1,no_op,0,Est)),
   add_to_binary_order(0,Est),
   define_current_state(0,FS),
   assert(remaining_skeleton(0,Skeleton)).

%

estimate_skeleton_expansion([],0).

estimate_skeleton_expansion([Cluster|Skeleton],N)
:- is_a_cluster_expansion(Cluster), !,
   list_length(Cluster,K1),
   Cluster = [Sequence|_], list_length(Sequence,K2),
   estimate_skeleton_expansion(Skeleton,K3),
   N is 2.8*K1*K2+K3.

estimate_skeleton_expansion([_|Skeleton],N)
:- estimate_skeleton_expansion(Skeleton,K),
   N is K + 2.5.

%

is_a_cluster_expansion([[_,_]|_]).

%


planning_iteration(Id)
:- % mostrar_no(Id),
   redefine_no(closed,Id),
   delete_in_binary_order(Id),
   increment_closed_node_counter(_),
   explode_rec_node(Id).


detailed_recovery_planning
:- find_best_abo(Id,_,_,_,_),
   ( 
     rec_node_statisfies_goals(Id),
     get_solution(Id,Plan),
     show_plan(Plan),
     retractall(last_recovery_plan(_)),
     assert(last_recovery_plan(Plan))
     ;
     planning_iteration(Id),
     detailed_recovery_planning
   ).

%

rec_node_statisfies_goals(Id)
:- current_state(Id,CS),
   recovery_goals(LG),
   goals_satisfied(CS,LG).

%

explode_rec_node(Id)
:- current_state(Id,CS),
   no(_,Id,Father,Op,Cost,_),
   remaining_skeleton(Id,Skeleton), 
   Skeleton = [Step|SkTail],
   explode_with_step(Id,CS,Father,Op,Cost,Step,SkTail),
   explode_with_auxiliary_operations(Id,CS,Cost,Skeleton).

%

explode_with_auxiliary_operations(Id,CS,Cost,Skeleton)
:- generate_auxiliary_operations(CS,LOp),
   estimate_skeleton_expansion(Skeleton,Est),
   try_concrete_operations(Id,CS,LOp,Cost,Skeleton,Est).

generate_auxiliary_operations(CS,LOp)
:- findall([Op,1],( abstract_operator_application(Op,[]),
                    select_operator_application(CS,Op)        ), LOp).

%

explode_with_step(Id,CS,Father,Op,Cost,Cluster,Skeleton)
:- is_a_cluster_expansion(Cluster), !,
   explode_with_cluster_expansion(Id,CS,Father,Op,Cost,[],Cluster,Skeleton).

explode_with_step(Id,CS,_,_,Cost,Step,Skeleton)
:- !, 
   generate_concrete_operations(CS,Step,LOp),
   estimate_skeleton_expansion(Skeleton,Est),
   try_concrete_operations(Id,CS,LOp,Cost,Skeleton,Est).

%%%%
%%
%

generate_concrete_operations(CS,[AOp,LProp],LOp)
:- findall([OA,Cost],generate_concrete_operation(CS,AOp,LProp,OA,Cost),LOp).

%

generate_concrete_operation(CS,AOp,LProp,OA,Cost)
:- abstract_operator_application(OA,[AOp]), % definido em operators_mth.pro
   operator_functionality(OA,IL,KL,DL,AL),
   world_info_matching(CS,IL),
   append_no_bt(KL,DL,LPC),
   preconditionlist_matching(CS,LPC),
   strict_set_difference(CS,DL,Next1),
   append_no_bt(Next1,AL,Next2),
   verify_properties(Next2,LProp,V,N),
   Cost is (N+1)/(V+1).


verify_properties(_,nil,0,0)
:- !.

verify_properties(_,[],0,0)
:- !.

verify_properties(NextState,[Prop|LProp],V,N)
:- verify_property(NextState,Prop), !,
   verify_properties(NextState,LProp,V1,N1),
   V is V1+1, N is N1+1.

verify_properties(NextState,[_|LProp],V,N)
:- !,
   verify_properties(NextState,LProp,V,N1),
   N is N1+1.

%

try_concrete_operations(_,_,[],_,_,_).

try_concrete_operations(Id,CS,[Op|LOp],Cost,Skeleton,Est)
:- 
   try_concrete_operation(Id,CS,Op,Cost,Skeleton,Est),!,
   try_concrete_operations(Id,CS,LOp,Cost,Skeleton,Est).

%

try_concrete_operation(Id,CS,[Op,CostFactor],Cost,Skeleton,Est)
:- operator_functionality(Op,_,_,Del,Add),
   strict_set_difference(CS,Del,LC),
   append_no_bt(LC,Add,NCS),
   get_identifier(Last),
   N is Last+1,
   set_identifier(N),
   define_current_state(N,NCS),
   assert(remaining_skeleton(N,Skeleton)),
   get_operator_cost(Op,CostOp),
   NewCost is Cost + CostOp*CostFactor,
   assert(no(open,N,Id,Op,NewCost,Est)),
   TotalCost is NewCost+Est,
   add_to_binary_order(N,TotalCost),
   findall(Eq,get_equivalent_node(open,N,Eq),L_eq_open),
   check_open(N,L_eq_open,Id_to_comp),
   findall(Eq,get_equivalent_node(closed,Id_to_comp,Eq),L_eq_closed),
   check_closed(Id_to_comp,L_eq_closed).

%

get_equivalent_node(OC,Id,Equiv)
:- no(OC,Equiv,_,_,_,_), Equiv \== Id,
   remaining_skeleton(Id,Sk), remaining_skeleton(Equiv,EquivSk), Sk = EquivSk,
   state_features(Id,F1457,F236,_),state_features(Equiv,F1457,F236,_),
   current_state(Equiv,S1), current_state(Id,CS),
   current_problem(Prob),goal_state(Prob,GS),
   equivalent_state(CS,S1,GS).

%%%%
%%
%



explode_with_cluster_expansion(_,_,_,_,_,_,[],_)
:- !.

explode_with_cluster_expansion(Id,CS,Father,Op,Cost,Seen,[Seq|LSeq],Skeleton)
:- 
   append_no_bt(Seen,LSeq,Cluster),
   integrate_cluster_in_tail(Cluster,Skeleton,Tail),
   append_no_bt(Seq,Tail,NewSk),
   create_new_node(_,Father,Op,Cost,CS,NewSk),!,
   explode_with_cluster_expansion(Id,CS,Father,Op,Cost,[Seq|Seen],LSeq,Skeleton).

integrate_cluster_in_tail([],Skeleton,Skeleton)
:- !.

integrate_cluster_in_tail(Cluster,Skeleton,[Cluster|Skeleton])
:- !.

create_new_node(Id,Father,Op,Cost,CS,Skeleton)
:- get_identifier(IdLast),
   Id is IdLast+1,
   set_identifier(Id),
   define_current_state(Id,CS),
   assert(remaining_skeleton(Id,Skeleton)),
   estimate_skeleton_expansion(Skeleton,Est),
   assert(no(open,Id,Father,Op,Cost,Est)),
   TotalCost is Cost+Est,
   add_to_binary_order(Id,TotalCost),
   findall(Eq,get_equivalent_node(open,Id,Eq),L_eq_open),
   check_open(Id,L_eq_open,Id_to_comp),
   findall(Eq,get_equivalent_node(closed,Id_to_comp,Eq),L_eq_closed),
   check_closed(Id_to_comp,L_eq_closed).




