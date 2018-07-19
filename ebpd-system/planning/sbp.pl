:-[common,forward,h_sbp].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%% solve according to an activity schema if there exists a corresponding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
% This file contain common predicates that are used in planners

% takes two params from input
% first is a domain file and second problem file
% and run planner for it.
command_line:-
        prolog_flag(argv, [D,P]),
        solve_sbp(D, P),
        halt.

solve_sbp(ProblemFile):-
        file_directory_name(ProblemFile,Dir),
        directory_file_path(Dir,'domain.ebpd',DomainFile),
        solve_sbp(DomainFile,ProblemFile).

% Reads files and set timelimit for planner
solve_sbp(DomainFile, ProblemFile):-
        parseDomain(DomainFile, D, _),
        parseProblem(ProblemFile, P, _),

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
        initial_statistics,             % initialize statistics file for recording nodes, memory and solution
        init_activity_schema, !,
        init_goal,
        init_key_propositions,
            nb_getval(schema,[Task,Args,AbsPlan,Goal]), Sch=..[Task|Args], 
            nb_getval(key_propositions,KP),
            writeln('\nSchema:'), ansi_format([bold,fg(yellow)], '~w~n~w~n~w~n', [Sch,AbsPlan,Goal]),
            writeln('\nKey propositions:'), ansi_format([bold,fg(yellow)], '~w~n', [KP]),

        %time_out(search_sbp(I, Solution, AbsSolution, Cost), 500000, _Result), % time limit for a planner
        search_sbp(I, Solution, AbsSolution, _),
        show_statistic(Solution, AbsSolution),
        record_statistics,
        %write_out_plan(Solution),
        !.

% if there is no corresponding activity schema
solve_sbp(_, _).

solve_looping_schema(DomainFile):-
        parseDomain(DomainFile, D, _),
        nb_setval(domain, DomainFile),

        % set domain variables
        get_domain_name(D, DN),         nb_setval(domain_name, DN),
        get_types(D,T),                 nb_setval(types, T),
        get_constants(D,C),
        term_to_ord_term(C, OC),        nb_setval(constants, OC),
        get_actions(D, A),
        actions_to_ord_actions(A,OA),   nb_setval(actions, OA),
        get_require_keys(D, R),         nb_setval(require_keys, R),

        %time_out(search_sbp(I, Solution, AbsSolution, Cost), 500000, _Result), % time limit for a planner
        nb_getval(initialState, I),
        search_sbp(I, Solution, AbsSolution, _),
        show_statistic(Solution, AbsSolution),
        record_statistics,
        %write_out_plan(Solution),
        !.

% if there is no corresponding activity schema
solve_looping_schema(_).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        

% Dostupne veci:
%step(+State, -NewState)
%is_goal(State)
%h(State, Value) 
%repeating(+State, +AnotherState)

%search_sbp(+InitState, -Solution, -AbsSolution, -Cost).   % vahid
search_sbp(I, S, AS, C):-
        nb_getval(schema,[_,_,AbsPlan,_]),
        state_record(AbsPlan, I, nil, nil, nil, 0, SR),
        list_to_heap([0-SR], PQ),
        search_sbp(PQ, [], S, AS, C).

%search_sbp(+Queue, +Visited, -Solution, -AbsSolution, -Cost)
search_sbp(PQ, _, 'NO SOLUTION', 'NO SOLUTION', _):-
        empty_heap(PQ),!.

search_sbp(PQ, V, Solution, AbsSolution, C):-
        get_from_heap(PQ, C, SR, _),
        state_record(AbsPlan, S, _, _, _, _, SR),
        is_goal(AbsPlan, S), !, nl, nl,
        %write('FOUND SOLUTION'),nl,
        %writel(V),nl,halt,
        solution(SR, V, Solution),
        solution_absplan(SR, V, AbsSolution).

% if reach end of activity schema do not expand search tree any more
search_sbp(PQ, V, Solution, AbsSolution, C):-
        get_from_heap(PQ, _K, SR, RPQ),
        state_record([], _, _, _, _, D, SR),
        stat_node(0),
        ord_add_element(V, SR, NV),
            nb_getval(stat_nodes, N),
            nb_getval(tree_size, T),
            nl,writeln('------------------------------------------------------------------'),
            ansi_format([bg(red)], '~n(Deep: ~3f) (Node: ~d) (Tree: ~d)~n', [D,N,T]),
            ansi_format([bg(red)], 'Activity schema is achieved but the goal is not achieved!~n', [D]),
        search_sbp(RPQ, NV, Solution, AbsSolution, C).

