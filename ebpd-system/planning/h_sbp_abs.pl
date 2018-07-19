
% Estimated distance to achive Goal.
%h(+AbstractPlan, -Heuiristic)
h(_, H):- H is 0.

%lsl:
%% Cost = ((N+1)/(V+1)) x Creal
%% N: all features, V: verified features
%cost(+NumberOfFeaturesAbsOp,+NumberOfFeaturesApplicapleOp,-Cost):-
cost(N,V,C):-
    C is ((N+1)/(V+1)).

%% this cost is for applicable actions belonging to the current
%% abstract operator (partially instanciated) but with different 
%% arguments.
cost(10).
