:- set_prolog_stack(trail,  limit(20000000000)).
:- set_prolog_stack(local,  limit(2000000000)).
:- set_prolog_stack(global, limit(10*1024*1024*1024)).

% to stop singleton variable warning
:- style_check(-singleton).

%% to avoid the abbreviate outputs (prints)
%:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true)]).
:- set_prolog_flag(answer_write_options, [quoted(true),portray(true),spacing(next_argument)]).

%:-use_module(library(timeout)).
:-use_module(library(lists)).
:-use_module(library(ordsets)).
:-use_module(library(heaps)).

:-[sicstus/timeout].
:-[parseProblem, parseDomain, feature_verification, activity_schemata].
:-['../learning/Models/race_feature_extraction'].
:-['../learning/utilities'].
:-['../learning/cbr'].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        

%actions_to_ord_actions(+Actions,-OrdActions)
actions_to_ord_actions([],[]):-!.
actions_to_ord_actions([A|RA],[OA|ROA]):-
    get_action_name(A, N),
    get_parameters(A, Arg),
    get_parent_name(A, P),
    get_parent_args(A, ArgAbs),
    get_precondition_static(A, PS),
    get_precondition(A, PP),
    get_neg_precondition(A, PN),
    get_pos_eq_precondition(A, PEQ),
    get_neg_eq_precondition(A, NNEQ), ch_inequality_op(NNEQ, NEQ),
    get_pos_or_precondition(A, POP),
    get_neg_or_precondition(A, PON),
    get_positive_effect(A, EP),
    get_negative_effect(A, EN),
    get_assign_effect(A, AE),

    term_to_ord_term(PS,OPS),
    term_to_ord_term(PP,OPP),
    term_to_ord_term(PN,OPN),
    term_to_ord_term(PEQ,OPEQ),
    term_to_ord_term(NEQ,ONEQ),
    term_to_ord_term(POP,OPOP),
    term_to_ord_term(PON,OPON),
    term_to_ord_term(EP,OEP),
    term_to_ord_term(EN,OEN),

    OA=action(N,Arg,P,ArgAbs,OPS,OPP,OPN,PEQ,NEQ,OPOP,OPON,OEP,OEN,AE),
    actions_to_ord_actions(RA,ROA).

%replace '=' with '\=' in negative equality preconditions
ch_inequality_op([], []) :-!.
ch_inequality_op([E|NEQ], [N|NNEQ]) :-
    E=..[_|A], N=..[\=|A],
    ch_inequality_op(NEQ,NNEQ).


%term_to_ord_term(+Term, -OrdTerm)
% Go throught the term and look for sets, return the same term
% with all sets become ordered.
term_to_ord_term(A, A):-var(A), !.
term_to_ord_term([], []):-!.
term_to_ord_term(A, A):-atomic(A), !.
term_to_ord_term([H|T], R):-
                term_to_ord_term(H, OH),
                term_to_ord_term(T, OT),
                 ord_add_element(OT, OH, R), !.
%               write(OH), write(OT), write('   '), write(R), nl.
term_to_ord_term(T, OT):-
                T =.. [F,P], !,
                term_to_ord_term(P, OP),
                OT =..[F,OP].
term_to_ord_term(T, OT):-
                T =.. [F,P|Ps],
                NT=.. [F|Ps],
                term_to_ord_term(P, OP),
                term_to_ord_term(NT, ONT),
                ONT =.. [_|OPs],
                OT =.. [F,OP|OPs], !.



% mysubset(+Subset, +Set)
% It is similar to subset/2. Subset can include free variables that are 
% grounded with atoms of Set.
mysubset([], _):-!.
mysubset([X|R], S):- member(X, S), mysubset(R, S).

% to verify negative precondition
mysubset2([], _).
mysubset2([X|R], S):- not(member(X, S)), mysubset2(R, S).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% unification of positive and negative preconditions 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
unify_preconditions([], _):-!.
unify_preconditions([X|R], S):- member(X, S), unify_preconditions(R, S).