%Visited --> ClosedList
%heap --> OpenedList
search_sbp(PQ, V, Solution, AbsSolution, C):-
        get_from_heap(PQ, _K, SR, RPQ),
        ord_add_element(V, SR, NV),
            state_record(AbsPlan, _, _, A, _, D, SR),
            AbsPlan=[[CurAOp,_]|_],
            get_action(A,AD),
            nb_getval(stat_nodes, N),
            nb_getval(tree_size, T),
            nl,nl,writeln('------------------------------------------------------------------'),
            ansi_format([fg(cyan)], '(Deep: ~3f) (Node: ~d) (Tree: ~d)~n', [D,N,T]),
            ansi_format([fg(magenta)], '(absOp: ~w) (last action: ~w)~n', [CurAOp,AD]),
        %(bagof(K-NS, next_node(SR, PQ, NV, K, NS), NextNodes) ; NextNodes=[]),
        (findall(K-NS, next_node(SR, PQ, NV, K, NS), NextNodes) ; NextNodes=[]),
        length(NextNodes, L),
        %state_record(_, S, _, _, _, D, SR), write(_K-D), write('  '),write(S), write(L),nl,
        add_list_to_heap(RPQ, NextNodes, NPQ),

        stat_node(L),
        search_sbp(NPQ, NV, Solution, AbsSolution, C).

%%

%% 
%next_node(+StateRecord, +Heap, +VisitedList, -F_Cost, -NewStateRecord):-
next_node(SR, Q, V, C, NewSR):-
        state_record(AbsPlan, S, _, _, _, D, SR),

        %% get the abstract operator name
        AbsPlan=[CurAO|_],CurAO=[CurAOp,_],
        step(S, CurAOp, Action, NewS),

        compute_cost(AbsPlan,Action,G,RestAbsPlan,GA),

        h_sbp(RestAbsPlan,H),
        %% h(NewS, H),
        NG is D+G,  %% g(a)=g(old)+g(new)
        C is NG+H,  %% f(a)=g(a)+h(a)

            format(' c(~g) d(~g) g(~g) h(~g) f(~g)', [G,D,NG,H,C]),

        % skip if it was already added to VisitedList with the lower cost
        state_record(_, NewS, _, _, _, NG, Temp),
        \+ my_ord_member2(Temp, V),

        % skip if it was already added to OpenedList with the lower cost
        heap_to_list(Q, PQL),
        \+ my_ord_member3(Temp, PQL),

        state_record(RestAbsPlan, NewS, S, Action, GA, NG, NewSR).

%%

%next_node(+StateRecord, +Queue, +Visited, -EstimateDeep, -NewStateRecord)
%next_node(SR, Q, V, E, NewSR):-
%        nb_getval(require_keys, R),
%        not(member(fluents,R)),!,
%        state_record(AbsO, S, _, _, _, D, SR),
%        step(S, A, NewS),
%        state_record(_, NewS, _, _, _, _, _, Temp),
%            statistics(runtime, [ST2,_]),
%        \+ my_ord_member(NewS, V),
%        heap_to_list(Q, PQL),
%        \+ member(Temp, PQL),
%            statistics(runtime, [FT2,_]),
%            RT2 is FT2-ST2,
%            get_action_name(A,AN),
%            %format('[~3d]\t\t~w~n', [RT2,AN]),
%        h(S, H),
%        E is H+D,
%        ND is D+1,
%        state_record(AbsO, NewS, S, A, _, ND, NewSR).

%%

%add_list_to_heap(+OldHeap, List, NewHeap)
add_list_to_heap(OH, [], OH).
add_list_to_heap(OH, [K-D|T], NH):-
        add_to_heap(OH, K, D, H),
        add_list_to_heap(H, T, NH).

my_ord_member(S, [SR|_]):-
        state_record(_, S2, _, _, _, _, SR),
        repeating(S, S2),
        !.
my_ord_member(S, [_|T]):-
        my_ord_member(S, T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_ord_member2(T, [SR|_]):-
        state_record(_, S2, _, _, _, OC, SR),
        state_record(_, S, _, _, _, NC, T),
        NC>OC,                  % old cost is less than new cost
        repeating(S, S2),
        ansi_format([fg(red)], ' [Already visited]', []),
        !.
my_ord_member2(S, [_|T]):-
        my_ord_member2(S, T).

my_ord_member3(T, [OC-SR|_]):-
        state_record(SC1, S2, _, _, _, _, SR),
        state_record(SC2, S, _, _, _, NC,T),
        NC>OC,                  % old cost is less than new cost
        repeating(S, S2),
        SC1=SC2,               % abstract operators are in the same positions
        ansi_format([fg(red)], ' [Already added to open]', []),
        !.
my_ord_member3(S, [_|T]):-
        my_ord_member3(S, T).

