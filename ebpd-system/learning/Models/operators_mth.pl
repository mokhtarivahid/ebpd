% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%	Taxononomy of Assembly Entities -- Operators
%        o  Methods and Demons
%        o  Precendence Relations between Goals
%        o  Cost Estimates
%        o  Equivalent States
%       (C) Luis Seabra Lopes, UNL, Caparica, January 1996
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %



% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%  Expansion of task-level operators into a sequence of resource operators
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


get_fpal_expansion_mth(_,_)
:- !.

get_awpl_expansion_mth(_,_)
:- !.

get_fdpt_expansion_mth(_,_)
:- !.

get_gtool_expansion_mth(_,_)
:- !.

get_stool_expansion_mth(_,_)
:- !.

get_pickpl_expansion_mth(_,_)
:- !.

get_placepl_expansion_mth(_,_)
:- !.

get_pickfd_expansion_mth(_,_)
:- !.

get_down_expansion_mth(_,_)
:- !.

get_pickup_expansion_mth(_,_)
:- !.

get_pickprt_expansion_mth(_,_)
:- !.

get_setfix_expansion_mth(_,_)
:- !.

get_assemb_expansion_mth(_,_)
:- !.

get_dassemb_expansion_mth(_,_)
:- !.

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%    Precedence Relations between Goals:
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%    Goals:
%
%       part_available_in_feeder(PI,Fd,Ap,Gp,Dp)
%       no_part_available_in_feeder(Fd)
%       current_arm_pos(R,Dp),
%       toolplace_empty(TP),
%       current_tool(R,T) ]
%       no_tool_attached(R),
%       tool_in_magazine(T,TP) ]
%       part_in_robot(PI,R),
%       robot_free(R) ]
%       part_on_table(PI,UGp),
%       fixture_with_product(Fix,Prod),
%       component_assembled(PI,Prod,Fix),
%       fixture_available(fix1)
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%    precedence_relation(G1,G2) <=> "G1 immediately before G2";
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %



permanent_precedence( fixture_with_product(Fix,Prd),
                      component_assembled(_,Prd,Fix)).

permanent_precedence( component_assembled(C1,Prod,Fix),
                      component_assembled(C2,Prod,Fix))
     :- clause(planning_info(part_mate(Prod,C1,_,_,_,_,_,LNextM)),true),
        member_bt(C2,LNextM).

suggested_precedence(component_assembled(_,_,_),robot_free(_)).

suggested_precedence(component_assembled(_,_,_),no_tool_attached(_)).

suggested_precedence(component_assembled(_,Prod,_),tool_in_toolplace(T,_))
     :- clause(planning_info(part_mate(Prod,_,CT,_,_,_,_,_)),true),
        clause(planning_info(part_tool(CT,T)),true).

suggested_precedence(object_on_table(_,_,_,_),no_tool_attached(_)).

suggested_precedence(object_on_table(_,_,_,_),robot_free(_)).

% .....

suggested_precedence(G1,G2) :- permanent_precedence(G1,G2).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	calculate_estimate/4
%       (C) Ana Maria Almeida, Luis Seabra Lopes, FCT/UNL, Julho de 1995
%
%	calculate_estimate(in:	Identificador do estado, 
%			   in:	Golos prioritarios (ainda nao satisfeitos),
%			   in:	Golos nao prioritarios (ainda nao satisfeitos),
%			   out:	Estimativa )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


calculate_estimate_mth(CS,OP,ONP,Estimate):-
	findall( Est1,
		     ( 	member_bt(L1,OP),
			cost_estimate(prior,L1,CS,Est1)
                        %, print_list([' p: ',L1,' / ',Est1,nl])
		     ),
		 List_est_1),
	findall( Est2,
		     ( 	member_bt(L2,ONP),
			cost_estimate(non_prior,L2,CS,Est2)
                        %, print_list(['np: ',L2,' / ',Est2,nl])
		     ),
		 List_est_2),
	list_sum( List_est_1,E1),
	list_sum( List_est_2,E2),
	Estimate is 1.5*(E1+E2).



cost_estimate(prior,tool_in_magazine(T,TP),CS,Cost)
:- cost_current_tool(CS,R,T,C1),
   cost_object_in_robot(CS,R,_,C2),
   cost_tool_in_magazine(CS,T,_,TP,C3),
   Cost is C1+C2+C3.


