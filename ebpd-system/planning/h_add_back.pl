%% this is the backward implementation of additive heuristic function.
%% it is also similar to FF heuristic.
%% the intuition is to avoid overcounting.

%h(State, EstimatedValue)
% Estimated distance to achive Goal.
%:-use_module(library(sets)).

h(S, E):-
        nb_getval(goalState, G),
        ansi_format([fg(yellow)], '~n(State: ~w)~n(Goal: ~w)', [S,G]),
        relax(G, S, E),
        ansi_format([fg(green)], '~n(Estimated: ~d)~n', [E]).

relax(G, S, 0):-
    ord_subset(S, G), !.

relax(G, S, E):-
        setof(P, relax_step(G, P), RS),
        ord_union([G|RS], NS),
        %% ord_union(RS, NS),
        %ansi_format([fg(yellow)], '~n(States: ~w)~n', [NS]),
        relax(NS, S, NE),
        E is 1+NE.

%% relax(G, S, 0):-
%%     ord_subtract(S, G, []), !.
%% 
%% relax(G, S, E):-
%%     ord_subtract(S, G, Delta),
%%         ansi_format([fg(yellow)], '~n(Delta: ~w)~n', [Delta]),
%%         %% nl,write(Delta),nl,
%%         setof(P, relax_step(G, P), RS),
%%         %% ord_union([G|RS], NS),
%%         ord_union(RS, NS),
%%         %% nl,write(NS),nl,
%%     relax(NS, Delta, NE),
%%         length(Delta, LD),
%%         E is LD+NE.

%% relax(_, [], 0):-!.
%% relax(G, S, E):-
%%     ord_subtract(S, G, Delta),
%%         ansi_format([fg(yellow)], '~n(Delta: ~w)~n', [Delta]),
%%         %% nl,write(Delta),nl,
%%         setof(P, relax_step(G, P), RS),
%%         ord_union([G|RS], NS),
%%         %% ord_union(RS, NS),
%%         %% nl,write(NS),nl,
%%     relax(NS, Delta, NE),
%%         length(Delta, LD),
%%         E is LD+NE.

relax_step(State, P):-
        get_action(A),
        get_static(SWI),
        get_precondition_static(A, SI),
        mysubset(SI, SWI),
        get_positive_effect(A, PE),
        mysubset(PE, State),
        get_precondition(A, P).
        %get_action_def(A,F),
        %nl,write(F-P).