unify_preconditions_equality([], _):-!.
unify_preconditions_equality([X|Y],S):-
    ground(X),
    X=..['='|[A1,A2]],
    A1=A2, !,
    unify_preconditions_equality(Y,S).

unify_neg_precondition([], _):-!.
unify_neg_precondition([X|R], S):- not(member(X, S)), unify_neg_precondition(R, S).

unify_neg_precondition_equality([], _):-!.
unify_neg_precondition_equality([X|R], S):- 
    ground(X),
    X=..[\=|[A1,A2]],
    A1\=A2, !,
    unify_neg_precondition_equality(R, S).

%%%%%%%%%%
%%%%%%%%%%


% Colenction shortcuts functions.
% get(+Structure, -Parameter)
get_domain_name(            domain(N, _, _, _, _, _, _, _), N).
get_actions(                domain(_, _, _, _, _, _, _, A), A).
get_require_keys(           domain(_, R, _, _, _, _, _, _), R).
get_types(                  domain(_, _, T, _, _, _, _, _), T).
get_constants(              domain(_, _, _, C, _, _, _, _), C).
get_predicates(             domain(_, _, _, _, P, _, _, _), P).
get_problem_name(           problem(N, _, _, _, _, _, _, _, _, _, _), N).
get_problem_entities(       problem(_, E, _, _, _, _, _, _, _, _, _), E).
get_static(                 problem(_, _, _, _, _, S, _, _, _, _, _), S).   % static knowledge
get_init(                   problem(_, _, _, _, _, _, I, _, _, _, _), I).   % initial knowledge
get_goal(                   problem(_, _, _, _, _, _, _, G, _, _, _), G).
get_metric(                 problem(_, _, _, _, _, _, _, _, _, M, _), M).
get_objects(                problem(_, _, _, _, O, _, _, _, _, _, _), O).
get_precondition_static(    action(_, _, _, _, K, _, _, _, _, _, _, _, _, _), K).
get_precondition(           action(_, _, _, _, _, P, _, _, _, _, _, _, _, _), P). % positive preconditions
get_neg_precondition(       action(_, _, _, _, _, _, NP, _, _, _, _, _, _, _), NP).
get_pos_eq_precondition(    action(_, _, _, _, _, _, _, PE, _, _, _, _, _, _), PE).
get_neg_eq_precondition(    action(_, _, _, _, _, _, _, _, NE, _, _, _, _, _), NE).
get_pos_or_precondition(    action(_, _, _, _, _, _, _, _, _, P, _, _, _, _), P).
get_neg_or_precondition(    action(_, _, _, _, _, _, _, _, _, _, NP, _, _, _), NP).
get_positive_effect(        action(_, _, _, _, _, _, _, _, _, _, _, PE, _, _), PE).
get_negative_effect(        action(_, _, _, _, _, _, _, _, _, _, _, _, NE, _), NE).
get_assign_effect(          action(_, _, _, _, _, _, _, _, _, _, _, _, _, AE), AE).
get_parameters(             action(_, P, _, _, _, _, _, _, _, _, _, _, _, _), P).
get_parent_name(            action(_, _, P, _, _, _, _, _, _, _, _, _, _, _), P).
get_parent(                 action(_, _, P, A, _, _, _, _, _, _, _, _, _, _), F):- F=..[P|A].
get_parent_args(            action(_, _, _, A, _, _, _, _, _, _, _, _, _, _), A).
% for feature extraction
%get_parent_target_args(     action(_, _, move, [_,A], _, _, _, _, _, _, _, _, _, _), [A]):-!.
get_parent_target_args(     action(_, _, _, A, _, _, _, _, _, _, _, _, _, _), A).
get_action_name(            action(N, _, _, _, _, _, _, _, _, _, _, _, _, _), N).
get_action_def(             action(Name, Params, _, _, _, _, _, _, _, _, _, _, _, _), F):-
        untype(Params, UP),
        F =.. [Name|UP].


% get_action(-Action, -ActionDef)
get_action(A):-
        get_action(A, _). 
