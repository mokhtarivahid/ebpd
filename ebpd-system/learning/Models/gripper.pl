
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BIN - A robot removes all objects from a table and drops them in a bin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move(FROM, TO), 

    %IL
    [],

    %KL
    [ room(FROM), room(TO) ],

    %DL
    [ at_robby(FROM) ],

    %AL
    [ at_robby(TO) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    pick(OBJ, ROOM, GRIPPER), 

    %IL
    [],

    %KL
    [ ball(OBJ), room(ROOM), gripper(GRIPPER) ],

    %DL
    [ free(GRIPPER), at(OBJ, ROOM) ],

    %AL
    [ carry(OBJ, GRIPPER) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    drop(OBJ, ROOM, GRIPPER), 

    %IL
    [],

    %KL
    [ ball(OBJ), room(ROOM), gripper(GRIPPER) ],

    %DL
    [ carry(OBJ, GRIPPER) ],

    %AL
    [ free(GRIPPER), at(OBJ, ROOM) ]
).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(move(_, _), []) :- !.

%% main classes
abstract_operator_application(pick(O, R, G), [pick(O, R, G)]) :- !.
abstract_operator_application(drop(O, R, G), [drop(O, R, G)]) :- !.

abstract_operator_application(Op,[Op]).

