
% Estimated distance to achive Goal.
%h_sbp(+AbstractPlan, -Heuiristic)
h_sbp(AbstractPlan, H):- nb_getval(alpha,A), length(AbstractPlan,L), H is L*A, !.
h_sbp(AbstractPlan, H):- length(AbstractPlan,L), H is L*2.0.

%lsl:
%% Cost = ((N+1)/(V+1)) x Creal
%% N: all features, V: verified features
%cost(+NumberOfFeaturesAbsOp,+NumberOfFeaturesApplicapleOp,-Cost):-
cost(N,V,C):-
    C is ((N+1)/(V+1)).

%% this cost is for applicable actions belonging to the current
%% abstract operator (partially instanciated) but with different 
%% arguments.
penalty_cost(10).