get_action(nil, nil).
get_action(A, ActionDef):-
        nb_getval(actions, As),
        member(Afree, As),
        copy_term_spec(Afree, A),
%       A =.. [_, Name, Params|_],
        get_action_def(A, ActionDef).


get_goal(G):-nb_getval(goalState, G).
get_static(I):-nb_getval(staticInfo, I).
get_init(I):-nb_getval(initialState, I).


%untype(LitOfParams, UntyperList).
untype([], []).
untype([H|T], L):- compound(H), H =.. [_,U], !, untype(T, Us), append(U,Us,L).
%untype([H|T], [U|Us]):- compound(H), H =.. [_,[U]], !, untype(T, Us).
untype([H|T], [H|Us]):- untype(T, Us).

%setInit(+Init, -State)
setInit([], []).
setInit([set(F, V)|Ls], S):-
    F =.. A,
    concat_atom(A, '-', CA),
    nb_setval(CA, V),
%   write(CA),write(' '), write(V),  nl,
    setInit(Ls, S), !.
setInit([A|Ls], [A|Ss]):-
    setInit(Ls, Ss).

% concat_atom(+List, +Delimiter, -ConcatenateAtom)
concat_atom([E1, E2], D, O):-
        atom_concat(E1, D, Temp),
        atom_concat(Temp, E2, O).
concat_atom([H|T], D, O):-
        concat_atom(T, D, Ts),
        atom_concat(H, D, Temp),
        atom_concat(Temp, Ts, O).


% Special version of copy_term. variable x represented as ?(x)
% All occurs of ?(x) are replaced with real prolog variables.
% Modified version of code published by Bartak: http://kti.mff.cuni.cz/~bartak/prolog/data_struct.html
copy_term_spec(A,B):-           cp(A,[],B,_).

cp(A,Vars,A,Vars):-     atomic(A), A\= ?(_).
cp(?(V),Vars,NV,NVars):-    atomic(V), register_var(V,Vars,NV,NVars).
cp(V,Vars,NV,NVars):-       var(V),register_var(V,Vars,NV,NVars).

cp(Term,Vars,NTerm,NVars):-
        compound(Term),
        Term \= ?(_),
        Term=..[F|Args],    % decompose term
        cp_args(Args,Vars,NArgs,NVars),
        NTerm=..[F|NArgs].  % construct copy term
cp_args([H|T],Vars,[NH|NT],NVars):- cp(H,Vars,NH,SVars),
cp_args(T,SVars,NT,NVars).
cp_args([],Vars,[],Vars).

% During copying one has to remeber copies of variables which can be used further during copying.
% Therefore the register of variable copies is maintained.
register_var(V,[X/H|T],N,[X/H|NT]):-
        V\==X,         % different variables
        register_var(V,T,N,NT).
register_var(V,[X/H|T],H,[X/H|T]):-
        V==X.          % same variables
register_var(V,[],N,[V/N]).



%minOfList(+List, -MaxiamlItem)
%Find minimum value of the list
minOfList([X|Xs], Min):-
    minOfList(Xs, X, Min).
minOfList([], Min, Min).
minOfList([X|Xs], Min0, Min):-
    ( X @< Min0 -> Min1 = X ; Min1 = Min0 ),
    minOfList(Xs, Min1, Min).



reset_statistic:-
        nb_setval(stat_nodes, 0),
        nb_setval(tree_size, 0),
        statistics(runtime, [T,_]),
        nb_setval(startTime, T).

show_statistic:-
        nb_getval(stat_nodes, N),
        nb_getval(startTime, T0),
        statistics(runtime, [T1,_]),
        statistics(memory, [M, _]),
        T is T1-T0,
        format('~3d sec      ~d nodes        ~d bytes~n', [T, N, M]).

%show_statistic(+Problem, +Solution).
show_statistic(S, AS):-
        !, show_statistic(sbp, S, AS).
