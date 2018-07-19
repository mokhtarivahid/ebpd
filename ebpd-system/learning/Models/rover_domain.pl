
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ROVER - A collection of rovers with different sets of equipment navigate a 
%% planet surface. The goal is to have performed a number of science gathering 
%% operations - soil/rock sample analyses, and taking pictures of different 
%% objectives - and to have communicated the results of these back to a lander.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    navigate(Rover, Waypoint1, Waypoint2), 

    %IL
    [],

    %KL
    [ can_traverse(Rover, Waypoint1, Waypoint2),
      visible(Waypoint1, Waypoint2),
      available(Rover) ],

    %DL
    [ at(Rover, Waypoint1) ],

    %AL
    [ at(Rover, Waypoint2) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    sample_soil(Rover, Store, Waypoint), 

    %IL
    [],

    %KL
    [ equipped_for_soil_analysis(Rover),
      store_of(Store, Rover),
      at(Rover, Waypoint) ],

    %DL
    [ at_soil_sample(Waypoint), 
      empty(Store) ],

    %AL
    [ full(Store), 
      have_soil_analysis(Rover, Waypoint) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    sample_rock(Rover, Store, Waypoint), 

    %IL
    [],

    %KL
    [ equipped_for_rock_analysis(Rover),
      store_of(Store, Rover),
      at(Rover, Waypoint) ],

    %DL
    [ at_rock_sample(Waypoint), 
      empty(Store) ],

    %AL
    [ full(Store), 
      have_rock_analysis(Rover, Waypoint) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    drop(Rover, Store), 

    %IL
    [],

    %KL
    [ store_of(Store, Rover) ],

    %DL
    [ full(Store) ],

    %AL
    [ empty(Store) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    calibrate(Rover, Camera, Objective, Waypoint), 

    %IL
    [],

    %KL
    [ equipped_for_imaging(Rover), 
      calibration_target(Camera, Objective), 
      visible_from(Objective, Waypoint), 
      on_board(Camera, Rover),
      at(Rover, Waypoint) ],

    %DL
    [],

    %AL
    [ calibrated(Camera, Objective) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    take_image(Rover, Waypoint, Objective, Camera, Mode), 

    %IL
    [],

    %KL
    [ equipped_for_imaging(Rover), 
      supports(Camera, Mode),
      visible_from(Objective, Waypoint), 
      on_board(Camera, Rover),
      at(Rover, Waypoint) ],

    %DL
    [ calibrated(Camera, Objective) ],

    %AL
    [ have_image(Rover, Objective, Mode) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    communicate_soil_data(Rover, Lander, Waypoint1, Waypoint2, Waypoint3), 

    %IL
    [],

    %KL
    [ at_lander(Lander, Waypoint3),
      visible(Waypoint2, Waypoint3),
      at(Rover, Waypoint2),
      have_soil_analysis(Rover, Waypoint1),
      available(Rover),
      channel_free(Lander) ],

    %DL
    [],

    %AL
    [ communicated_soil_data(Waypoint1) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    communicate_rock_data(Rover, Lander, Waypoint1, Waypoint2, Waypoint3), 

    %IL
    [],

    %KL
    [ at_lander(Lander, Waypoint3),
      visible(Waypoint2, Waypoint3),
      at(Rover, Waypoint2),
      have_rock_analysis(Rover, Waypoint1),
      available(Rover),
      channel_free(Lander) ],

    %DL
    [],

    %AL
    [ communicated_rock_data(Waypoint1) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    communicate_image_data(Rover, Lander, Objective, Mode, Waypoint1, Waypoint2), 

    %IL
    [],

    %KL
    [ at_lander(Lander, Waypoint2),
      visible(Waypoint1, Waypoint2),
      at(Rover, Waypoint1),
      have_image(Rover, Objective, Mode),
      available(Rover),
      channel_free(Lander) ],

    %DL
    [],

    %AL
    [ communicated_image_data(Objective, Mode) ]
).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RACE abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(navigate(_, _, _), []) :- !.
abstract_operator_application(drop(_, _), []) :- !.
%abstract_operator_application(calibrate(_, _, _, _), []) :- !.

%abstract_operator_application(navigate(_, W1, W2), [navigate(W1, W2)]) :- !.
abstract_operator_application(calibrate(_, _, O, W), [calibrate(O, W)]) :- !.

%% main classes
%% abstract_operator_application(sample_soil(_, S, P), [sample(S, P)]) :- !.
%% abstract_operator_application(sample_rock(_, S, P), [sample(S, P)]) :- !.
abstract_operator_application(take_image(_, W, O, _, M), [take(W, O, M)]) :- !.
%% abstract_operator_application(communicate_soil_data(_, _, W1, W2, W3), [communicate(W1, W2, W3)]) :- !.
%% abstract_operator_application(communicate_rock_data(_, _, W1, W2, W3), [communicate(W1, W2, W3)]) :- !.
abstract_operator_application(communicate_image_data(_, _, O, _, W1, W2), [communicate(O, W1, W2)]) :- !.

%% main classes
abstract_operator_application(sample_soil(_, _, W), [sample(W)]) :- !.
abstract_operator_application(sample_rock(_, _, W), [sample(W)]) :- !.
%abstract_operator_application(take_image(_, _, O, _, _), [take(O)]) :- !.
abstract_operator_application(communicate_soil_data(_, _, W, _, _), [communicate(W)]) :- !.
abstract_operator_application(communicate_rock_data(_, _, W, _, _), [communicate(W)]) :- !.
%abstract_operator_application(communicate_image_data(_, _, O, _, _, _), [communicate(O)]) :- !.

abstract_operator_application(Op,[Op]).

