% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%
%     Kerberos Planner -- Learning utilities
%     (c) L. Seabra Lopes, 09/1995 
%
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%%
%%

generalize_plan(Plan,Plan_g,Info,Info_g,IS,IS_g,GS,GS_g)
:- initialize_generalization_context,
   determine_initial_state(Plan,_,IS,Info), 
   variabilize_list_of_terms(IS,IS_g),
   variabilize_list_of_terms(Info,Info_g),
   variabilize_list_of_terms(Plan,Plan_g),
   prove_plan(Plan,Plan_g,Info,Info_g,IS,IS_g,GS,GS_g),
   cleanup_generalization_context.

%

initialize_generalization_context
:- clause(in_generalization_context,true),!.

initialize_generalization_context
:- assert(in_generalization_context).

cleanup_generalization_context
:- retractall(in_generalization_context).

%
   
determine_initial_state(P,GS,IS,Info)
:- determine_initial_state(P,[],GS,[],IS,[],Info).

determine_initial_state([],CS,CS,IS,IS,Info,Info)
:- !.

determine_initial_state([OP|P],CS,CS_final,IS,IS_final,Info,Info_final)
:- op_requirements_from_initial_state(OP,CS,CS_ud,IS,IS_ud,Info,Info_ud),
   determine_initial_state(P,CS_ud,CS_final,IS_ud,IS_final,Info_ud,Info_final).

op_requirements_from_initial_state(OP,CS,CS_ud_2,IS,IS_ud,Info,Info_ud)
:- instanciate_world_information(OP,CS,LI),
   operator_conditions_for_proof(OP,LI,LK,LD,LA),
   add_world_information(CS,Info,LI,Info_ud),
   %reunion(Info,LI,Info_ud),
   append_no_bt(LK,LD,PC),
   update_initial_state(PC,CS,CS_ud,IS,IS_ud),
   delete_conditions(CS_ud,LD,CS_ud_1),
   add_conditions(CS_ud_1,LA,CS_ud_2).

%

instanciate_world_information(OP,CS,LI)
:- operator_functionality(OP,LI,_,_,_),
   instanciate_world_information(CS,LI).

instanciate_world_information(_,[]).
instanciate_world_information(CS,[I|LI])
:- ( ground(I); clause(planning_info(I),true); member_bt(I,CS) ),
   instanciate_world_information(CS,LI).

%

operator_conditions_for_proof(OP,LI,[K1,K2|LK3],LD,LA)
:- OP = assemble_component(_,_,_,_,_,_,_),!,
   operator_functionality(OP,LI,[K1,K2,_,_,_,_,K3,_],LD,LA),
   expand_components_assembled(K3,LK3).

operator_conditions_for_proof(OP,LI,[K1,K2],LD,LA)
:- OP = dissassemble_component(_,_,_,_,_,_,_),!,
   operator_functionality(OP,LI,[_,_,K1,_,K2],LD,LA).

operator_conditions_for_proof(OP,LI,LK,LD,LA)
:- operator_functionality(OP,LI,LK,LD,LA).


expand_components_assembled(all(_,LPrevM,[component_assembled(_,Prod,Fix)]),L)
:- expand_components_assembled(LPrevM,Prod,Fix,L).

expand_components_assembled([],_,_,[]).

expand_components_assembled([C|LPrev],Prod,Fix,[CA|L])
:- !, CA = component_assembled(C,Prod,Fix),
   expand_components_assembled(LPrev,Prod,Fix,L).

%

add_world_information(_,Info,[],Info)
:- !.

add_world_information(CS,Info,[I|LI],Info_ud)
:- member_bt(I,CS), !,
   add_world_information(CS,Info,LI,Info_ud).

add_world_information(CS,Info,[I|LI],Info_ud)
:- member_bt(I,Info), !,
   add_world_information(CS,Info,LI,Info_ud).

add_world_information(CS,Info,[I|LI],[I|Info_ud])
:- !, add_world_information(CS,Info,LI,Info_ud).