cost_estimate(non_prior,tool_in_magazine(T,TP),CS,Cost)
:- cost_estimate(prior,tool_in_magazine(T,TP),CS,C1),
   Cost is 0.90*3 + 0.10*C1.




cost_estimate(_,pallet_not_available(_,_),_,1).

cost_estimate(_,no_pallet_available(_),_,1).

cost_estimate(_,pallet_available(_,_),_,2).

cost_estimate(_,part_available_in_feeder(_,_),_,1).

cost_estimate(_,current_arm_pos(_,_),_,1).





cost_estimate(prior,no_tool_attached(R),CS,1):-
	member_bt(current_tool(R,_),CS),
	\+ member_bt(object_in_robot(_,R),CS),!.

cost_estimate(prior,no_tool_attached(R),CS,2):-
	member_bt(current_tool(R,_),CS),
	member_bt(object_in_robot(_,R),CS),!.
	
cost_estimate(prior,no_tool_attached(_),_,0).

cost_estimate(non_prior,no_tool_attached(_),_,2). %:-
%	cost_estimate(prior,no_tool_attached(R),CS,C1),
%	Cost is 0.90*2 + 0.10*C1.


cost_estimate(prior,current_tool(R,T),CS,Cost):-
	cost_robot_free(CS,R,C1),
	cost_get_tool(CS,T,C2),
	Cost is C1 + C2.

cost_estimate(non_prior,current_tool(R,T),CS,Cost):-
	cost_estimate(prior,current_tool(R,T),CS,C1),
	Cost is 0.90*3 + 0.10*C1.


cost_estimate(prior,robot_free(R),CS,1):-
	\+ member_bt(object_in_robot(_,R),CS),!.
cost_estimate(prior,robot_free(_),_,2):-!.

cost_estimate(non_prior,robot_free(R),CS,Cost):-
	cost_estimate(prior,robot_free(R),CS,C1),
	Cost is 0.90*2 + 0.10*C1.


cost_estimate(_,part_in_pallet(_,_),_,3).

cost_estimate(_,object_in_robot(_,_),_,2).


cost_estimate(prior,object_on_table(Obj,_,_,_),CS,1):-
	member_bt(object_in_robot(Obj,_),CS),!.
cost_estimate(prior,object_on_table(_,_,_,_),_,2).

cost_estimate(non_prior,object_on_table(Obj,Ap,UGp,Dp),CS,Cost):-
	cost_estimate(prior,object_on_table(Obj,Ap,UGp,Dp),CS,C1),
	Cost is 0.90*2 + 0.10*C1.




cost_estimate(_,fixture_available(_) ,_,5).

cost_estimate(_,fixture_with_product(_,_),_,1).



cost_estimate(prior,component_assembled(Comp,Prod,Fix),CS,Cost)
:- clause(planning_info(part_mate(Prod,Comp,CType,_,_,_,_,_)),true),
   fixture_already_set(CS,Fix,Prod,C1),
   component_in_robot(CS,CType,C2),
   clause(planning_info(part_tool(CType,T)),true),
   tool_available(CS,T,C4),
   Cost is C1+C2+C4+1,!.



