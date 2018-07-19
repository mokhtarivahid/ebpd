:-[common,forward,h_sbp].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% simulate a given plan on a given problem and generate an experience
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contain common predicates that are used in planners

% takes two params from input
% first is a domain file and second problem file
% and run planner for it.

% Reads files and set timelimit for planner
simulate(DomainFile, ProblemFile, PlanSolution):-
        parseDomain(DomainFile, D, _),
        parseProblem(ProblemFile, P, _),
        consult(PlanSolution),
        plan(Solution),

        %file_base_name(DomainFile, Domain),    
        %file_base_name(ProblemFile, Problem),  
        nb_setval(domain, DomainFile),
        nb_setval(problem, ProblemFile),

        % set domain variables
        get_domain_name(D, DN),         nb_setval(domain_name, DN),
        get_types(D,T),                 nb_setval(types, T),
        get_constants(D,C),
        term_to_ord_term(C, OC),        nb_setval(constants, OC),
        get_actions(D, A),
        actions_to_ord_actions(A,OA),   nb_setval(actions, OA),
        get_require_keys(D, R),         nb_setval(require_keys, R),

        % set problem variables
        get_problem_entities(P, E),     nb_setval(entities, E),
        term_to_ord_term(P, OP),
        get_static(OP, SI),             nb_setval(staticInfo, SI),
        get_init(OP, I),                nb_setval(initialState, I),
        get_goal(OP, G),                nb_setval(goalState, G),
        get_objects(OP, O),
        merge_objects(OC, O, NO),       nb_setval(objects, NO),
        get_problem_name(OP, N),        nb_setval(task, N),

        % set schema variable
        %initial_statistics,             % initialize statistics file for recording nodes, memory and solution
        %init_activity_schema, !,
        init_goal,
        %init_key_propositions,
            %nb_getval(schema,[Task,Args,AbsPlan,Goal]), Sch=..[Task|Args], 
            %nb_getval(key_propositions,KP),
            %writeln('\nSchema:'), ansi_format([bold,fg(yellow)], '~w~n~w~n~w~n', [Sch,AbsPlan,Goal]),
            %writeln('\nKey propositions:'), ansi_format([bold,fg(yellow)], '~w~n', [KP]),

        %time_out(search_sbp(I, Solution, AbsSolution, Cost), 500000, _Result), % time limit for a planner
        ansi_format([bg(blue)],'~n',[]),
        nl, ansi_format([bg(yellow)],'InitialState:',[]), nl, writeln(I),
        nl, ansi_format([bg(yellow)],'Solution:',[]), nl, writeln(Solution),
        simulate_plan(I, Solution, FinalState),
        nl, ansi_format([bg(green)],'StaticState:',[]), nl, writeln(SI),
        nl, ansi_format([bg(green)],'FinalState:',[]), nl, writeln(FinalState),
        !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        

%simulate_plan(+InitState, +Solution, -FinalState).   % vahid
simulate_plan(I, [], I).
simulate_plan(I, [A|S], FS):-
        %% get_action(AD,A),
        nl, ansi_format([bg(yellow)],'Action: ',[]), write(A),
        simulate_step(I, A, NewS),
        nl, ansi_format([bg(yellow)],'New State: ',[]), writeln(NewS),
        simulate_plan(NewS, S, FS).


/* every member of StateList is a pair of objects in current state and a state */
%step(+InitialState, -Action, -NewState)
simulate_step(State, Action, NewState):-
        get_action(A, Action),
            %nl,print('Action: '), print(A), nl,

        %--------------------------------------------------------
        %[2] unify static preconditions
        get_static(SWI),
        get_precondition_static(A, SI),
        (unify_preconditions(SI, SWI); 
         nl, ansi_format([bg(red)],'Static precondition error!',[]), nl, exit),

        %--------------------------------------------------------
        %[3] unify positive preconditions
        get_precondition(A, P),
        (unify_preconditions(P, State);
         nl, ansi_format([bg(red)],'Precondition error!',[]), nl, exit),

        %--------------------------------------------------------
        %[4] unify positive eauality preconditions
        get_pos_eq_precondition(A, PEq),
        (unify_preconditions_equality(PEq, State);
         nl, ansi_format([bg(red)],'Positive eauality preconditions error!',[]), nl, exit),

        %--------------------------------------------------------
        %[5] unify negative eauality preconditions
        get_neg_eq_precondition(A, NEq),
        (unify_neg_precondition_equality(NEq, State);
         nl, ansi_format([bg(red)],'Negative eauality preconditions error!',[]), nl, exit),

        %--------------------------------------------------------
        %[6] unify negative preconditions
        get_neg_precondition(A, NP),
        (unify_neg_precondition(NP, State);
         nl, ansi_format([bg(red)],'Negative preconditions error!',[]), nl, exit),

        %--------------------------------------------------------
        %[7] subtract negative effects
        get_negative_effect(A, NE), 
        ord_subtract(State, NE, State2), 

        %--------------------------------------------------------
        %[8] add positive effects
        get_positive_effect(A, PE), 
        ord_union(State2, PE, NewState)
        .