show_statistic(SBP, S, AS):-
        ground(S),
        nb_getval(domain, Domain),
        nb_getval(problem, Problem),
        nb_getval(task, Name),
        nb_getval(entities, Ents),
        nb_getval(stat_nodes, N),
        nb_getval(tree_size, E),
        nb_getval(startTime, T0),
        statistics(runtime, [T1,_]),
        statistics(memory, [M, _]),
        T is T1-T0,
        length(S, L),
        ansi_format([fg(yellow)], '~nDomain: ~w~nProblem: ~w', [Domain,Problem]), nl,
        ansi_format([fg(yellow)], '~n~a ~w~n', [Name,Ents]), nl,
        solution_to_lisp(S,NS), nl,
        %%ansi_format([fg(yellow)], '~ninstantiated abstract plan~n', []), nl,
        %%write_list_to_console_nl(AS),nl,
        ansi_format([bg(green)], '~n(Time-~3d) (ExNodes-~d) (TreeSize-~d) (Memory-~d) (Plan-~d)~n', [T, N, E, M, L]), nl,
        !,
        nb_setval(statistics_time_memory,[['Time(3d)',T],['Memory(B)',M]]),
        nb_setval(statistics_solution,NS),
        nb_setval(statistics_abssolution,AS),

        %% record for plot
        file_directory_name(Problem,Dir),
        file_base_name(Dir, Avg),
        directory_file_path(Dir,Avg,F),
        (SBP=sbpabs, string_concat(F,'_abs.avg',File), !;
         string_concat(F,'.avg',File)),
        open(File,append,Stream),
        file_base_name(Problem, Prob),
        write(Stream,Prob),write(Stream,' '),
        write(Stream,T),write(Stream,' '),
        write(Stream,T),write(Stream,' '),
        write(Stream,N),write(Stream,' '),
        write(Stream,E),write(Stream,' '),
        write(Stream,M),write(Stream,' '),
        write(Stream,L),write(Stream,' '),nl(Stream),
        close(Stream).

show_statistic(_, _, _):-
        ansi_format([bold,fg(red)], '~nshow_statistic failed ... !!!!~n', []), nl, !.

solution_to_lisp([],[]).
solution_to_lisp([H|T],[A|RT]):-
        get_action(H,A),
        A =.. [F|P],
        write('('),
        write(F),
        write_list(P),
        writeln(') '),
        solution_to_lisp(T,RT).
    