%

update_initial_state([],CS,CS,IS,IS)
:- !.

update_initial_state([not(_)|PC],CS,CS_ud,IS,IS_ud)
:- !, update_initial_state(PC,CS,CS_ud,IS,IS_ud).

update_initial_state([C|PC],CS,CS_ud,IS,IS_ud)
:- member_bt(C,CS),!,
   update_initial_state(PC,CS,CS_ud,IS,IS_ud).

update_initial_state([C|PC],CS,CS_ud,IS,IS_ud)
:- update_initial_state(PC,[C|CS],CS_ud,[C|IS],IS_ud).

%  Variabilization: original predicates

variabilize_list_of_terms([],[])
:- !.

variabilize_list_of_terms([T|L1],[G|L2])
:- variabilize_term(T,G),
   variabilize_list_of_terms(L1,L2).

variabilize_term(not(T),not(G))
:- !, variabilize_term(T,G).

variabilize_term(component_contacts(_,LC),component_contacts(_,LG))
:- !, varargs(LC,LG).

variabilize_term(part_mate(_,_,_,_,_,_,Prev,Next),part_mate(_,_,_,_,_,_,G1,G2))
:- !, varargs(Prev,G1), varargs(Next,G2).

variabilize_term(T,G)
:- T =.. [H|A],
   varargs(A,V),
   G =.. [H|V],!.

varargs([],[])
:- !.

varargs([_|Y],[_|B])
:- varargs(Y,B).

%  Variabilization: new predicates, developed for RACE
%  to create a mapping from constants to variables

variabilize_list_of_terms([],[],Map,Map)
:- !.

variabilize_list_of_terms([T|L1],[G|L2],MapIn,MapOut)
:- variabilize_term(T,G,MapIn,MapAux),
   variabilize_list_of_terms(L1,L2,MapAux,MapOut).

variabilize_term(not(T),not(G),MapIn,MapOut)
:- !, variabilize_term(T,G,MapIn,MapOut).

variabilize_term(T,G,MapIn,MapOut)
:- T =.. [H|A],
   varargs(A,V,MapIn,MapOut),
   G =.. [H|V],!.

varargs([],[],Map,Map)
:- !.

varargs([X|Y],[A|B],Map,[(X,A)|MapAux])
:- varargs(Y,B,Map,MapAux).

% compress mapping of variables to constants

compress_variable_mapping([],[])
:- !.

compress_variable_mapping([(C,V)|Map],[(C,V)|MapCompressed])
:- remove_variable_repetitions(C,V,Map,MapAux),
   compress_variable_mapping(MapAux,MapCompressed).

remove_variable_repetitions(_,_,[],[])
:- !.

remove_variable_repetitions(C,V,[(K,W)|Map],Map2)
:- %print('C'-C), print('K'-K), print('V'-V), print('W'-W), nl,
   C==K, V==W, !,
   remove_variable_repetitions(C,V,Map,Map2).

remove_variable_repetitions(C,V,[(K,W)|Map],[(K,W)|Map2])
:- remove_variable_repetitions(C,V,Map,Map2).


% Generalize list of key properties
% based on a mapping of constants to variables,
% and extend the mapping if needed:
% -- developed for RACE

generalize_keyprops_from_mapping([],Map,[],Map)
:- !.

generalize_keyprops_from_mapping([Prop_c|KeyProps_c],MapIn,[Prop_g|KeyProps_g],MapOut)
:- Prop_c =.. [F|[Term_c]],
   %   writeln(Prop_c),
   generalize_term_from_mapping(Term_c,MapIn,Term_g,MapAux),
   Prop_g =.. [F|[Term_g]],!,
   %   writeln(Prop_g),
   generalize_keyprops_from_mapping(KeyProps_c,MapAux,KeyProps_g,MapOut).
 

% Generalize a term based on a mapping 
% of constants to variables, and extend the mapping if needed:
% -- developed for RACE