cost_estimate(non_prior,component_assembled(_,_,_),_,5).
%:- cost_estimate(prior,component_assembled(Comp,Prod,Fix),CS,C1),
%   Cost is 0.90*5+0.10*C1.


	cost_current_tool(CS,R,T,1)
	:- member_bt(current_tool(R,T),CS),!.

	cost_current_tool(CS,_,T,2)
	:- member_bt(tool_in_magazine(T,_),CS),!.

	cost_object_in_robot(CS,R,Obj,1)
	:- member_bt(object_in_robot(Obj,R),CS),!.

	cost_object_in_robot(_,_,_,0)
	:- !.

	cost_tool_in_magazine(CS,T,T2,TP,5)
	:- member_bt(tool_in_magazine(T2,TP),CS),T2\==T,!.

	cost_tool_in_magazine(_,_,_,_,0)
	:- !.

	  cost_robot_free(CS,R,1):-
		member_bt(robot_free(R),CS),!.
	  cost_robot_free(_,_,2).

	  cost_get_tool(_,_,1).

	component_in_robot(CS,CType,Cost)
	:- findall(Obj,( member_bt(part_in_pallet(Obj,Pal),CS),
                         verify_object_type(CS,Obj,CType),
                         member_bt(pallet_available(Pal,_),CS),
                         \+ member_bt(defective(Obj),CS)
                       ),L1),
           findall(Obj,( member_bt(part_available_in_feeder(Obj,_),CS),
                         verify_object_type(CS,Obj,CType),
                         \+ member_bt(defective(Obj),CS)
                       ),L2),
           findall(Obj,( member_bt(object_on_table(Obj),CS),
                         verify_object_type(CS,Obj,CType),
                         \+ member_bt(defective(Obj),CS)
                       ),L3),
           append_no_bt(L1,L2,L4),append_no_bt(L3,L4,L5),list_length(L5,NO),
           current_problem(Prob),goal_state(Prob,LG),
           findall(C,  ( member_bt(component_assembled(C,P,Fx),LG),
                         clause(planning_info(part_mate(P,C,CType,_,_,_,_,_)),
                           true),
                         \+ member_bt(component_assembled(C,P,Fx),CS)
                       ),L6),
           list_length(L6,NC),
           there_is_component_in_robot(CS,CType,InR),
           calculate_cost_component_in_robot(NO,NC,InR,Cost),!.

        calculate_cost_component_in_robot(NO,NC,0,Cost)
        :- ( NO > NC,!, Cost = 1; Cost is 1+(NC-NO)/(1.0*NC) ).

        calculate_cost_component_in_robot(NO,NC,1,Cost)
        :- ( NO > (NC-1), !, Cost is (NC-1)/(1.0*NC); 
             Cost is (2.0*NC-NO-2.0)/NC ).

	there_is_component_in_robot(CS,CType,1)
	:- member_bt(object_in_robot(Obj,_),CS),
	   verify_object_type(CS,Obj,CType),!.
           
	there_is_component_in_robot(_,_,0).

	tool_available(CS,T,0)
	:- member_bt(current_tool(_,T),CS),!.

	tool_available(_,_,1)
	:- !.

        fixture_already_set(CS,Fix,Prod,0)
        :- member_bt(fixture_with_product(Fix,Prod),CS),!.

        fixture_already_set(_,_,_,1)
        :- !.


	verify_object_type(_,Obj,OType)
	:- clause(planning_info(object_type(Obj,OType)),true),!.

	verify_object_type(CS,Obj,OType)
	:- member_bt(object_type(Obj,OType),CS),!.



list_sum([],0).
list_sum([X|L],Sum):-
	list_sum(L,Sum_L),
	Sum is Sum_L + X.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%    Predicates for assessing equivalence between planning states
%
%    (C) L. Seabra Lopes, Ana Maria Almeida
%        FCT/UNL, Monte da Caparica
%        September 1995, refined January 1996
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       get_planning_state_features/2
%       -- obtain the features of a planning state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  F1 - pallets: 0 = no_pallet; 1 = pal1; 2 = pal2;
%  F2 - number of parts in pallet pal1;
%  F3 - number of parts in pallet pal2;
%  F4 - feeders: 0 = no parts available; 1 = sideplate; 2 = crossbar; 3 = 1+2;
%  F5 - tools:   0 = no tool; 1 = gp1; 2 = gp2; 3 = gp3;
%  F6 - number of assembled components;
%  F7 - fixture: 0 = no product; 1 = with product;

get_planning_state_features([],[0,0,0,0,0,0,0])
:- !.

get_planning_state_features([Fact|State],Features)
:- get_planning_state_features(State,LF),
   update_pl_state_features(Fact,LF,Features).

update_pl_state_features(pallet_available(pal_1,_),[_|LF],[1|LF])
:- !.

update_pl_state_features(pallet_available(pal_2,_),[_|LF],[2|LF])
:- !.

update_pl_state_features(part_in_pallet(_,pal_1),[F1,F2|LF],[F1,G2|LF])
:- !, G2 is F2+1.

update_pl_state_features(part_in_pallet(_,pal_2),[F1,F2,F3|LF],[F1,F2,G3|LF])
:- !, G3 is F3+1.

update_pl_state_features(
   part_available_in_feeder(_,Feeder), [F1,F2,F3,F4|LF],[F1,F2,F3,G4|LF])
:- !, update_planning_state_feature_4(Feeder,F4,G4).

update_pl_state_features(
   current_tool(_,gp_1),[F1,F2,F3,F4,_|LF],[F1,F2,F3,F4,1|LF])
