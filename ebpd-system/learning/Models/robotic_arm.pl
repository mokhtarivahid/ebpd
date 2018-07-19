
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The robotic_arm domain has been designed to to demonstrate the system 
%% in a very simple task on a real robotic arm platform. 
%% The goal in this domain is to move all objects on a table to a tray. 
%% It includes four actions 'move', 'pick' and 'place'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move(ARM, FROM, TO), 

    %IL
    [],

    %KL
    [],

    %DL
    [ at(ARM, FROM) ],

    %AL
    [ at(ARM, TO) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    pick(ARM, OBJ, TABLE), 

    %IL
    [],

    %KL
    [ arm(ARM),
      bottle(OBJ),
      table(TABLE),
      at(ARM, TABLE) ],

    %DL
    [ free(ARM),
      on(OBJ, TABLE) ],

    %AL
    [ carry(OBJ, ARM) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    place(ARM, OBJ, TRAY), 

    %IL
    [],

    %KL
    [ arm(ARM),
      bottle(OBJ),
      tray(TRAY),
      at(ARM, TRAY) ],

    %DL
    [ carry(OBJ, ARM) ],

    %AL
    [ free(ARM),
      in(OBJ, TRAY) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(move(_, _, _), []) :- !.

%% main classes
abstract_operator_application(pick(A, O, T), [pick(A, O, T)]) :- !.
abstract_operator_application(place(A, O, T), [place(A, O, T)]) :- !.

abstract_operator_application(Op,[Op]).

