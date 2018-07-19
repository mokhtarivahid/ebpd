% to stop singleton variable warning
:- style_check(-singleton).

%:- activity_schema(+TaskName,+Arguments,+EnrichedOperators)
%:- activity_schema(N,A,O).
% (new version) includes inferred goal
%:- activity_schema(+TaskName,+Arguments,+EnrichedOperators,+Goal)
%:- activity_schema(N,A,O,G).

init_activity_schema:-
    nb_getval(task,T),
    nb_getval(entities,E),
    activity_schema(T,A,O,G),

    %% record used activity schema for logging
    nb_setval(statistics_used_schema,[T,A,O,G]),

    E=A, !,


    %[1] instantiate 'at_start' predicates in activity schema
    %at_start_instantiation(O),

    %[2] associate activity schema
    %order_features(O, OA),
    copy_loops(O,CO),
    nb_setval(schema,[T,A,CO,G]),
        %writeln('\nTask'-T),
        %writeln('Args'-A),
        %writeln('Activity_Schema'-OA),

    %[3] retractall activity schemata
    retractall(activity_schema(_,_,_,_)).

init_activity_schema:-
    nb_getval(task,T),
    nb_getval(entities,E),
    activity_schema(T,A,O,G), !,
    format('\nNO MATCH FOR ~w(~w) AND ~w(~w)~n~n',[T,E,T,A]),
    nb_setval(schema,[T,A,O,G]),
    retractall(activity_schema(_,_,_,_)),
    false.

init_activity_schema:-
    nb_getval(task,T),
    format('\nNO ACTIVITY SCHEMA FOR: ~w~n~n',[T]),
    nb_setval(schema,nil),
    retractall(activity_schema(_,_,_,_)),
    false.

%%
%make distinct copies of loops
copy_loops([],[]).
copy_loops([L|R],[CL|CR]):-
    L=[[_,_]|_], !, %% if L is a loop
    copy_term(L,CL),
    copy_loops(R,CR).
copy_loops([A|R],[A|CR]):-
    copy_loops(R,CR).
%%

%%

init_goal:-
    %nb_getval(schema,[T,A,O,G]),
    %nb_getval(schema,[Task,Args,AbsOp,G]),
    %copy_term([Task,Args,AbsOp],[T,A,O]),

    %[1] instantiate goal predicates
    %goal_instantiation(G),

    nb_getval(goalState, G),

    %[2] associate ordered goal
    term_to_ord_term(G, OG),
    nb_setval(goal,OG),
        %writeln('\nGoal'-OG),

    %[3] associate problem entities (task arguments + goal arguments)
    get_goal_entities(G,GEnts),
    rm_repeatitions(GEnts,NGEnts),
        %writeln('Ents:'-E),nl,
        %writeln('GoalEnts:'-NGEnts),nl,
    nb_getval(entities,E),
    union(NGEnts,E,AllEnts),
    %nb_setval(problem_entities,AllEnts),
    %% for new dwr only episode entities are used
    nb_setval(problem_entities,E).
        %writeln('AllEnts:'-E),nl.

    %nb_setval(schema,[T,A,O,G]).

%%%% init_goal:-
%%%%     %nb_getval(schema,[T,A,O,G]),
%%%%     nb_getval(schema,[Task,Args,AbsOp,G]),
%%%%     copy_term([Task,Args,AbsOp],[T,A,O]),
%%%% 
%%%%     %[1] instantiate goal predicates
%%%%     goal_instantiation(G),
%%%% 
%%%%     %[2] associate ordered goal
%%%%     term_to_ord_term(G, OG),
%%%%     nb_setval(goal,OG),
%%%%         writeln('\nGoal'-OG),
%%%% 
%%%%     %[3] associate problem entities (task arguments + goal arguments)
%%%%     get_goal_entities(G,GEnts),
%%%%     rm_repeatitions(GEnts,NGEnts),
%%%%         %writeln('Ents:'-E),nl,
%%%%         %writeln('GoalEnts:'-NGEnts),nl,
%%%%     nb_getval(entities,E),
%%%%     union(NGEnts,E,AllEnts),
%%%%     nb_setval(problem_entities,AllEnts),
%%%%         writeln('AllEnts:'-AllEnts),nl,
%%%% 
%%%%     nb_setval(schema,[T,A,O,G]).

%%

init_key_propositions:-
    nb_getval(initialState, IS),
    nb_getval(staticInfo, SWI),
    nb_getval(goal,G),

    findall(at_start(X), (member(X,IS), X=..[P|_], P\=instance), LAS),
    findall(throughout(X), (member(X,SWI), X=..[P|_], P\=instance), LSWI),
    findall(at_goal(X), (member(X,G), X=..[P|_], P\=instance), LG),

    append(LAS,LSWI,L1),
    append(L1,LG,KP),
    %rm_throughout_from_at_goal(KP,NKP),
    %nb_setval(key_propositions,NKP),
    term_to_ord_term(KP, OKP),
    nb_setval(key_propositions,OKP).
        %writeln('Key_propositions'-KP),nl.
        %writeln('\nNewKey_propositions'-NKP),nl.

