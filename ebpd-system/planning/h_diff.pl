
%h(State, EstimatedValue)
% Estimated distance to achive Goal.
%% haming heuristic (distance)
h(S, H):-
		nb_getval(goalState, G),
		ord_subtract(G, S, I),
		length(I, H).
