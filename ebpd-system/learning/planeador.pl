% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%
%     Kerberos Planner
%     (c) L. Seabra Lopes, 08/1995 
%
% 
%
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	gp/0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



initialize_planner(Prob):-
	initial_state(CS),          	        % CS = current state
	goal_state(Prob,LG),             	% LG = list of goals
        assert(current_problem(Prob)),
write('ES:   '),print_state(CS),
write('EF:   '),print_state(LG),
	init_identifier(0),
        init_closed_node_counter(0),
	define_current_state(0,CS),	% 0 e'o identificador do estado inicial
	determine_goals(CS,LG,OPG,ONPG),
	calculate_estimate(0,OPG,ONPG,Est),
	add_to_binary_order(0,Est),
%assert(branching_factor_statistics(0,0)),
	assert(no( open,0,-1,no_op,0,Est)).	% o de open


gp(Prob):-
	planning_gc,
	% index(no/6,2/1000),
        % index(current_state/2,1/1000),
	initialize_planner(Prob),
	planner.

	inp(Prob) :- 
	planning_gc,
	initialize_planner(Prob).

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	planner/0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pos :-
	find_best_abo(Id,_,_,Cost,_),
	redefine_no(closed,Id),
	delete_in_binary_order(Id),
% mostrar_no(Id),
	generate_operator_applications(Id,LOpApp),
	write(LOpApp),nl,
	try_operator_applications(LOpApp,Id,Cost), !.

notice_assemble(OA)
:- OA = assemble_component(_,_,_,_,_,_,_,_,_,_,_), 
   print_list(['***',nl,
               '***',nl,
               '***',OA,nl,
               '***',nl,
               '***',nl]),!.
notice_assemble(_).


planner_step(Rec)
:- %clean_up_this_mess(50,0.05),
   find_best_abo(Id,_,OA,Cost,Est),
   notice_assemble(OA),
   planner2(Id,OA,Cost,Est,Rec).


planner
:- planner_step(Rec),
   Rec = norec, !.
planner:- planner.


planner2(Id,_,Cost,_, norec)
:- goal_state_satisfied(Id), !,
   better_cost_than_previous(Cost),
   get_solution(Id, Path),
   current_problem(Prob),
   retractall(problem_solution(Prob,_)),
   assert(problem_solution(Prob,Path)),
   show_plan(Path).

planner2(Id,OA,Cost,Est,rec)
:- print_list(['Cost: ', Cost ,nl,'Estimate:',Est,nl,
               'Id: ',Id,nl,'OpApp:' ,OA,nl]),
   redefine_no(closed,Id),
   delete_in_binary_order(Id),
   increment_closed_node_counter(_),
%(Id > 300,!,fail;true),
   generate_operator_applications(Id,LOpApp),
%branch_statistics(LOpApp),
   try_operator_applications(LOpApp,Id,Cost), !.


/*

planner:-
	%clean_up_this_mess(50,0.05),
	find_best_abo(Id,_,OA,Cost,Est),
	notice_assemble(OA),
	( 	goal_state_satisfied(Id),
		better_cost_than_previous(Cost),
		get_solution(Id, Path),
		current_problem(Prob),
		retractall(problem_solution(Prob,_)),
		assert(problem_solution(Prob,Path)),
		show_plan(Path)
		;
print_list(['Cost: ', Cost ,nl,'Estimate:',Est,nl,'Id: ',Id,nl,'OpApp:' ,OA,nl]),
		redefine_no(closed,Id),
		delete_in_binary_order(Id),
		increment_closed_node_counter(_),
		%(Id > 300,!,fail;true),
		generate_operator_applications(Id,LOpApp),
%branch_statistics(LOpApp),
		try_operator_applications(LOpApp,Id,Cost),
		planner
	).

*/

branch_statistics(LOpApp)
:- write('***'),nl,
   retract(branching_factor_statistics(NC,NO)),
   NC1 is NC+1,
   list_length(LOpApp,N),
   %write(LOpApp),nl,
   %N = 3,
   NO1 is NO+N,
%print_list(['========> ',NC1,'/',NO1,nl]),
   assert(branching_factor_statistics(NC1,NO1)),!,
   write('***'),nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	try_operator_applications/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
