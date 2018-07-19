
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GRIPPER - A robotic arm that can moves to between two tables
%% is taught to move all objects on table1 to table2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    detect_pose_object(ROBOT, OBJ, TABLE), 

    %IL
    [],

    %KL
    [ at(ROBOT, TABLE),
      on(OBJ, TABLE) ],

    %DL
    [],

    %AL
    [ pose_detected(OBJ, TABLE) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    pick_up_object(ROBOT, OBJ, TABLE, GRIPPER), 

    %IL
    [],

    %KL
    [ at(ROBOT, TABLE) ],

    %DL
    [ free(ROBOT, GRIPPER),
      on(OBJ, TABLE),
      pose_detected(OBJ, TABLE) ],

    %AL
    [ holding(ROBOT, OBJ, GRIPPER) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    drop_object(ROBOT, OBJ, TABLE, GRIPPER), 

    %IL
    [],

    %KL
    [ at(ROBOT, TABLE) ],

    %DL
    [ holding(ROBOT, OBJ, GRIPPER) ],

    %AL
    [ free(ROBOT, GRIPPER),
      on(OBJ, TABLE) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move_robot(ROBOT, FROM, TO), 

    %IL
    [],

    %KL
    [],

    %DL
    [ at(ROBOT, FROM) ],

    %AL
    [ at(ROBOT, TO) ]
).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(detect_pose_object(_, _, _), []) :- !.
abstract_operator_application(move_robot(_, _, _), []) :- !.

%% main classes
abstract_operator_application(pick_up_object(_, O, T, _), [pick(O, T)]) :- !.
abstract_operator_application(drop_object(_, O, T, _), [drop(O, T)]) :- !.

abstract_operator_application(Op,[Op]).