:- !.

update_pl_state_features(
   current_tool(_,gp_2),[F1,F2,F3,F4,_|LF],[F1,F2,F3,F4,2|LF])
:- !.

update_pl_state_features(
   current_tool(_,gp_3),[F1,F2,F3,F4,_|LF],[F1,F2,F3,F4,3|LF])
:- !.

update_pl_state_features(
   component_assembled(_,_,_),[F1,F2,F3,F4,F5,F6,F7],[F1,F2,F3,F4,F5,G6,F7])
:- !, G6 is F6+1.

update_pl_state_features(
   fixture_with_product(_,_),[F1,F2,F3,F4,F5,F6,_],[F1,F2,F3,F4,F5,F6,1])
:- !.

update_pl_state_features(_,Features,Features).

update_planning_state_feature_4(feeder_sp,0,1).
update_planning_state_feature_4(feeder_sp,2,3).
update_planning_state_feature_4(feeder_cb,0,2).
update_planning_state_feature_4(feeder_cb,1,3).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       equivalent_state/3
%       -verifica se dois estados sao equivalentes tendo em conta o estado final
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


print_state(_):- nl.

equivalent_state(S1,S2,_):- 
	test_defective_parts(S1,S2,S3,S4),
           %write('no descrepancy in defective parts ...'),nl,
        test_component_assembled(S3,S4,S5,S6),
           %write('no descrepancy in test_component_assembled ...'),nl,
	test_part_in_pallet(S5,S5,S6,S7,S8),
           %write('no descrepancy in test_part_in_pallet ...'),nl,
	test_part_available_in_feeder(S7,S7,S8,S9,S10),	% e'  mesmo assim
           %write('no descrepancy in test_part_available_in_feeder ...'),nl,
	test_object_in_robot(S9,S9,S10,S11,S12),
           %write('no descrepancy in test_object_in_robot ...'),nl,
	test_object_on_table(S11,S11,S12,S13,S14),	% e'  mesmo assim
           %write('no descrepancy in test_object_on_table ...'),nl,
	test_object_type(S13,S14,S15,S16),
           %write('no descrepancy in test_object_type ...'),nl,
           %write(S15), write(' '), write(S16),
        !,
	iguais(S15,S16).

test_defective_parts(S1,S2,S11,S22)
:- find_defective_parts(S1,D1,SD1),
   find_defective_parts(S2,D2,SD2),
   iguais(D1,D2),
   test_defective_parts(D1,D2,SD1,SD2,S11,S22).

find_defective_parts([],[],[]).

find_defective_parts([defective(Obj)|S],[Obj|D],SD)
:- !, find_defective_parts(S,D,SD).

find_defective_parts([X|S],D,[X|SD])
:- find_defective_parts(S,D,SD).

test_defective_parts([],[],SD1,SD2,SD1,SD2).

test_defective_parts([Obj|D1],D2,S1,S2,S5,S6)
:- get_element(Obj,D2,D22),
   test_defective_part(Obj,S1,S2,S3,S4),
   test_defective_parts(D1,D22,S3,S4,S5,S6).

test_defective_part(Obj,SD1,SD2,S11,S22)
:- get_element(part_in_pallet(Obj,Pal),SD1,S11),
   get_element(part_in_pallet(Obj,Pal),SD2,S22), !.

test_defective_part(Obj,SD1,SD2,S11,S22)
:- get_element(part_available_in_feeder(Obj,Fd),SD1,S11),
   get_element(part_available_in_feeder(Obj,Fd),SD2,S22), !.

test_defective_part(Obj,SD1,SD2,S11,S22)
:- get_element(object_in_robot(Obj,R),SD1,S11),
   get_element(object_in_robot(Obj,R),SD2,S22), !.

test_defective_part(Obj,SD1,SD2,S11,S22)
:- get_element(object_on_table(Obj),SD1,S11),
   get_element(object_on_table(Obj),SD2,S22), !.

test_component_assembled([],S,[],S).
test_component_assembled([component_assembled(C,P,F)|R_S1_in],S2_in, S1_out,S2_out):-
	member_bt(component_assembled(C,P,F),S2_in),
	member_bt(represented_by(C,Obj1),R_S1_in),
	member_bt(represented_by(C,Obj2),S2_in),
	get_element(component_assembled(C,P,F),S2_in,R_S2_in),
	get_element(represented_by(C,Obj1),R_S1_in,R_S1_in_1),
	get_element(represented_by(C,Obj2),R_S2_in,R_S2_in_1),
	!,
	test_component_assembled(R_S1_in_1,R_S2_in_1,S1_out,S2_out).
