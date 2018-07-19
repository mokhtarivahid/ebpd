:-[sbp].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%% solve according to an activity schema if there exists a corresponding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
% This file contain common predicates that are used in planners

% takes two params from input
% first is a domain file and second problem file
% and run planner for it.
% command_line:-
%         prolog_flag(argv, [D,P]),
%         solve_sbpabs(D, P),
%         halt.

solve_sbpabs(ProblemFile):-
        file_directory_name(ProblemFile,Dir),
        directory_file_path(Dir,'domain-abs.ebpd',DomainFile),
        solve_sbpabs(DomainFile,ProblemFile).

% Reads files and set timelimit for planner
solve_sbpabs(DomainFile, ProblemFile):-
        parseDomain(DomainFile, D, _),
        parseProblem(ProblemFile, P, _),
writeln(DomainFile-ProblemFile),

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
            writeln('\nGoal:'), ansi_format([bold,fg(yellow)], '~w~n', [G]),

        %time_out(search_sbpabs(I, Solution, AbsSolution, Cost), 500000, _Result), % time limit for a planner
        search_sbpabs(I, Solution, AbsSolution, _),

        %% set a concrete schema and call the sbp planner to generate a real solution
        %% variabilize_abstract_solution(AbsSolution,VAbsSolution,[],Map),
        nb_setval(schema,[Task,Args,AbsSolution,Goal]),
        show_statistic(sbpabs, Solution, AbsSolution),
        record_statistics,
        nl,writeln('------------------------------------------------------------------------'),
        ansi_format([bg(green)],'~nAbstract solution was successfully generated ...~n',[]),
        ansi_format([bg(green)],'The real solution is now planned ...~n',[]),
        file_directory_name(DomainFile,Dir),
        directory_file_path(Dir,'domain.ebpd',MainDomainFile),
        solve_looping_schema(MainDomainFile),

        %write_out_plan(Solution),
        !.

% if there is no corresponding activity schema
%% solve_sbpabs(_, _).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        

% Dostupne veci:
%step(+State, -NewState)
%is_goal(State)
%h(State, Value) 
%repeating(+State, +AnotherState)

%search_sbpabs(+InitState, -Solution, -AbsSolution, -Cost).   % vahid
search_sbpabs(I, S, AS, C):-
        nb_getval(schema,[_,_,AbsPlan,_]),
        state_record(AbsPlan, I, nil, nil, nil, 0, SR),
        list_to_heap([0-SR], PQ),
        search_sbpabs(PQ, [], S, AS, C).

%search_sbpabs(+Queue, +Visited, -Solution, -AbsSolution, -Cost)
search_sbpabs(PQ, _, 'NO SOLUTION', 'NO SOLUTION', _):-
        empty_heap(PQ),!.

search_sbpabs(PQ, V, Solution, AbsSolution, C):-
        get_from_heap(PQ, C, SR, _),
        state_record(AbsPlan, S, _, _, _, _, SR),
        is_goal(AbsPlan, S), !, nl, nl,
        %write('FOUND SOLUTION'),nl,
        %state_record(_, S, _, _, _, D, SR), write(C-D), write('   '),write(S),nl,
        %nl,halt,
        solution(SR, V, Solution),
        solution_absplan(SR, V, AbsSolution).

% if reach end of activity schema do not expand search tree any more
search_sbpabs(PQ, V, Solution, AbsSolution, C):-
        get_from_heap(PQ, _K, SR, RPQ),
        state_record([], _, _, _, _, D, SR),
        stat_node(0),
        ord_add_element(V, SR, NV),
            nb_getval(stat_nodes, N),
            nb_getval(tree_size, T),
            nl,nl,writeln('------------------------------------------------------------------'),
            ansi_format([bg(red)], '~n(Deep: ~3f) (Node: ~d) (Tree: ~d)~n', [D,N,T]),
            ansi_format([bg(red)], 'Activity schema is achieved but the goal is not achieved!~n', [D]),
        %solution(SR, V, Solution).
        search_sbpabs(RPQ, NV, Solution, AbsSolution, C).

%Visited --> ClosedList
%heap --> OpenedList
%% if the current absop is a loop and it is the last absop in absplan
search_sbpabs(PQ, V, Solution, AbsSolution, C):-
        get_from_heap(PQ, _K, SR, RPQ),

        state_record(AbsPlan, S, OS, A, GA, D, SR),

        %% if 'AbsPlan' has one element and its head is a loop
        AbsPlan=[Loop], Loop=[[_,_]|_], !, 
        copy_term(Loop,CPLoop),
        append(CPLoop,AbsPlan,ExAbsPlan),
        state_record(ExAbsPlan, S, OS, A, GA, D, NSR),
        ord_add_element(V, NSR, NNV),
            CPLoop=[[CurAOp,_]|_],
            get_action(A,AD),
            nb_getval(stat_nodes, N),
            nb_getval(tree_size, T),
            nl,nl,writeln('------------------------------------------------------------------'),
            ansi_format([fg(green)], '(Deep: ~3f) (Node: ~d) (Tree: ~d)~n', [D,N,T]),
            ansi_format([fg(magenta)], '(absOp: ~w) (last action: ~w)~n', [CurAOp,AD]),
        %(bagof(K-NS, next_node_abs(SR, PQ, NNV, K, NS), NextNodes); NextNodes=[]),
        (findall(K-NS, next_node_abs(NSR, PQ, NNV, K, NS), NextNodes); NextNodes=[]),
        length(NextNodes, L),
        add_list_to_heap(RPQ, NextNodes, NPQ),

        stat_node(L),
        search_sbpabs(NPQ, NNV, Solution, AbsSolution, C).

