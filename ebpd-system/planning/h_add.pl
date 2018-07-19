%h(State, EstimatedValue)
% Estimated distance to achive Goal.
%:-use_module(library(sets)).

h(S, E):-
        nb_getval(goalState, G),
        relax(S, G, E).
        %ansi_format([fg(green)], '~n(Estimated: ~d)~n', [E]).

relax(S, G, 0):-
    ord_subtract(G, S, []), !.
relax(S, G, E):-
    ord_subtract(G, S, Delta),
        %ansi_format([fg(red)], '~n(Delta: ~w)~n', [Delta]),
        setof(P, relax_step(S, P), RS),
        ord_union([S|RS], NS),
    relax(NS, Delta, NE),
        length(Delta, LD),
        E is LD+NE.

%% relax(_, [], 0):-!.
%% relax(S, G, E):-
%%     ord_subtract(G, S, Delta),
%%         ansi_format([fg(red)], '~n(Delta: ~w)~n', [Delta]),
%%         setof(P, relax_step(S, P), RS),
%%         ord_union([S|RS], NS),
%%     relax(NS, Delta, NE),
%%         length(Delta, LD),
%%         E is LD+NE.

relax_step(State, PE):-
        get_action(A),
        get_static(SWI),
        get_precondition_static(A, SI),
        mysubset(SI, SWI),
        get_precondition(A, P),
        mysubset(P, State),
        get_positive_effect(A, PE).
        %get_action_def(A,F),
        %nl,write(F).

%%relax(_, [], 0):-!.
%%relax(S, G, E):-
%%    ord_subtract(G, S, Delta),
%%        %setof(P, relax_step(S, P), RS),
%%        findall(P, relax_step(S, P), _RS),
%%        list_to_ord_set(_RS,RS),
%%        ord_union([S|RS], NS),
%%    relax(NS, Delta, NE),
%%        length(Delta, LD),
%%        E is LD+NE.
%%
%%relax_step(State, PE):-
%%        get_action(A),
%%        get_static(SWI),
%%        get_precondition_static(A, SI),
%%        mysubset(SI, SWI),
%%        get_precondition(A, P),
%%        mysubset(P, State),
%%        get_positive_effect(A, PE),
%%        % nl,write(PE),nl,write(State),nl,
%%        \+ mysubset(PE, State).

%%relax_step(State, PE):-
%%      get_action(A),  get_precondition(A, P),
%%      mysubset(P, State),
%%      get_positiv_effect(A, PE).

