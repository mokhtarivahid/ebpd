
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is a plain STRIPS formulation of the standard Satellite domain.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    turn_to(S, N, O), 

    %IL
    [],

    %KL
    [ satellite(S), direction(N), direction(O) ],

    %DL
    [ pointing(S,O) ],

    %AL
    [ pointing(S,N) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    switch_on(I, S), 

    %IL
    [],

    %KL
    [ satellite(S), instrument(I), on_board(I, S) ],

    %DL
    [ power_avail(S), calibrated(I) ],

    %AL
    [ power_on(I) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    switch_off(I, S), 

    %IL
    [],

    %KL
    [ satellite(S), instrument(I), on_board(I, S) ],

    %DL
    [ power_on(I) ],

    %AL
    [ power_avail(S) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    calibrate(S, I, D), 

    %IL
    [],

    %KL
    [ satellite(S), instrument(I), direction(D), on_board(I, S), calibration_target(I, D), pointing(S, D), power_on(I) ],

    %DL
    [ ],

    %AL
    [ calibrated(I) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    take_image(S, D, I, M), 

    %IL
    [],

    %KL
    [ satellite(S), instrument(I), direction(D), mode(M), on_board(I, S), calibrated(I), supports(I, M), pointing(S, D), power_on(I) ],

    %DL
    [ ],

    %AL
    [ have_image(D, M) ]
).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
%% abstract_operator_application(turn_to(_, _, _), []) :- !.
abstract_operator_application(turn_to(S, N, O), [turn_to(S, N, O)]) :- !.

%% main classes
abstract_operator_application(switch_on(I, S), [switch_on(I, S)]) :- !.
abstract_operator_application(switch_off(I, S), [switch_off(I, S)]) :- !.
abstract_operator_application(calibrate(S, I, D), [calibrate(S, I, D)]) :- !.
abstract_operator_application(take_image(S, D, I, M), [take_image(S, D, I, M)]) :- !.

abstract_operator_application(Op,[Op]).