try_operator_applications([],_,_).
try_operator_applications([OA|LOA],Id,Cost):-
	try_operator_application(OA,Id,Cost),
	try_operator_applications(LOA,Id,Cost). 

try_operator_application(OA,Id,Cost):- 
	generate_new_state(Id,OA,IdNew),
	generate_new_list_of_goals(IdNew,OPG,ONPG),
	calculate_estimate(IdNew,OPG,ONPG,Est),
        get_operator_cost(OA,Cost_OA),
	NewCost is Cost + Cost_OA,
	define_no(IdNew,Id,OA,NewCost,Est).

get_operator_cost(OA,Cost)
:- OA =.. [Operator|_], get_value(Operator,op_cost,Cost),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	define_no/8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mostrar_no(Id)
:- no(OC,Id,Father,_,Cost,Est),
   print_list(['      Id = ',Id,' (',OC,') / Father = ',Father,nl]),
   print_list(['      H = ',Cost,' + ',Est,nl]).

define_no(Id,Father,Path,Cost,Est):-
        TotalCost is Cost+Est,
        add_to_binary_order(Id,TotalCost),
	assert(no(open,Id,Father,Path,Cost,Est)),
	findall(Eq,get_equivalent_state(open,Id,Eq),L_eq_open),
	check_open(Id,L_eq_open,Id_to_comp),
	findall(Eq,get_equivalent_state(closed,Id_to_comp,Eq),L_eq_closed),
	check_closed(Id_to_comp,L_eq_closed).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	get_equivalent_state/3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_equivalent_state(OC,Id,Equiv)
:- no(OC,Equiv,_,_,_,_), Equiv \== Id,
   state_features(Id,F1457,F236,_),state_features(Equiv,F1457,F236,_),
   current_state(Equiv,S1), current_state(Id,CS),
   current_problem(Prob),goal_state(Prob,GS),
write('Testing equivalence between '),write(Id),write(' and '),write(Equiv),nl,
   equivalent_state(CS,S1,GS), writeln(equivalent).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	check_open/3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

check_open(I,[],I):-!.
check_open(Id,[I|L],I_C):-
	no(_,Id,_,_,C1,_), no(_,I,_,_,C2,_),
	( C1 < C2,!, Keep = Id, Rem = I; Keep = I, Rem = Id ),
        delete_in_binary_order(Rem),
        remove_planning_state(Rem),
        check_open(Keep,L,I_C),
        write('node '), write(Rem), writeln(' removed').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	check_closed/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

check_closed(_,[]):-!.
check_closed(Id,[I|L]):-
	no(_,Id,_,_,C1,_), no(_,I,_,_,C2,_),
	( C1 < C2,!, Keep = Id, Rem = I; Keep = I, Rem = Id ),
        delete_childs(Rem),
        delete_in_binary_order(Rem),
        remove_planning_state(Rem),
        check_closed(Keep,L).