generalize_term_from_mapping(Term_c,MapIn,Term_g,MapOut)
:- Term_c =.. [F|Args_c],
   %   (Args_c = [mug1|_], writeln('mug1 found' - Term_c); true ),
   generalize_args_from_mapping(Args_c,MapIn,Args_g,MapOut),
   %   (Args_c = [mug1|_], writeln('mug1 done ' - Term_g); true ),
   Term_g =.. [F|Args_g], !.
   
generalize_args_from_mapping([],Map,[],Map)
:- !.

generalize_args_from_mapping([Const|LConsts],MapIn,[Var|LVars],MapOut)
:- generalize_arg_from_mapping(Const,MapIn,Var,MapAux),!,
   generalize_args_from_mapping(LConsts,MapAux,LVars,MapOut).

generalize_arg_from_mapping(Const,Map,Var,Map)
:- [(Const,Var)|_] = Map, !.

generalize_arg_from_mapping(Const,MapIn,Var,MapOut)
:- [H|Map] = MapIn, !, 
   generalize_arg_from_mapping(Const,Map,Var,MapAux), 
   MapOut=[H|MapAux].

generalize_arg_from_mapping(Const,[],Var,[(Const,Var)])
:- !.
 

%%  prove_plan: P,    P_g     -- plan, generalized plan
%%              Info, Info_g  -- world information and its generalization
%%              CS,   CS_g    -- current state and its generalization
%%              GS,   GS_g    -- goal state and its generalization

prove_plan([],[],_,_,CS,CS_g,GS,GS_g)
:- same_state(CS,GS,CS_g,GS_g).

prove_plan([Op|P],[Op_g|P_g],Info,Info_g,CS,CS_g,GS,GS_g)
:- apply_operator_g(Op,Op_g,Info,Info_g,CS,CS_g,NS,NS_g),
   prove_plan(P,P_g,Info,Info_g,NS,NS_g,GS,GS_g).

%
same_state([],[],[],[]).

same_state([C|CS],GS,[C_g|CS_g],GS_g)
:- extract_state_condition(C,GS,GS_1,C_g,GS_g,GS_g_1),
   same_state(CS,GS_1,CS_g,GS_g_1).

extract_state_condition(C,[C|GS],GS,C_g,[C_g|GS_g],GS_g).

extract_state_condition(C,[D|GS],[D|GS_1],C_g,[D_g|GS_g],[D_g|GS_g_1])
:- C \= D, extract_state_condition(C,GS,GS_1,C_g,GS_g,GS_g_1).

same_state([],[]).

same_state([F|S1],S2)
:- get_member(F,S2,S3),
   same_state(S1,S3).

%

apply_operator_g(Op,Op_g,Info,Info_g,CS,CS_g,NS,NS_g)
:- operator_functionality(Op,LI,LK,LD,LA),
   operator_functionality(Op_g,LI_g,LK_g,LD_g,LA_g),
   prove_information_g(CS,Info,LI,CS_g,Info_g,LI_g),
   append_no_bt(LK,LD,LPC),
   append_no_bt(LK_g,LD_g,LPC_g),
   prove_preconditions_g(CS,LPC,CS_g,LPC_g),
   delete_conditions_g(CS,LD,S1,CS_g,LD_g,S1_g),
   add_conditions_g(S1,LA,NS,S1_g,LA_g,NS_g).

%

prove_information_g(_,_,[],_,_,[]).

prove_information_g(CS,Info,[I|LI],CS_g,Info_g,[I_g|LI_g])
:- ( prove_fact_g(I,Info,I_g,Info_g); prove_fact_g(I,CS,I_g,CS_g) ),
   prove_information_g(CS,Info,LI,CS_g,Info_g,LI_g).

prove_fact_g(I,[I|_],I_g,[I_g|_]).

prove_fact_g(I,[J|Info],I_g,[_|Info_g])
:- I\=J, prove_fact_g(I,Info,I_g,Info_g).

