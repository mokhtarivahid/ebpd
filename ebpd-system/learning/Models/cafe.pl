
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    tuck_arm(ROBOT, ARM, PMA, AP), 

    %IL
    [],

    %KL
    [ premanipulationarea(PMA),
      robotat(ROBOT, PMA) ],

    %DL
    [ robotarmposture(ARM, AP) ],

    %AL
    [ robotarmposture(ARM, armtucked) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    untuck_arm(ROBOT, ARM, PMA, AP), 

    %IL
    [],

    %KL
    [ premanipulationarea(PMA),
      robotat(ROBOT, PMA) ],

    %DL
    [ robotarmposture(ARM, AP) ],

    %AL
    [ robotarmposture(ARM, armuntucked) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move_arm_to_side(ROBOT, ARM, PMA, AP), 

    %IL
    [],

    %KL
    [ premanipulationarea(PMA),
      robotat(ROBOT, PMA) ],

    %DL
    [ robotarmposture(ARM, AP) ],

    %AL
    [ robotarmposture(ARM, armtoside) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move_arm_to_carry(ROBOT, ARM, PMA, AP), 

    %IL
    [],

    %KL
    [ premanipulationarea(PMA),
      robotat(ROBOT, PMA),
      armgripperposture(ARM, gripperholding) ],

    %DL
    [ robotarmposture(ARM, AP) ],

    %AL
    [ robotarmposture(ARM, armtoside) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move_torso(ROBOT, PMA, TP, NTP), 

    %IL
    [],

    %KL
    [ premanipulationarea(PMA),
      robotat(ROBOT, PMA),
      torsoposture(NTP) ],

    %DL
    [ robottorsoposture(ROBOT, TP) ],

    %AL
    [ robottorsoposture(ROBOT, NTP) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move_base(ROBOT, FROM, TO), 

    %IL
    [],

    %KL
    [ premanipulationarea(FROM),
      premanipulationarea(TO),
      robottorsoposture(ROBOT, torsodown),
      armgripperposture(arm1, gripperfree),
      robotarmposture(arm1, armtucked) ],

    %DL
    [ robotat(ROBOT, FROM) ],

    %AL
    [ robotat(ROBOT, TO) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move_base(ROBOT, FROM, TO), 

    %IL
    [],

    %KL
    [ premanipulationarea(FROM),
      premanipulationarea(TO),
      robottorsoposture(ROBOT, torsomiddle),
      armgripperposture(arm1, gripperholding),
      robotarmposture(arm1, armtocarry) ],

    %DL
    [ robotat(ROBOT, FROM) ],

    %AL
    [ robotat(ROBOT, TO) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move_blind(ROBOT, FROM, TO), 

    %IL
    [],

    %KL
    [ premanipulationarea(FROM),
      manipulationarea(TO),
      hasmanipulationarea(FROM, TO) ],

    %DL
    [ robotat(ROBOT, FROM) ],

    %AL
    [ robotat(ROBOT, TO) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move_blind(ROBOT, FROM, TO), 

    %IL
    [],

    %KL
    [ manipulationarea(FROM),
      premanipulationarea(TO),
      hasmanipulationarea(TO, FROM) ],

    %DL
    [ robotat(ROBOT, FROM) ],

    %AL
    [ robotat(ROBOT, TO) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    pick_up_from_table(ROBOT, ARM, OBJ, PA, MA), 

    %IL
    [],

    %KL
    [ reachable(MA, PA),
      robotat(ROBOT, MA),
      robotarmposture(ARM, armtoside),
      robottorsoposture(ROBOT, torsoup) ],

    %DL
    [ objectat(OBJ, PA),
      armgripperposture(ARM, gripperfree) ],

    %AL
    [ armholding(ARM, OBJ),
      armgripperposture(ARM, gripperholding) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    place_on_table(ROBOT, ARM, OBJ, PA, MA), 

    %IL
    [],

    %KL
    [ reachable(MA, PA),
      robotat(ROBOT, MA),
      robotarmposture(ARM, armtoside),
      robottorsoposture(ROBOT, torsoup) ],

    %DL
    [ armholding(ARM, OBJ),
      armgripperposture(ARM, gripperholding) ],

    %AL
    [ objectat(OBJ, PA),
      armgripperposture(ARM, gripperfree) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    pick_up_from_tray(ROBOT, ARM, OBJ, PA), 

    %IL
    [],

    %KL
    [ tray(PA),
      robotarmposture(ARM, armtoside),
      robottorsoposture(ROBOT, torsoup) ],

    %DL
    [ objectat(OBJ, PA),
      armgripperposture(ARM, gripperfree) ],

    %AL
    [ armholding(ARM, OBJ),
      armgripperposture(ARM, gripperholding) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    place_on_tray(ROBOT, ARM, OBJ, PA), 

    %IL
    [],

    %KL
    [ tray(PA),
      robotarmposture(ARM, armtoside),
      robottorsoposture(ROBOT, torsoup) ],

    %DL
    [ armholding(ARM, OBJ),
      armgripperposture(ARM, gripperholding) ],

    %AL
    [ objectat(OBJ, PA),
      armgripperposture(ARM, gripperfree) ]
).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(tuck_arm(_, _, _, _), []) :- !.
abstract_operator_application(untuck_arm(_, _, _, _), []) :- !.
abstract_operator_application(move_arm_to_side(_, _, _, _), []) :- !.
abstract_operator_application(move_arm_to_carry(_, _, _, _), []) :- !.
abstract_operator_application(move_torso(_, _, _, _), []) :- !.

%% main classes
abstract_operator_application(move_base(_, FROM, TO), [move(FROM, TO)]) :- !.
abstract_operator_application(move_base(_, FROM, TO), [move(FROM, TO)]) :- !.
abstract_operator_application(move_blind(_, FROM, TO), [move(FROM, TO)]) :- !.
abstract_operator_application(move_blind(_, FROM, TO), [move(FROM, TO)]) :- !.

abstract_operator_application(pick_up_from_table(_, _, OBJ, PA, _), [pick(OBJ, PA)]) :- !.
abstract_operator_application(place_on_table(_, _, OBJ, PA, _), [place(OBJ, PA)]) :- !.
abstract_operator_application(pick_up_from_tray(_, _, OBJ, PA), [pick(OBJ, PA)]) :- !.
abstract_operator_application(place_on_tray(_, _, OBJ, PA), [place(OBJ, PA)]) :- !.

abstract_operator_application(Op,[Op]).