write_list([]).
write_list([H|T]):-
        write(' '), write(H),
        write_list(T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% > record expanded nodes and memory in every node expansion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initial_statistics:-
initial_statistics:-
        reset_statistic,
        (exists_directory('test/logs/'),!;make_directory('test/logs/')),
        get_time(Stamp),
        stamp_date_time(Stamp, DateTime, local),
        format_time(atom(T), "%d_%b_%y", Stamp),
        %format_time(atom(F), "%Y%m%d%H%M%S", Stamp),
        format_time(atom(F), "%H%M%S", Stamp),

        string_concat('test/logs/',T,D),
        (exists_directory(D),!;make_directory(D)),

        string_concat(D,'/',Dir),

        nb_getval(problem, ProblemFile),
        file_base_name(ProblemFile,Base1),
        string_concat(Base1,'_',Base2),
        string_concat(Base2,F,Base3),
        string_concat(Dir,Base3,File),
        string_concat(File,'.log',Filename),

        nb_setval(statistics_recfile,Filename),
        nb_getval(task, N),
        nb_getval(entities, E),
        Prob=..[N,E],
        nb_setval(statistics_problem,Prob).

record_statistics:-
        nb_getval(statistics_recfile,Filename),
        open(Filename,append,Stream),
        nb_getval(domain, Domain),
        nb_getval(problem, Problem),
        write(Stream,'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl(Stream),
        write(Stream,'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl(Stream),
        write(Stream,Domain),nl(Stream),
        write(Stream,Problem),nl(Stream),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        nb_getval(domain_name, DN),
        write(Stream,DN),nl(Stream),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        nb_getval(statistics_problem,Prob),
        write(Stream,Prob),nl(Stream),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        nb_getval(statistics_time_memory,STM),
        write_list_to_file_nl(Stream,STM),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        nb_getval(stat_nodes, N),
        nb_getval(tree_size, E),
        write_list_to_file_nl(Stream,[['Search tree size',E],['Nodes expanded',N]]),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        nb_getval(statistics_solution,S),
        length(S,L),
        write(Stream,['Plan',L]),nl(Stream),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        write_list_to_file_nl(Stream,S),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        write(Stream,['Used activity schema']),nl(Stream),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        nb_getval(statistics_used_schema,[OT,OA,OO,OG]),
        write(Stream,[OT,OA]),nl(Stream),
        write(Stream,OG),nl(Stream),nl(Stream),
        write_list_to_file_nl(Stream,OO),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        write(Stream,['Instantiated activity schema']),nl(Stream),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        nb_getval(schema,[T,A,_,_]),
        nb_getval(statistics_abssolution,AS),
        write(Stream,[T,A]),nl(Stream),
        %write(Stream,G),nl(Stream),nl(Stream),
        write_list_to_file_nl(Stream,AS),
        write(Stream,'--------------------------------------------------------'),nl(Stream),
        ansi_format([fg(green)], '~nresults were recorded in ~w', [Filename]),
        close(Stream).


write_list_to_file_nl(_,[]).
write_list_to_file_nl(S,[H|T]):-
        write(S,H),
        nl(S),
        write_list_to_file_nl(S,T).

write_list_to_console_nl([]).
write_list_to_console_nl([H|T]):-
        write(H),nl,
        write_list_to_console_nl(T).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% > generate plan for execution manager
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%write_out_plan(+Solution)
write_out_plan(S):-
    open('/tmp/plan', write, File),
    length(S,L),
    write(File, 'cost: '),
    write(File, L),
    write(File, '\ndecomposition:'),
    write(File, '\noperators:'),
    write_plan_list(File,S),
    close(File).

%write_plan_list(+FilePointer, +Solution)
write_plan_list(_, []):-!.
write_plan_list(File, [H|T]):-
    write(File, '\n-'),
    get_action_name(H,N), write(File, '\noperator: !'), write_action(File, N),
    get_action_arguments(H,P), write(File, '\nargs: '), write(File, P),
    get_precondition(H,PP), refine(PP,NPP), write(File, '\npreconditions: ['), write_predicates(File, NPP), write(File, ']'),
    get_positive_effect(H,PE), refine(PE,NPE), write(File, '\nadds: ['), write_predicates(File, NPE), write(File, ']'),
    get_negativ_effect(H,NE), write(File, '\ndeletes: ['), write_predicates(File, NE), write(File, ']'),
    write_plan_list(File,T).

write_action(File, N):-
    (N='move_base_blind_to_ma'; N='move_base_blind_to_pma'),!,
    write(File, 'move_base_blind').
write_action(File, N):-
    write(File, N).


%write predicates in the form of '(name arg1 arg2)'
write_predicates(_,[]):-!.
write_predicates(File,[H]):-
    H=..[N|[A,B]],
    write(File, '('), 
    write(File, N),
    write(File, ' '), 
    write(File, A),
    write(File, ' '), 
    write(File, B),
    write(File, ')'),!.
write_predicates(File,[H|T]):-
    H=..[N|[A,B]],
    write(File, '('), 
    write(File, N),
    write(File, ' '), 
    write(File, A),
    write(File, ' '), 
    write(File, B),
    write(File, '),'), 
    write_predicates(File,T).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > get action arguments for execution manager
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
get_action_arguments(action(tuck_arms,[armposture([_,_,_,_,A,B,_,_])],_,_,_,_,_,_,_), [A,B]) :- !.
get_action_arguments(action(move_arms_to_carryposture,[armposture([_,_,_,_,_,_])],_,_,_,_,_,_,_), []) :- !.
get_action_arguments(action(move_arm_to_side,[arm([A]),armposture([_,_,_])],_,_,_,_,_,_,_), [A]) :- !.
get_action_arguments(action(move_torso,[torso(_),torsoposture([_,_,A,_])],_,_,_,_,_,_,_), [A]) :- !.
%get_action_arguments(action(move_base,[movebasearea([_,A]),robotat(_)],_,_,_,_,_,_,_), [A]) :- !.
%get_action_arguments(action(move_base_blind_to_ma,[manipulationarea([A]),premanipulationarea(_),robotat(_)],_,_,_,_,_,_,_), [A]) :- !.
%get_action_arguments(action(move_base_blind_to_pma,[manipulationarea(_),premanipulationarea([A]),robotat(_)],_,_,_,_,_,_,_), [A]) :- !.
get_action_arguments(action(move_base,[movebasearea([_,A])],_,_,_,_,_,_,_), [A]) :- !.
get_action_arguments(action(move_base_blind_to_ma,[manipulationarea([A]),premanipulationarea(_)],_,_,_,_,_,_,_), [A]) :- !.
get_action_arguments(action(move_base_blind_to_pma,[manipulationarea(_),premanipulationarea([A])],_,_,_,_,_,_,_), [A]) :- !.
get_action_arguments(action(pick_up_object,[kitchenware([A]),arm([B])],_,_,_,_,_,_,_), [A,B]) :- !.
get_action_arguments(action(place_object,[kitchenware([A]),arm([B]),placingarea([C])],_,_,_,_,_,_,_), [A,B,C]) :- !.
get_action_arguments(action(observe_objects_on_area,[placingarea([A])],_,_,_,_,_,_,_), [A]) :- !.
get_action_arguments(A, P) :- get_action_def(A,AD), AD=..[_|P], !.

refine([],[]):-!.
refine([H], []):- H=..['instance'|['thing','thing']], !.
refine([H|T],R):- H=..['member'|_], refine(T,R),!.
refine([H|T],R):- H=..['get_new_constant'|_], refine(T,R),!.
refine([H|T],R):- H=..['get_type'|_], refine(T,R),!.
refine([H|T],R):- H=..['='|_], refine(T,R),!.
refine([H|T],[H|R]):- refine(T,R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


stat_node(L):-
        nb_getval(stat_nodes, N), NN is N+1, nb_setval(stat_nodes, NN),
        nb_getval(tree_size, T), NT is T+L, nb_setval(tree_size, NT).


space(0):-!.
space(I):-
    write('  '),
    NI is I-1,
    space(NI).
    
writel([]):-nl.
writel([H|T]):-
        write(H),nl,
        writel(T).

w(X):-
    var(X),
    domain(X, D, F),!,
    write(X=D-F).
w(X):-
    var(X),!,
    write(X).

w(X):-
    atomic(X),!,
    write(X).
w([H|T]):-
    write('['), !,
    w_list([H|T]),
    write(']').
w(X):-
    compound(X),!,
    X=..[F|L],
    write(F),write('('),
    w_params(L),
    write(')').
w_params([H]):-
    w(H).
w_params([H,H2|T]):-
    w(H),write(','),
    w_params([H2|T]).
w_list([H]):-
    w(H), !.
w_list([H|T]):-
    w(H),
    write(','),
    w_list(T).


%state_record(AbsPlan, State, PreviousState, Action, GroundAbsOp, Deep, StateRecord) (new version)
state_record(EAO, S, PS, A, GA, D, [EAO, S, PS, A, GA, D]).

%solution(+StateRecord, +Visited, -ListOfActions)
solution(SR, V, L):-
        solution(SR, V, [], L).
solution(SR, _, L, L):-
        state_record(_, _, nil, nil, nil, _, SR), !.
solution(SR, V, R, L):-
        state_record(_, _, PS, AD, _, _, SR),
        state_record(_, PS, _, _, _, _, Previous),
        member(Previous, V),
        solution(Previous, V, [AD|R], L).

%solution_absplan(+StateRecord, +Visited, -ListOfActions)
solution_absplan(SR, V, L):-
        solution_absplan(SR, V, [], L).
solution_absplan(SR, _, L, L):-
        state_record(_, _, nil, nil, nil, _, SR), !.
solution_absplan(SR, V, R, L):-
        state_record(_, _, PS, _, nil, _, SR), !,
        state_record(_, PS, _, _, _, _, Previous),
        member(Previous, V),
        solution_absplan(Previous, V, R, L).
solution_absplan(SR, V, R, L):-
        state_record(_, _, PS, _, GA, _, SR),
        state_record(_, PS, _, _, _, _, Previous),
        member(Previous, V),
        solution_absplan(Previous, V, [GA|R], L).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Handling mutexes

make_mutex(M):-
        bagof(R1, forbiden_pair(R1), MA),
        bagof(R2, forbiden_pair(MA, R2), MB),
%       writel(MA),nl,
%       writel(MB),nl,
        union(MA, MB, M0),
%       list_to_set(M0_, M0),
%       write('Cistim:'),nl,    
        clear_mutex1(M0, M1),
        clear_mutex2(M1, M2),
        clear_duplicates(M2, M).
        %write('Ocistene:'),nl,writel(M),nl, length(M, L), write('Pocet: '), write(L),nl.

clear_duplicates([], []).
clear_duplicates([H|T], R):-
    member(M, T),
    identical_but_for_variables(H, M),
    !,
    clear_duplicates(T, R).
clear_duplicates([H|T], [H|R]):-
    clear_duplicates(T, R).

forbiden_pair(R):-
        get_action(A),
        get_positive_effect(A, PE),
        get_negativ_effect(A, NE),
        member(P, PE),
        member(Q, NE),
        copy_term_spec(P-Q, R).
forbiden_pair(MA, NR):-
        member(P-Q, MA),
        get_action(A),
        get_precondition(A, Precond),
        get_positive_effect(A, PE),
        member(R, Precond),
        member(P, PE),
        copy_term_spec(R-Q, NR).

clear_mutex1([], []):-!.
clear_mutex1([PP-QQ|T], M):-
        (P-Q = PP-QQ ; P-Q = QQ-PP),
        get_init(I),
        select(P, I, R),
        member(Q, R),
%       write('Rule1: '), write(PP-QQ),nl,
        clear_mutex1(T, M), !.
clear_mutex1([P-Q|R], [P-Q|M]):-
        clear_mutex1(R, M).

clear_mutex2(M0, M):-
        (select(P-Q, M0, R) ; select(Q-P, M0, R)),
        get_action(A, _Def), get_precondition(A, Precond), get_positive_effect(A, PE), get_negativ_effect(A, NE),
        select(P, PE, RPE),
        \+ member(Q, NE),
        (
            member(Q, RPE)%, write('prva cast') % the first part
            ;
            all_not_in(Precond, P, Q, M0)%, write('druha cast') % % the second part
        ),
%       write('Rule2: '), write(P-Q-_Def),nl,

        clear_mutex2(R, M), !.
clear_mutex2(M0, M0).

all_not_in([], _, _, _).
all_not_in([P|T], P, Q, M):-
    all_not_in(T, P, Q, M).
all_not_in([R|T], P, Q, M):-
        \+ (member(R-Q, M) ; member(Q-R, M)),
        %write(precon-R),nl,
        all_not_in(T, P, Q, M).



%check_mutex(+State).
check_mutex(S):-
        nb_getval(mutex, M),
        pairfrom(S, P, Q, _),
        (member(P-Q, M) ; member(Q-P, M)),
%       write('Mutex pair.'), write(P-Q), nl,
        !, fail.
check_mutex(_).


identical_but_for_variables(X, Y) :-
        \+ \+ (
            copy_term(X, Z),
            numbervars(Z, 0, N),
            numbervars(Y, 0, N),
            Z = Y
        ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > some utility functions to generate new constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

reset_counter :-
    retractall(last_number(_)),
    assert(last_number(100)).

get_next_number(A) :-
    not(clause(last_number(_),true)),
    assert(last_number(100)),
    get_next_number(A).

get_next_number(A) :-
    clause(last_number(A),true),
    retractall(last_number(_)),
    X is A+1,
    assert(last_number(X)).

get_new_constant(Var) :-
    get_next_number(N),
    atom_chars(N,L),
    append([x],L,L2),
    atom_chars(Var,L2).

get_new_constant(Atom, Var) :-
    get_next_number(N),
    atom_chars(N,L),
    atom_chars(Atom,AtomL),
    append(AtomL,L,L2),
    atom_chars(Var,L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > return true if two given states are equal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%is_repeated(+State,+State)
is_repeated([],[]):-!.

is_repeated([X|S1],[Y|S2]):-
    X=..[P|_],
    Y=..[Q|_],
    P\=Q,!,fail.

is_repeated([X|S1],[Y|S2]):-
    X=..[hasarmposture|[A,_]],
    Y=..[hasarmposture|[A,_]],!,
    is_repeated(S1,S2).

is_repeated([X|S1],[Y|S2]):-
    X=..[hasgripperposture|[A,_]],
    Y=..[hasgripperposture|[A,_]],!,
    is_repeated(S1,S2).

is_repeated([X|S1],[Y|S2]):-
    X=..[hastorsoposture|[A,_]],
    Y=..[hastorsoposture|[A,_]],!,
    is_repeated(S1,S2).

is_repeated([X|S1],[Y|S2]):-
    X=..[instance|[A,_]],
    Y=..[instance|[A,_]],!,
    is_repeated(S1,S2).

is_repeated([X|S1],[Y|S2]):-
    X=Y,!,
    is_repeated(S1,S2).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > return true if two given states are equal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Variabilization: new predicates, developed for RACE
%  to create a mapping from constants to variables

variabilize_list_of_terms_consistent([],[],Map,Map)
:- !.

variabilize_list_of_terms_consistent([T|L1],[G|L2],MapIn,MapOut)
:- variabilize_term_consistent(T,G,MapIn,MapAux),
   variabilize_list_of_terms_consistent(L1,L2,MapAux,MapOut).

variabilize_term_consistent(not(T),not(G),MapIn,MapOut)
:- !, variabilize_term_consistent(T,G,MapIn,MapOut).

variabilize_term_consistent(T,G,MapIn,MapOut)
:- T =.. [H|A],
   varargs_consistent(A,V,MapIn,MapOut),
   G =.. [H|V],!.

varargs_consistent([],[],Map,Map)
:- !.

varargs_consistent([X|Y],[A|B],Map,MapAux)
:- member_of(X,A,Map),
   varargs_consistent(Y,B,Map,MapAux).

varargs_consistent([X|Y],[A|B],Map,[(X,A)|MapAux])
:- varargs_consistent(Y,B,Map,MapAux).

%% member_of(_,_,[])
%% :-!.

member_of(X,V,[(X,V)|_])
:-!.

member_of(X,V,[_|R])
:- member_of(X,V,R).


%variabilize_abstract_solution(+AbsSolution,-VariablizedAbsSolution)
variabilize_abstract_solution([],[],Map,Map)
:- !.

variabilize_abstract_solution([A|AbsSoln],[V|VAbsSoln],MapIn,MapOut)
:- A=[Op,[F1-F2]],
   variabilize_term_consistent(Op,VOp,MapIn,MapAux1),
   variabilize_features1_consistent(F1,VF1,MapAux1,MapAux2),
   %%Note: VF2 should be also generated ...
   V=[VOp,[VF1-F2]],
   variabilize_abstract_solution(AbsSoln,VAbsSoln,MapAux2,MapOut).

%%

variabilize_features1_consistent([],[],Map,Map)
:-!.

variabilize_features1_consistent([T|F],[G|R],MapIn,MapOut)
:- T =.. [H,P],
   P =.. [N|A],
   varargs_consistent(A,V,MapIn,MapAux),
   K =.. [N|V],
   G =.. [H,K],
   variabilize_features1_consistent(F,R,MapAux,MapOut).