test_component_assembled([represented_by(C,_)|R_S1_in],S2_in, S1_out,S2_out):-
        member_bt(represented_by(C,Obj2),S2_in),
        member_bt(component_assembled(C,P,F),R_S1_in),
        member_bt(component_assembled(C,P,F),S2_in),
        get_element(represented_by(C,Obj2),S2_in,R_S2_in),
	get_element(component_assembled(C,P,F),R_S1_in,R_S1_in_1),
	get_element(component_assembled(C,P,F),R_S2_in,R_S2_in_1),
        !,
        test_component_assembled(R_S1_in_1,R_S2_in_1,S1_out,S2_out).
test_component_assembled([H|S1_in],S2_in, [H|R_S1_out],R_S2_out):-
	test_component_assembled(S1_in,S2_in, R_S1_out,R_S2_out).


test_part_in_pallet(_,[],S,[],S).
test_part_in_pallet(C1,[part_in_pallet(Obj1,Pal)|R_S1_in],S2_in, S1_out,S2_out):-
	member_bt( part_in_pallet(Obj2,Pal),S2_in),
	( clause(planning_info(object_type(Obj1,Type)),true); 
          member_bt(object_type(Obj1,Type), C1) ),
	( clause(planning_info(object_type(Obj2,Type)),true); 
          member_bt(object_type(Obj2,Type), S2_in) ),
	get_element(part_in_pallet(Obj2,Pal),S2_in,R_S2_in),
	!,
	test_part_in_pallet(C1,R_S1_in,R_S2_in,S1_out,S2_out).
test_part_in_pallet(C1,[H|S1_in],S2_in, [H|R_S1_out],R_S2_out):-
	test_part_in_pallet(C1,S1_in,S2_in, R_S1_out,R_S2_out).


test_current_arm_pos([],S,[],S).
test_current_arm_pos([current_arm_pos(R,_)|R_S1_in],S2_in, S1_out,S2_out):-
	member_bt( current_arm_pos(R,P2),S2_in), 
	get_element(current_arm_pos(R,P2),S2_in,R_S2_in),
	!,
	test_current_arm_pos(R_S1_in,R_S2_in,S1_out,S2_out).
test_current_arm_pos([H|S1_in],S2_in, [H|R_S1_out],R_S2_out):-
	test_current_arm_pos(S1_in,S2_in, R_S1_out,R_S2_out).


test_part_available_in_feeder(_,[],S,[],S).
test_part_available_in_feeder(C1,[part_available_in_feeder(Obj1,Fd)|R_S1_in],S2_in, S1_out,S2_out):-
	member_bt( part_available_in_feeder(Obj2,Fd),S2_in), 
	( clause(planning_info(object_type(Obj1,Type)),true);
          member_bt(object_type(Obj1,Type), C1) ),
	( clause(planning_info(object_type(Obj2,Type)),true);
          member_bt(object_type(Obj2,Type), S2_in) ),
	get_element(part_available_in_feeder(Obj2,Fd),S2_in,R_S2_in),
	!,
	test_part_available_in_feeder(C1,R_S1_in,R_S2_in,S1_out,S2_out).
test_part_available_in_feeder(C1,[H|S1_in],S2_in, [H|R_S1_out],R_S2_out):-
	test_part_available_in_feeder(C1,S1_in,S2_in, R_S1_out,R_S2_out).


test_object_in_robot(_,[],S,[],S).
test_object_in_robot(C1,[ object_in_robot(Obj1,R)|R_S1_in],S2_in, S1_out,S2_out):-
	member_bt( object_in_robot(Obj2,R),S2_in), 
	( clause(planning_info(object_type(Obj1,Type)),true);
          member_bt(object_type(Obj1,Type), C1) ),
	( clause(planning_info(object_type(Obj2,Type)),true);
          member_bt(object_type(Obj2,Type), S2_in) ),
	get_element(object_in_robot(Obj2,R),S2_in,R_S2_in),
	!,
	test_object_in_robot(C1,R_S1_in,R_S2_in,S1_out,S2_out).
