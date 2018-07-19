
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The Zeno-Travel Domain
%%
%% This domain has actions to embark and disembark passengers onto aircraft 
%% that can fly at two alternative speeds between locations. The STRIPS 
%% variant is rather uninteresting because the two speeds do not offer 
%% meaningful alternatives.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    board(P, A, C), 

    %IL
    [],

    %KL
    [ at(A,C) ],

    %DL
    [ in(P,C) ],

    %AL
    [ onboard(P,A) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    debark(P, A, C), 

    %IL
    [],

    %KL
    [ at(A,C) ],

    %DL
    [ onboard(P,A) ],

    %AL
    [ in(P,C) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    fly(A, C1, C2, L1, L2), 

    %IL
    [],

    %KL
    [ next(L2,L1) ],

    %DL
    [ at(A,C1), fuel_level(A,L1) ],

    %AL
    [ at(A,C2), fuel_level(A,L2) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    zoom(A, C1, C2, L1, L2, L3), 

    %IL
    [],

    %KL
    [ next(L2,L1), next(L3,L2) ],

    %DL
    [ at(A,C1), fuel_level(A,L1) ],

    %AL
    [ at(A,C2), fuel_level(A,L3) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    refuel(A, C, L1, L2), 

    %IL
    [],

    %KL
    [ next(L1,L2), at(A,C) ],

    %DL
    [ fuel_level(A,L1) ],

    %AL
    [ fuel_level(A,L2) ]
).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(refuel(_, _, _, _), []) :- !.

%% main classes
abstract_operator_application(board(P, A, C), [board(P, A, C)]) :- !.
abstract_operator_application(debark(P, A, C), [debark(P, A, C)]) :- !.
abstract_operator_application(fly(A, C1, C2, _, _), [fly(A, C1, C2)]) :- !.
abstract_operator_application(zoom(A, C1, C2, _, _, _), [zoom(A, C1, C2)]) :- !.

abstract_operator_application(Op,[Op]).