%

prove_preconditions_g(_,[],_,[]).

prove_preconditions_g(CS,[PC|LPC],CS_g,[PC_g|LPC_g])
:- prove_precondition_g(CS,PC,CS_g,PC_g),
   prove_preconditions_g(CS,LPC,CS_g,LPC_g).

prove_precondition_g(CS,all(X,SET,Term),CS_g,all(X_g,SET_g,Term_g))
:- expand_all_condition(X,Term,SET,LC),
   expand_all_condition(X_g,Term_g,SET_g,LC_g),
   %findall(Term,member_bt(X,SET),LC),
   %findall(Term_g,member_bt(X_g,SET_g),LC_g),
   prove_preconditions_g(CS,LC,CS_g,LC_g).

prove_precondition_g(CS,(Body -> _), CS_g, (Body_g -> _) )
:- \+ prove_preconditions_g(CS,Body,CS_g,Body_g).

prove_precondition_g(CS,(Body -> Head), CS_g, (Body_g -> Head_g) )
:- prove_preconditions_g(CS,Body,CS_g,Body_g),
   prove_precondition_g(CS,Head,_,Head_g).

prove_precondition_g(CS,[H|T],CS_g,[H_g|T_g])
:- prove_preconditions_g(CS,[H|T],CS_g,[H_g|T_g]).

prove_precondition_g(CS,not(PC),_,not(_))
:- \+ member_bt(PC,CS).

prove_precondition_g([PC|_],PC,[PC_g|_],PC_g).

prove_precondition_g([C|CS],PC,[_|CS_g],PC_g)
:- PC \= C, prove_precondition_g(CS,PC,CS_g,PC_g).

%

expand_all_condition(_,_,[],[])
:- !.

expand_all_condition(X,Cond,[Arg|Domain],[Cond_e|LCond])
:- expand_condition_to_arg(X,Cond,Arg,Cond_e),
   expand_all_condition(X,Cond,Domain,LCond).

expand_condition_to_arg(X,(Body->Head),Arg,(Body_e->Head_e))
:- expand_condition_to_arg(X,Body,Arg,Body_e),
   expand_condition_to_arg(X,Head,Arg,Head_e).

expand_condition_to_arg(_,[],_,[])
:- !.

expand_condition_to_arg(X,[Term|LT],Arg,[Term_e|LT_e])
:- !, expand_condition_to_arg(X,Term,Arg,Term_e),
   expand_condition_to_arg(X,LT,Arg,LT_e).

expand_condition_to_arg(X,not(Term),Arg,not(Term_e))
:- !, expand_condition_to_arg(X,Term,Arg,Term_e).

expand_condition_to_arg(X,Term,Arg,Term_e)
:- Term =.. [F|Args],
   ( \+ strict_member(X,Args), !, Term_e = Term;
     decompose_all_args(Args,X,T1,T2),
     append_no_bt(T1,[Arg|T2],Args_e), Term_e =.. [F|Args_e] ).

%    decompose_all_args(Args,X,T1,T2),
%    append_no_bt(T1,[Arg|T2],Args_e), Term_e =.. [F|Args_e];
%    Term_e = Term ).

%  ( \+ strict_member(X,Args), !, Term_e = Term;
%    decompose_all_args(Args,X,T1,T2),
%    append_no_bt(T1,[Arg|T2],Args_e), Term_e =.. [F|Args_e] ).

decompose_all_args([A|Args],X,[],Args)
:- A == X, !.

decompose_all_args([A|Args],X,[A|T1],T2)
:- decompose_all_args(Args,X,T1,T2).

%

delete_conditions_g(CS,[],CS,CS_g,[],CS_g).

delete_conditions_g(CS,[D|LD],NS_2,CS_g,[D_g|LD_g],NS_g_2)
:- delete_condition_g(CS,D,NS,CS_g,D_g,NS_g),
   delete_conditions_g(NS,LD,NS_2,NS_g,LD_g,NS_g_2).