search_sbpabs(PQ, V, Solution, AbsSolution, C):-
        get_from_heap(PQ, _K, SR, RPQ),

        state_record(AbsPlan, S, OS, A, GA, D, SR),

        %% if the head of 'AbsPlan' is a loop
        AbsPlan=[Loop|_], Loop=[[_,_]|_], !, 

        %% create two parallel branches
        %% [1] state record 1: a branch from the loop
        copy_term(Loop,CPLoop),
        append(CPLoop,AbsPlan,ExAbsPlan),
        state_record(ExAbsPlan, S, OS, A, GA, D, SR1),
        ord_add_element(V, SR1, NV),

        %% [2] state record 2: a branch from the next absop after loop
        branchAfterLoop(SR, SR2), 
        ord_add_element(NV, SR2, NNV),

            CPLoop=[[CurAOp,_]|_],
            get_action(A,AD),
            nb_getval(stat_nodes, N),
            nb_getval(tree_size, T),
            nl,nl,writeln('------------------------------------------------------------------'),
            ansi_format([bold,fg(green)], '(Deep: ~3f) (Node: ~d) (Tree: ~d)~n', [D,N,T]),
            ansi_format([fg(magenta)], '(absOp: ~w) (last action: ~w)~n', [CurAOp,AD]),

        %(bagof(K-NS, next_node_abs(SR, PQ, NNV, K, NS), NextNodes); NextNodes=[]),
        (findall(K-NS, next_node_abs(SR1, PQ, NNV, K, NS), NextNodes1); NextNodes1=[]),
        (findall(K-NS, next_node_abs(SR2, PQ, NNV, K, NS), NextNodes2); NextNodes2=[]),
        length(NextNodes1, L1),
        length(NextNodes2, L2),
        L is L1 + L2,
        append(NextNodes1, NextNodes2, NextNodes),
        add_list_to_heap(RPQ, NextNodes, NPQ),

        stat_node(L),
        search_sbpabs(NPQ, NNV, Solution, AbsSolution, C).

search_sbpabs(PQ, V, Solution, AbsSolution, C):-
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
        %(bagof(K-NS, next_node_abs(SR, PQ, NV, K, NS), NextNodes) ; NextNodes=[]),
        (findall(K-NS, next_node_abs(SR, PQ, NV, K, NS), NextNodes) ; NextNodes=[]),
        length(NextNodes, L),
        %state_record(_, S, _, _, _, D, SR), write(_K-D), write('  '),write(S), write(L),nl,
        add_list_to_heap(RPQ, NextNodes, NPQ),

        stat_node(L),
        search_sbpabs(NPQ, NV, Solution, AbsSolution, C).

%% if the next absop after loop is itself a loop
branchAfterLoop(SR, NSR):-
        state_record([_|[Loop|AbsPlan]], S, OS, A, GA, D, SR),
        Loop=[[_,_]|_], !, 
        copy_term(Loop,CPLoop),
        append(CPLoop,[Loop|AbsPlan],ExAbsPlan),
        state_record(ExAbsPlan, S, OS, A, GA, D, NSR).

%% ;otherwise (i.e., if the next absop after loop is a absop)
branchAfterLoop(SR, NSR):-
        state_record([_|AbsPlan], S, OS, A, GA, D, SR),
        state_record(AbsPlan, S, OS, A, GA, D, NSR).

%%
%next_node_abs(+StateRecord, +Heap, +VisitedList, -F_Cost, -NewStateRecord):-
next_node_abs(SR, Q, V, C, NewSR):-
        state_record(AbsPlan, S, _, _, _, D, SR),

        %% get the abstract operator name
        AbsPlan=[CurAO|_],CurAO=[CurAOp,_],
        step(S, CurAOp, Action, NewS),

        compute_cost(AbsPlan,Action,G,RestAbsPlan,GA),
        %% only keep actions wih cost equal to 1 (i.e., actoins that verify all features)
        %G=1,

        h(NewS, H),
            %% nl,write(NewS),nl,

        heuristic_weight(W),
        NG is D+G,  %% g(a)=g(old)+g(new)
        C is NG+W*H,  %% f(a)=g(a)+h(a)

            format(' c(~g) d(~g) g(~g) h(~g) f(~g)', [G,D,NG,H,C]),

        % skip if it was already added to VisitedList with the lower cost
        state_record(_, NewS, _, _, _, NG, Temp),
        \+ my_ord_member2(Temp, V),

        % skip if it was already added to OpenedList with the lower cost
        heap_to_list(Q, PQL),
        \+ my_ord_member3(Temp, PQL),

        state_record(RestAbsPlan, NewS, S, Action, GA, NG, NewSR).

%%

heuristic_weight(W):- nb_current(weight, W), !.
heuristic_weight(1).

%next_node_abs(+StateRecord, +Queue, +Visited, -EstimateDeep, -NewStateRecord)
%next_node_abs(SR, Q, V, E, NewSR):-
%        nb_getval(require_keys, R),
%        not(member(fluents,R)),!,
%        state_record(AbsPlan, S, _, _, _, D, SR),
%        step(S, A, NewS),
%        state_record(_, NewS, _, _, _, _, _, Temp),
%            statistics(runtime, [ST2,_]),
%        \+ my_ord_member(NewS, V),
%        	 heap_to_list(Q, PQL),
%        \+ member(Temp, PQL),
%            statistics(runtime, [FT2,_]),
%            RT2 is FT2-ST2,
%            get_action_name(A,AN),
%            %format('[~3d]\t\t~w~n', [RT2,AN]),
%        h(S, H),
%        E is H+D,
%        ND is D+1,
%        state_record(AbsPlan, NewS, S, A, _, ND, NewSR).

%%

