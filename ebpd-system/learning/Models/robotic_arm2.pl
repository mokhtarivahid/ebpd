
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
    detect_pose_pick_up(ARM, OBJ, TABLE), 

    %IL
    [],

    %KL
    [ arm_at(ARM, TABLE),
      arm_active(ARM, grip),
      arm_free(ARM),
      on(OBJ, TABLE) ],

    %DL
    [],

    %AL
    [ pose_detected(ARM, OBJ, TABLE) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    detect_pose_place(ARM, OBJ, TABLE), 

    %IL
    [],

    %KL
    [ arm_at(ARM, TABLE),
      arm_active(ARM, grip),
      arm_holding(ARM, OBJ) ],

    %DL
    [],

    %AL
    [ pose_detected(ARM, OBJ, TABLE) ]
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
    [ arm_canreach(ARM, TO),
      arm_free(ARM) ],

    %DL
    [ arm_at(ARM, FROM) ],

    %AL
    [ arm_at(ARM, TO) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    carry_object(ARM, OBJ, FROM, TO), 

    %IL
    [],

    %KL
    [ arm_canreach(ARM, TO),
      arm_holding(ARM, OBJ) ],

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
abstract_operator_application(detect_pose_pick_up(_, _, _), []) :- !.
abstract_operator_application(detect_pose_place(_, _, _), []) :- !.
abstract_operator_application(move_arm(_, _, _), []) :- !.
abstract_operator_application(carry_object(_, _, _, _), []) :- !.

%% main classes
abstract_operator_application(pick_up_object(_, O, T), [pick(O, T)]) :- !.
abstract_operator_application(place_object(_, O, T), [place(O, T)]) :- !.
%abstract_operator_application(pick_up_object(_, O, _), [pick(O)]) :- !.
%abstract_operator_application(place_object(_, O, _), [place(O)]) :- !.
%abstract_operator_application(move_arm(_, _, T), [move(T)]) :- !.
%abstract_operator_application(carry_object(_, O, _, T), [carry(O, T)]) :- !.

abstract_operator_application(Op,[Op]).