%%%
%%%%%%%%%% rm_at_goal_from_throughout(KeyProps_g,NKeyProps_g):-
%%%%%%%%%%    bagof(at_start(X), member(at_start(X),KeyProps_g),LAS),
%%%%%%%%%%    bagof(throughout(X), member(throughout(X),KeyProps_g),LTO),
%%%%%%%%%%    (bagof(at_goal(X), member(at_goal(X),KeyProps_g),LAG); LAG=[]),
%%%%%%%%%%       %writeln('LAS'-LAS),
%%%%%%%%%%       %writeln('LTO'-LTO),
%%%%%%%%%%       %writeln('LAG'-LAG),
%%%%%%%%%%    bagof(throughout(X), (member(throughout(X),LTO), \+member(at_goal(X),LAG)), NLTO),
%%%%%%%%%%       %writeln('NLTO'-NLTO),
%%%%%%%%%%    append(LAS,NLTO,L1),
%%%%%%%%%%    append(L1,LAG,NKeyProps_g).

%%%%%%%%%% rm_throughout_from_at_goal(KeyProps_g,NKeyProps_g):-
%%%%%%%%%%    bagof(at_start(X), member(at_start(X),KeyProps_g),LAS),
%%%%%%%%%%    bagof(throughout(X), member(throughout(X),KeyProps_g),LTO),
%%%%%%%%%%    (bagof(at_goal(X), member(at_goal(X),KeyProps_g),LAG); LAG=[]),
%%%%%%%%%%       %writeln('LAS'-LAS),
%%%%%%%%%%       %writeln('LTO'-LTO),
%%%%%%%%%%       %writeln('LAG'-LAG),
%%%%%%%%%%    (bagof(at_goal(X), (member(at_goal(X),LAG), \+member(throughout(X),LTO)), NLAG); NLAG=[]),
%%%%%%%%%%       %writeln('NLAG'-NLAG),
%%%%%%%%%%    append(LAS,LTO,L1),
%%%%%%%%%%    append(L1,NLAG,NKeyProps_g).
%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%goal_instantiation(+Goal)
goal_instantiation([]):-!.
goal_instantiation(G):-
    nb_getval(staticInfo, SWI),
    get_static_goal(G,SG,SWI),
    mysubset(SG,SWI),!.

%%
get_static_goal([],[],_):-!.

get_static_goal([G|Goal],[G|SG],SWI):-
    G=..[P|_],
    member(X,SWI),
    X=..[P|_],!,
    get_static_goal(Goal,SG,SWI).

get_static_goal([G|Goal],SG,SWI):-
    get_static_goal(Goal,SG,SWI).

%%

%get_goal_entities(+GoalPredicates,-ListOfGoalEntities)
get_goal_entities(Goal,Ents):-
    get_all_goal_entities(Goal,AEnts),
    rm_repeatitions(AEnts,Ents).

get_all_goal_entities([],[]):-!.
get_all_goal_entities([X|T],A):-
    get_goal_entities(T,R),
    X=..[_|Args],
    strict_reunion(Args,R,A).

%get_goal_entities(+GoalPredicates,-ListOfGoalEntities)
%get_goal_entities([],[]).
%get_goal_entities([X|T],[A1,A2|R]):-
%    X=..[_|[A1,A2]],
%    get_goal_entities(T,R).

%%

rm_repeatitions([],[]).
rm_repeatitions([X|T],R):-
    member(X,T),!,
    rm_repeatitions(T,R).
rm_repeatitions([X|T],[X|R]):-
    rm_repeatitions(T,R).

%%

%order_features(+AbsPlan, -OrderedAbsPlan)
order_features([], []).
order_features([ [A,[F1-F2]] |RA], [ [A,[OF1-OF2]] |ORA]):-
    term_to_ord_term(F1,OF1),
    term_to_ord_term(F2,OF2),
    order_features(RA,ORA).

%%
at_start_instantiation(A):-
    nb_getval(initialState, IS),
    (bagof(at_start(X), member(X,IS), LIS); LIS=[]),
        %writeln('LIS'-LIS),
    at_start_instantiation(A,LAS),
        %writeln('LAS'-LAS),
    mysubset(LAS,LIS),!.


at_start_instantiation([],[]).
at_start_instantiation([ [A,[F1-F2]] |RA], LAS):-
    at_start_instantiation(RA,L),
    get_at_start(F1,S1),
    get_at_start2(F2,S2),
        %writeln('S1'-S1),
        %writeln('S2'-S2),
    strict_reunion(S1,S2,L1),
    strict_reunion(L1,L,LAS).

%get_at_start(+OneStepFeature,-AtStarts),
get_at_start(F,LAS):-
    (bagof(at_start(X), (member(at_start(X),F)), LAS); LAS=[]).

%get_at_start2(+TwoStepFeature,-AtStarts),
get_at_start2(F,LAS):-
    (bagof(F1, (member(X,F), X=[F1,_], F1=..[at_start|_]), LAS1); LAS1=[]),
    (bagof(F2, (member(Y,F), Y=[_,F2], F2=..[at_start|_]), LAS2); LAS2=[]),
    strict_reunion(LAS1,LAS2,LAS).