test_object_in_robot(C1,[H|S1_in],S2_in, [H|R_S1_out],R_S2_out):-
	test_object_in_robot(C1,S1_in,S2_in, R_S1_out,R_S2_out).


test_object_on_table(_,[],S,[],S).
test_object_on_table(C1,[object_on_table(Obj1)|R_S1_in],S2_in, S1_out,S2_out):-
	member_bt( object_on_table(Obj2),S2_in), 
	( clause(planning_info(object_type(Obj1,Type)),true);
          member_bt(object_type(Obj1,Type), C1) ),
	( clause(planning_info(object_type(Obj2,Type)),true);
          member_bt(object_type(Obj2,Type), S2_in) ),
	get_element( object_on_table(Obj2),S2_in,R_S2_in),
	!,
	test_object_on_table(C1,R_S1_in,R_S2_in,S1_out,S2_out).
test_object_on_table(C1,[H|S1_in],S2_in, [H|R_S1_out],R_S2_out):-
	test_object_on_table(C1,S1_in,S2_in, R_S1_out,R_S2_out).


test_object_type([],S,[],S).
test_object_type([object_type(_,Type)|R_S1_in],S2_in, S1_out,S2_out):-
	member_bt( object_type(Obj2,Type),S2_in), 
	get_element(object_type(Obj2,Type),S2_in,R_S2_in),
	!,		
	test_object_type(R_S1_in,R_S2_in,S1_out,S2_out).
test_object_type([H|S1_in],S2_in, [H|R_S1_out],R_S2_out):-
	test_object_type(S1_in,S2_in, R_S1_out,R_S2_out).


iguais(S1,S2):-
	contained(S1,S2),
	contained(S2,S1).

%get_element(_,[],[]).
get_element(X,[X|L],L):-!.
get_element(X,[Y|L],[Y|L_out]):-
	get_element(X,L,L_out).


%
%  Verification of properties of abstract operations:
%
%  Note: during recovery planning, the failure state is recorded in
%        - failure_state(AFS), during abstract planning
%        - current_state(0,FS), during detailed planning

verify_property(_,assemble_before(C1,C2))
:- verify_assemble_before(C1,C2).

%

verify_property(_,assemble_after(C1,C2))
:- verify_assemble_after(C1,C2).

%

verify_property(_,in_contact_with(C1,C2))
:- planning_info(component_contacts(C1,LC)),
   member_bt(C2,LC).

%

verify_property(_,initially_in_contact(X1,X2))
:- clause(current_state(0,FS),true), !,  % we are already in detailed planning
   member_bt(represented_by(C1,X1),FS),
   member_bt(represented_by(C2,X2),FS),
   planning_info(component_contacts(C1,LC)),
   member_bt(C2,LC).

verify_property(_,initially_in_contact(X1,X2))
:- clause(failure_state(AFS),true),     % we are still in abstract planning
   member_bt(reby(C1,X1),AFS),
   member_bt(reby(C2,X2),AFS),
   planning_info(component_contacts(C1,LC)),
   member_bt(C2,LC).

%

verify_property(_,initially_assembled(C))
:- clause(current_state(0,FS),true), !,  % we are already in detailed planning
   member_bt(component_assembled(C,_,_),FS).

verify_property(_,initially_assembled(C))
:- clause(failure_state(AFS),true),     % we are still in abstract planning
   member_bt(assembled(C),AFS).

%

verify_property(State,same_type_as(X1,X2))
:- ( planning_info(object_type(X1,T)); 
     member_bt(object_type(X1,T),State) ),
   ( planning_info(object_type(X2,T)); 
     member_bt(object_type(X2,T),State) ).

%

verify_assemble_before(C1,C2)
:- planning_info(part_mate(_,C1,_,_,_,_,_,LNextM)),
   member_bt(C2,LNextM).

verify_assemble_before(C1,C2)
:- planning_info(part_mate(_,C1,_,_,_,_,_,LNextM)),
   member_bt(Ck,LNextM),
   verify_assemble_before(Ck,C2).

%

verify_assemble_after(C1,C2)
:- planning_info(part_mate(_,C1,_,_,_,_,LPrevM,_)),
   member_bt(C2,LPrevM).

verify_assemble_after(C1,C2)
:- planning_info(part_mate(_,C1,_,_,_,_,LPrevM,_)),
   member_bt(Ck,LPrevM),
   verify_assemble_after(Ck,C2).