delete_condition_g([D|CS],D,CS,[D_g|CS_g],D_g,CS_g).

delete_condition_g([C|CS],D,[C|NS],[C_g|CS_g],D_g,[C_g|NS_g])
:- C\=D, delete_condition_g(CS,D,NS,CS_g,D_g,NS_g).

%

delete_conditions(S,[],S).
delete_conditions(S1,[D|LD],S3)
:- get_member(D,S1,S2),
   delete_conditions(S2,LD,S3).

%

add_conditions_g(CS,LA,NS,CS_g,LA_g,NS_g)
:- append_no_bt(CS,LA,NS), append_no_bt(CS_g,LA_g,NS_g).

%

add_conditions(S1,LA,S2)
:- append_no_bt(S1,LA,S2).

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


%%
%%

assert_macro_operator(Plan)
:- build_macro_operator(Plan,[Template,LI,LK,LD,LA]),
   assert(operator(Template,LI,LK,LD,LA)),
   list_length(Plan,N),
   assert(operator_details(Template,not_primitive,N)).

build_macro_operator(Plan,Operator)  % nao foi testado nesta versao
:- initialize_generalization_context,
   determine_complete_initial_state(Plan,IS,Info), % include all assumptions
                                                   % e.g. not defective(Obj)
                                                   % in order to define
                                                   % macro-operators, like in
                                                   % the previous version.
                                                   % Not implemented here.
   variabilize_list(IS,GIS),
   variabilize_list(Info,GInfo),
   variabilize_list(Plan,GPlan),
   prove_plan(GPlan,GInfo,GIS,GGS),
   cleanup_generalization_context,
   define_operator_conditions(GPlan,GIS,GGS,GInfo,LK,LD,LA),
   define_operator_template(GPlan,Template,_),
   Operator = [Template,GInfo,LK,LD,LA],!.

%

define_operator_conditions(GPlan,S1,S2,LI,LK,LD,LA)
:- strict_reunion(S1,S2,S3),
   strict_set_difference(S3,S2,LD),
   strict_set_difference(S3,S1,LA),
   strict_set_difference(S3,LD,S4),
   strict_set_difference(S4,LA,S5),
   check_assemble(GPlan,S5,LI,LK).

check_assemble(GPlan,LK,LI,[C1,C2,C3|LK])
:- member_bt(assemble_component(_,_,_,Comp,Part,Prod,Fix),GPlan),!,
   member_bt(part_mate(Prod,Comp,Part,_,_,_,LPrevM,_),LI),
   member_bt(component_contacts(Comp,LCont),LI),
   C1 = not(component_assembled(Comp,Prod,Fix)),
   C2 = all(M,LPrevM, [ component_assembled(M,Prod,Fix) ]),
   C3 = all(C,LCont ,([ component_assembled(C,Prod,Fix),
                        represented_by(C,X) ] -> not(defective(X)) ) ).

check_assemble(_,LK,_,LK).





%

define_operator_template(GPlan,Template,N)
:- list_length(GPlan,N),
   findall(X,   ( member_bt(Op,GPlan),
                  operator_details(Op,[A,B],_),
                  ( N>2, name(B,X); name(A,X) ) ), LX),
   build_operator_name(LX,Name),
   name(AtomName,Name),
   setof(Vars,[Op,H]^( member_bt(Op,GPlan), Op =.. [H|Vars] ), LVars),
   build_operator_arglist(LVars,ArgList),
   Template =.. [AtomName|ArgList].
   
%

build_operator_name([],Name)
:- update_atom_serial_number(N),
   name(N,Name),!.

build_operator_name([X|LX],Name)
:- build_operator_name(LX,N),
   append_no_bt(X,[95|N],Name).

%

build_operator_arglist([],[]).

build_operator_arglist([Vars|LVars],ArgList)
:- build_operator_arglist(LVars,AL),
   strict_reunion(Vars,AL,ArgList).