delete_childs(Father):-
	findall( IA,( retract(no(_,IA,Father,_,_,_)),
                      retract(current_state(IA,_)),
                      delete_in_binary_order(IA),
                      delete_childs(IA) ),
		 _ ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	remove_planning_state/1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

remove_planning_state(Id)
:- retract(no(OC,Id,_,_,_,_)),
      % for statistics:
      assert(nod(OC,Id)),
   retract(state_features(Id,_,_,_)),
   retract(current_state(Id,_)),
   ( retract(remaining_skeleton(Id,_)), !; true).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	define_current_state/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

define_current_state(Id,CS)
:- %( retract(current_state(Length,_)); true ),
   assert(current_state(Id,CS)),!,
   get_planning_state_features(CS,Features),
   Features = [F1,F2,F3,F4,F5,F6,F7],
   F1457 is F1+10*F4+100*F5+1000*F7, F236 is F2+100*F3+10000*F6,
   assert(state_features(Id,F1457,F236,Features)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       add_to_binary_order/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

add_to_binary_order(Id,Cost)
:- clause(binary_order_root(N),true), !,
   clause(binary_order(N,C,P,L,R),true),
   add_to_binary_order(N,C,P,L,R,Id,Cost).

add_to_binary_order(Id,Cost)
:- assert(binary_order_root(Id)),
   assert(binary_order(Id,Cost,-1,-1,-1)),!.

add_to_binary_order(N,C,P, L,-1, Id,Cost)
:- Cost > C, !,
   retract(binary_order(N,C,P,L,-1)),
   assert(binary_order(N,C,P,L,Id)),
   assert(binary_order(Id,Cost,N,-1,-1)).

add_to_binary_order(N,C,_, _,R, Id,Cost)
:- Cost > C, !, 
   clause(binary_order(R,C1,N,L1,R1),true),
   add_to_binary_order(R,C1,N,L1,R1,Id,Cost).

add_to_binary_order(N,C,P, -1,R, Id,Cost)
:- !, 
   retract(binary_order(N,C,P,-1,R)),
   assert(binary_order(N,C,P,Id,R)),
   assert(binary_order(Id,Cost,N,-1,-1)).

add_to_binary_order(N,_,_, L,_, Id,Cost)
:- !, 
   clause(binary_order(L,C1,N,L1,R1),true),
   add_to_binary_order(L,C1,N,L1,R1,Id,Cost).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       delete_in_binary_order/1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


exp_abo:- 
  assert(binary_order(9,9,-1,-1,-1)),
  assert(binary_order_root(9)),
  add_to_binary_order(10,10),
  add_to_binary_order(11,11),
  add_to_binary_order(7,7),
  add_to_binary_order(8,8),
  add_to_binary_order(2,2),
  add_to_binary_order(1,1),
  add_to_binary_order(6,6),
  add_to_binary_order(5,5),
  add_to_binary_order(4,4),
  add_to_binary_order(3,3).

%

delete_in_binary_order(N)
:- retract(binary_order(N,C,P,L,R)),
   delete_in_binary_order(N,C,P,L,R),!.

delete_in_binary_order(_)
:- !.


delete_in_binary_order(N,_,-1,-1,-1)
:- !, retract(binary_order_root(N)).

delete_in_binary_order(N,_,-1,L,-1)
:- !, 
   change_root_in_bo(N,L),
   change_parent_in_bo(L,N,-1).

delete_in_binary_order(N,_,-1,-1,R)
:- !,
   change_root_in_bo(N,R),
   change_parent_in_bo(R,N,-1).

delete_in_binary_order(N,_,-1,L,R)
:- find_adjacent_in_bo(R,Adj),
   retract(binary_order(Adj,Ca,Pa,La,Ra)),
   change_root_in_bo(N,Adj),
   ( Adj == R, assert(binary_order(Adj,Ca,-1,L,Ra));
     assert(binary_order(Adj,Ca,-1,L,R)),
     change_parent_in_bo(R,N,Adj),
     delete_in_binary_order(Adj,Ca,Pa,La,Ra)
   ),
   change_parent_in_bo(L,N,Adj).

delete_in_binary_order(N,_,P,-1,-1)
:- change_left_child_in_bo(P,N,-1),!.

delete_in_binary_order(N,_,P,-1,-1)
:- change_right_child_in_bo(P,N,-1),!.

delete_in_binary_order(N,_,P,-1,R)
:- change_left_child_in_bo(P,N,R), !,
   change_parent_in_bo(R,N,P).

delete_in_binary_order(N,_,P,-1,R)
:- change_right_child_in_bo(P,N,R), !,
   change_parent_in_bo(R,N,P).
   
delete_in_binary_order(N,_,P,L,-1)
:- change_left_child_in_bo(P,N,L), !,
   change_parent_in_bo(L,N,P).

delete_in_binary_order(N,_,P,L,-1)
:- change_right_child_in_bo(P,N,L), !,
   change_parent_in_bo(L,N,P).

delete_in_binary_order(N,_,P,L,R)
:- retract(binary_order(P,Cp,Pp,N,Rp)), !,
   find_adjacent_in_bo(R,Adj),
   retract(binary_order(Adj,Ca,Pa,La,Ra)),
   assert(binary_order(P,Cp,Pp,Adj,Rp)),
   ( Adj == R, assert(binary_order(Adj,Ca,P,L,Ra));
     assert(binary_order(Adj,Ca,P,L,R)),
     change_parent_in_bo(R,N,Adj),
     delete_in_binary_order(Adj,Ca,Pa,La,Ra) 
   ),
   change_parent_in_bo(L,N,Adj).

delete_in_binary_order(N,_,P,L,R)
:- write(porra),nl,retract(binary_order(P,Cp,Pp,Lp,N)), !,
   find_adjacent_in_bo(R,Adj),
   retract(binary_order(Adj,Ca,Pa,La,Ra)),
   assert(binary_order(P,Cp,Pp,Lp,Adj)),
   ( Adj == R, assert(binary_order(Adj,Ca,P,L,Ra));
     assert(binary_order(Adj,Ca,P,L,R)),
     change_parent_in_bo(R,N,Adj),
     delete_in_binary_order(Adj,Ca,Pa,La,Ra) 
   ),
   change_parent_in_bo(L,N,Adj).

find_adjacent_in_bo(R,R)
:- clause(binary_order(R,_,_,-1,_),true), !.

find_adjacent_in_bo(R,Adj)
:- clause(binary_order(R,_,_,Lr,_),true),
   find_adjacent_in_bo(Lr,Adj).
   
change_parent_in_bo(N,P1,P2)
:- retract(binary_order(N,C,P1,L,R)), !,
   assert(binary_order(N,C,P2,L,R)).

change_left_child_in_bo(N,L1,L2)
:- retract(binary_order(N,C,P,L1,R)), !,
   assert(binary_order(N,C,P,L2,R)).

change_right_child_in_bo(N,R1,R2)
:- retract(binary_order(N,C,P,L,R1)), !,
   assert(binary_order(N,C,P,L,R2)).

change_root_in_bo(R,S)
:- ( retract(binary_order_root(R)); true ),
   assert(binary_order_root(S)),!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	clean_up_this_mess/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clean_up_this_mess(MinCount,Cut)
:- findall([I,C,E],no(open,I,_,_,C,E), L),
   list_length(L,N),
   ( N < MinCount, !;
     ordenar(L,criterio_ordenacao,[],LOrd),
     NCut is N*Cut,
     delete_worse_nodes(LOrd,NCut)
   ).


criterio_ordenacao([_,C,E],Score)
:- Score is E+((1.0*C)*(C+5.0)/(C+1.0)).
   
delete_worse_nodes(_,NotCut)
:- NotCut < 0, !.

delete_worse_nodes([[N,_,_]|LN],Cut)
:- retract(no(_,N,_,_,_,_)),
   retract(current_state(N,_)),
   NCut is Cut-1,
   delete_worse_nodes(LN,NCut).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	find_best/7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

find_best(Id,Father,Path,Cost,Est):-!,
	findall( [I,C,E],( no(open,I,_,_,C,E), cost_under_limit(C)), L),
	find_best_aux(L,Id),
	no(_,Id,Father,Path,Cost,Est).

find_best_aux([],_).
find_best_aux([F|L],IBest):-
	f_b_a(F,L,[IBest,_,_]).

f_b_a(N,[],N).
f_b_a([I1,C1,E1],[ [I2,C2,E2] |Rest], [IBest,CBest,EBest]):-
	f_b_a( [I2,C2,E2], Rest, [Ib,Cb,Eb]),
	F1 is C1 + E1,
	Fb is Cb + Eb,
	( F1 =< Fb,!,
		IBest= I1, CBest= C1, EBest= E1 ;
		IBest= Ib, CBest= Cb, EBest= Eb 
	).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       find_besti_abo/7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

find_best_abo(Id,Father,Path,Cost,Est)
:- binary_order_root(BOR),
   find_best_abo(BOR,Id,Father,Path,Cost,Est).

find_best_abo(Id,Id,Father,Path,Cost,Est)
:- binary_order(Id,_,_,-1,_), !,
   no(_,Id,Father,Path,Cost,Est).

find_best_abo(N,Id,Father,Path,Cost,Est)
:- binary_order(N,_,_,L,_),
   find_best_abo(L,Id,Father,Path,Cost,Est).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	generate_new_state/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

generate_new_state(Length,OA, N):- 
	current_state(Length,CS),
	operator_functionality(OA,_,_,Del,Add),
	strict_set_difference(CS,Del,LC),
	append_no_bt(Add,LC,NCS),
	get_identifier(Last),
	N is Last+1,
	set_identifier(N),
	define_current_state(N,NCS),!.

manual_generate_state(S1,OA,S3)
:- operator_functionality(OA,_,_,Del,Add),
   strict_set_difference(S1,Del,S2),
   append_no_bt(Add,S2,S3).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	generate_new_list_of_goals/6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

generate_new_list_of_goals(Id,OPG,ONPG):-
	current_state(Id,CS),
	current_problem(Prob),goal_state(Prob,LG),
	determine_goals(CS,LG,OPG,ONPG),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	determine_goals/4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


determine_goals(CS,LG,OPG,ONPG)
:- determine_prioritary_goals(LG,LPG,LNPG),
   satisfied_goals(CS,LPG,CG),
   ( CG = [], !, OPG = LPG, ONPG = LNPG;
     strict_set_difference(LG,CG,OG),
     determine_goals(CS,OG,OPG,ONPG)
   ) .


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	determine prioritary goals/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

determine_prioritary_goals(LG,LPG,LNPG):- 
	setof(G2,G1^( member_bt(G2,LG),
        	     suggested_precedence(G1,G2),
        	     member_bt(G1,LG) ),
	     LNPG),
	strict_set_difference(LG,LNPG,LPG),!.
determine_prioritary_goals(LG,LG,[]) :- !.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	generate_operator_applications/3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
generate_operator_applications(Id,LOpApp):- 
	current_state(Id,CS),
       	setof(OA,
		select_operator_application(CS,OA),
	      LOpApp),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	select_operator_application/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

select_operator_application(CS,OA)
    :- operator_functionality(OA,Info,Keep,Del,_),
       world_info_matching(CS,Info),
       append_no_bt(Keep,Del,LPC),
       preconditionlist_matching(CS,LPC).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	world_info_matching/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

world_info_matching(_,[]).
world_info_matching(CS,[I|Info])
    :- ( clause(planning_info(I),true); member_bt(I,CS) ),
       world_info_matching(CS,Info).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	preconditionlist_matching/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

preconditionlist_matching(_,[]).
preconditionlist_matching(CS,[PC|LPC])
    :- precondition_matching(CS,PC),
       preconditionlist_matching(CS,LPC).

precondition_matching(CS,all(X,SET,Term))
    :- ( setof(Term,X^(member_bt(X,SET)),LC),!; LC = [] ),
       preconditionlist_matching(CS,LC).

precondition_matching(CS,(Body -> _))
    :- \+ preconditionlist_matching(CS,Body).

precondition_matching(CS,(Body -> Head))
    :- preconditionlist_matching(CS,Body),precondition_matching(CS,Head).

precondition_matching(CS,LC)
    :- LC = [_|_], preconditionlist_matching(CS,LC).

precondition_matching(CS,not(PC))
    :- \+ member_bt(PC,CS).

precondition_matching(CS,PC)
    :- PC \= [_|_], member_bt(PC,CS).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	goal_state_satisfied/1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

goal_state_satisfied(Length)
    :-  current_state(Length,CS),
        current_problem(Prob),goal_state(Prob,LG),
        goals_satisfied(CS,LG),!.

goals_satisfied(_,[]).
goals_satisfied(CS,[G|LG])
    :- member_bt(G,CS),
       goals_satisfied(CS,LG).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	non_satisfied_goals/3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

non_satisfied_goals(_,[],[]) :- !.
non_satisfied_goals(CS,[G|LG],[G|NSG])
    :- \+ member_no_bt(G,CS),
       non_satisfied_goals(CS,LG,NSG),!.
non_satisfied_goals(CS,[_|LG],NSG)
    :- non_satisfied_goals(CS,LG,NSG),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	satisfied_goals/3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

satisfied_goals(_,[],[])
    :- !.
satisfied_goals(CS,[G|LG],[G|LSG])
    :- member_bt(G,CS),
       satisfied_goals(CS,LG,LSG),!.
satisfied_goals(CS,[_|LG],LSG)
    :- satisfied_goals(CS,LG,LSG),!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	get_solution/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_solution(I,[OA|Path]):-
	no(_,I,F,OA,_,_), 
	F \= (-1),
	!,
	get_solution(F,Path).
get_solution(_,[]).
	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	show_plan/1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

show_plan(Plan)
    :- print_list([nl,nl,'GENERATED PLAN:',nl,nl]),
       show_plan(Plan,_),
       print_list([nl,nl]),!.
show_plan([],0) :- !.
show_plan([A|LA],N)
    :- show_plan(LA,M),
       N is M+1,
       print_list(['Step ',N,': ',A,nl]),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init_identifier(N):-
	assert(i(N)).

init_closed_node_counter(N):-
	assert(closed(N)).

increment_closed_node_counter(N):-
	retract(closed(K)),
        N is K+1,
        assert(closed(N)),!.

get_identifier(N):-
	retract(i(N)).

set_identifier(N):-
	assert(i(N)).

get_no(O_C,I,F,P,C,E):-
	retract(no(O_C,I,F,P,C,E)).

redefine_no(O_C,Id):-!,
	retract(no(_,Id,Father,Path,Cost,Est)),
	assert(no(O_C,Id,Father,Path,Cost,Est)).

better_cost_than_previous(Cost)
:- clause(best_cost(C),true),!,
   Cost < C, retract(best_cost(C)), assert(best_cost(Cost)).

better_cost_than_previous(Cost)
:- assert(best_cost(Cost)).

cost_under_limit(Cost)
:- clause(best_cost(C),true),!,
   Cost < C.

cost_under_limit(_).

pgc
:- planning_gc.

planning_gc:-
	retractall(current_problem(_)),
	retractall(i(_)),
	retractall(closed(_)),
	retractall(best_cost(_)),
	retractall(current_state(_,_)),
	retractall(binary_order(_,_,_,_,_)),
	retractall(binary_order_root(_)),
	retractall(state_features(_,_,_,_)),
	retractall(recovery_goals(_)),
	retractall(remaining_skeleton(_,_)),
	retractall(semiconcrete_skeleton(_)),
	retractall('$change_variables'(_)),
	retractall(no(_,_,_,_,_,_)),
	retractall(nod(_,_)),
        retractall(failure_state(_)).




mostrar_nos_expandidos
:- findall([NO,PAI,OPER,COST,EST],no(_,NO,PAI,OPER,COST,EST),LL),
   mostrar_list_nos(LL),
   list_length(LL,N),
   print_list(['Numero de nos: ',N,nl]),
   clause(closed(K),true),
   print_list(['Numero de expansoes: ',K,nl]),
   clause(i(Tot),true),
   print_list(['Numero total de nos: ',Tot,nl]).



mostrar_list_nos([]).
mostrar_list_nos([[NO,PAI,OPER,COST,EST]|LL])
:- print_list(['NO = ',NO,'; PAI = ',PAI,';COST = ',COST,'; EST =',EST,nl,
                'OPERA =', OPER,nl, nl]),
   mostrar_list_nos(LL).

mfilhos(PAI)
:- findall([NO,PAI,OPER,COST,EST],no(_,NO,PAI,OPER,COST,EST),LL),
   mostrar_list_nos(LL).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	generate_nth_execution_state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

generate_nth_execution_state(Plan,N,NthS)
:- initial_state(IS),
   generate_nth_execution_state(IS,Plan,N,NthS).

generate_nth_execution_state(CS,_,0,CS).

generate_nth_execution_state(CS,[OA|Plan],N,NthS)
:- operator_functionality(OA,_,_,Del,Add),
   strict_set_difference(CS,Del,LC),
   append_no_bt(Add,LC,NCS),
   M is N-1,
   generate_nth_execution_state(NCS,Plan,M,NthS).


% Acrescentos em 2005:


lista_filhos(Id,LFilhos)
:- findall(Filho,( no(_,Filho,Id,_,_,_), no(_,Filho,_,_,_,_) ), LFilhos).

%%

calculate_estimate(Id,OPG,ONPG,Est)
:- current_state(Id,CS),
   calculate_estimate_mth(CS,OPG,ONPG,Est).

maxprof([],0).


maxprof([Id|LId], MAXP)
:- maxprof(LId,MAXP1),
  maxprof(Id,MAXP2),
  ( MAXP1 > MAXP2, !, MAXP = MAXP1; 
    MAXP = MAXP2 ).

maxprof(Id,MAXP1)
:- % lista(writeln(Id),
   lista_filhos(Id,LFilhos),
   maxprof(LFilhos,MAXP), MAXP1 is MAXP+1.


%%%


espacos(0) :- !.

espacos(N)
:- write(' '), M is N-1, espacos(M).



node_path(Id)
:- get_solution(Id, Path),
   show_plan(Path).
