
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is a plain STRIPS formulation of the standard Logistics domain.
%%
%% In this domain, there are six different types of objects: "object"
%% (the packages to be transported), "truck", "airplane" and their
%% common supertype "vehicle", "location" and the subtype "airport",
%% and finally "city". Types are defined by static (in the sense that
%% there are no operators that change their truth value) unary predicates.
%% The types of objects in a problem instance must be defined by including
%% the appropriate typing predicates in the initial state.
%%
%% A binary static predicate called "loc" describes the topology of the
%% problem instance: "(loc ?l ?c)" is true iff the location ?l is in city
%% ?c.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    load(O, V, L), 

    %IL
    [],

    %KL
    [ object(O),vehicle(V),location(L),at(V,L) ],

    %DL
    [ at(O,L) ],

    %AL
    [ in(O,V) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    unload(O, V, L), 

    %IL
    [],

    %KL
    [ object(O),vehicle(V),location(L),at(V,L) ],

    %DL
    [ in(O,V) ],

    %AL
    [ at(O,L) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    drive(T, L1, L2, C), 

    %IL
    [],

    %KL
    [ truck(T), location(L1), location(L2), city(C), loc(L1, C), loc(L2, C) ],

    %DL
    [ at(T,L1) ],

    %AL
    [ at(T,L2) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    fly(P, A1, A2), 

    %IL
    [],

    %KL
    [ airplane(P), airport(A1), airport(A2) ],

    %DL
    [ at(P,A1) ],

    %AL
    [ at(P,A2) ]
).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
%% abstract_operator_application(drive(_, _, _, _), []) :- !.
%% abstract_operator_application(fly(_, _, _), []) :- !.

%% nil class
abstract_operator_application(drive(T, L1, L2, C), [drive(T, L1, L2, C)]) :- !.
abstract_operator_application(fly(P, A1, A2), [fly(P, A1, A2)]) :- !.

%% main classes
abstract_operator_application(load(O, V, L), [load(O, V, L)]) :- !.
%% abstract_operator_application(load(_, _, _), []) :- !.
abstract_operator_application(unload(O, V, L), [unload(O, V, L)]) :- !.

abstract_operator_application(Op,[Op]).

