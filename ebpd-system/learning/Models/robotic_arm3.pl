
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ROBOTIC_ARM - A robotic arm that can moves to between a table and a tray 
%% is taught to clear the table by removing all objects from the table and 
%% putting them on the tray.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    activate(ARM, OLD_ARM_STATE, NEW_ARM_STATE), 

    %IL
    [],

    %KL
    [ arm_capabilities(ARM, NEW_ARM_STATE) ],

    %DL
    [ arm_active(ARM, OLD_ARM_STATE) ],

    %AL
    [ arm_active(ARM, NEW_ARM_STATE) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    update_vision(ARM, TABLE), 

    %IL
    [],

    %KL
    [ arm_at(ARM, TABLE) ],

    %DL
    [],

    %AL
    [ vision_updated(ARM, TABLE) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    pick_up_object(ARM, OBJ, TABLE), 

    %IL
    [],

    %KL
    [ arm_at(ARM, TABLE),
      arm_active(ARM, grip) ],

    %DL
    [ arm_free(ARM),
      on(OBJ, TABLE),
      pose_detected(ARM, OBJ, TABLE) ],

    %AL
    [ arm_holding(ARM, OBJ) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    place_object(ARM, OBJ, TABLE), 

    %IL
    [],

    %KL
    [ arm_at(ARM, TABLE),
      arm_active(ARM, grip) ],

    %DL
    [ arm_holding(ARM, OBJ),
      pose_detected(ARM, OBJ, TABLE) ],

    %AL
    [ arm_free(ARM),
      on(OBJ, TABLE) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move_arm(ARM, FROM, TO), 

    %IL
    [],

    %KL
    [ arm_canreach(ARM, TO) ],

    %DL
    [ arm_at(ARM, FROM) ],

    %AL
    [ arm_at(ARM, TO) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(activate(_, _, _), []) :- !.
abstract_operator_application(update_vision(_, _), []) :- !.
abstract_operator_application(move_arm(_, _, _), []) :- !.

%% main classes
abstract_operator_application(pick_up_object(_, O, T), [pick(O, T)]) :- !.
abstract_operator_application(place_object(_, O, T), [place(O, T)]) :- !.

abstract_operator_application(Op,[Op]).

