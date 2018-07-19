%h(State, EstimatedValue)
% Estimated distance to achive Goal.
h(S, E):-
		relax(S, E).

relax(S, 0):-
		nb_getval(goalState, G),
		ord_subset(G, S), !.
relax(S, ND):-
		setof(P, relax_step(S, P), RS),
		ord_union([S|RS], NS),
		relax(NS, D),
		ND is D+1.

relax_step(State, PE):-
		get_action(A),	
        get_static(SWI),
        get_precondition_static(A, SI),
        mysubset(SI, SWI),
		get_precondition(A, P),
		mysubset(P, State),
		get_positive_effect(A, PE).
