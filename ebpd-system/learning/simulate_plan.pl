


%% Simple utilities for executing a plan



simulate_plan(Plan,IS,GS)
:- initialize_generalization_context,
   initial_to_goal_state(Plan,IS,GS),
   cleanup_generalization_context.

initial_to_goal_state([],IS,IS).

initial_to_goal_state([OA|Plan],IS,GS)
:- execute_operator_application(OA,IS,Next),
   initial_to_goal_state(Plan,Next,GS).


% Versão com registo na base de dados:
%   (dado um estado inicial e um plano,
%    regista os estados intermédios bem como o 
%    valor da heurística, etc.)


simulate_plan_bd(Prob,Plan,IS,GS)
:- initialize_generalization_context,
   retractall(simulated_state(_,_,_,_,_)),
   retractall(simulated_state(_,_,_,_)),
   retractall(simulated_state(_,_,_)),
   retractall(simulated_state(_,_)),
   retractall(current_problem(_)),
   assert(current_problem(Prob)),
   initial_to_goal_state_bd(Prob,Plan,0,IS,GS),
   cleanup_generalization_context.

initial_to_goal_state_bd(_,[],_,IS,IS).


initial_to_goal_state_bd(Prob,[OA|Plan],K,IS,GS)
:- execute_operator_application(OA,IS,Next),
   N is K+1,
   goal_state(Prob,LG),   
   determine_goals(Next,LG,OPG,ONPG),
   calculate_estimate_mth(Next,OPG,ONPG,Est),
   TotalCost is N + Est,
   assert(simulated_state(N,OA,Next,Est,TotalCost)),
   initial_to_goal_state_bd(Prob,Plan,N,Next,GS).


%%%
%%
%

%execute_operator_application(feed_part(Fd,Obj,Type)

execute_operator_application(OA,IS,Next)
:- operator_functionality(OA,_,_,LD,LA),
   strict_set_difference(IS,LD,St1),
   append_no_bt(St1,LA,Next).


