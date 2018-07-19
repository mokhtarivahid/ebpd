
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BIN - A robot removes all objects from a table and drops them in a bin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move(ROBOT, FROM, TO), 

    %IL
    [],

    %KL
    [ reach(ROBOT, TO) ],

    %DL
    [ at(ROBOT, FROM) ],

    %AL
    [ at(ROBOT, TO) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    grip(ROBOT, OPOS, NPOS), 

    %IL
    [],

    %KL
    [ posture(NPOS) ],

    %DL
    [ gripper(ROBOT, OPOS) ],

    %AL
    [ gripper(ROBOT, NPOS) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    pick(ROBOT, OBJ, TABLE), 

    %IL
    [],

    %KL
    [ table(TABLE),
      at(ROBOT, TABLE) ],

    %DL
    [ gripper(ROBOT, open),
      on(OBJ, TABLE) ],

    %AL
    [ holding(OBJ),
      gripper(ROBOT, carry) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    drop(ROBOT, OBJ, BIN), 

    %IL
    [],

    %KL
    [ bin(BIN),
      at(ROBOT, BIN) ],

    %DL
    [ gripper(ROBOT, carry),
      holding(OBJ) ],

    %AL
    [ in(OBJ, BIN),
      gripper(ROBOT, open) ]
).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(move(_, _, _), []) :- !.
abstract_operator_application(grip(_, _, _), []) :- !.

%% main classes
abstract_operator_application(pick(_, O, T), [pick(O, T)]) :- !.
abstract_operator_application(drop(_, O, B), [drop(O, B)]) :- !.

abstract_operator_application(Op,[Op]).

