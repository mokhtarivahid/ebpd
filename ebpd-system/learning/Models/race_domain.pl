
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RACE - primitive HTN operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% new operator:
% Not relevant for task planning (mainly relevant for human-robot interaction):

% operator_functionality(
%   point_to_object(Arm, Obj),
%
%   %IL
%   [],
%
%   %KL
%   [ instance(arm, Arm),
%     new_constant(New_Posture, armpointingposture) ],
%
%   %DL
%   [ hasarmposture(Arm, OldP),
%     instance(OldPType, OldP) ],
%
%   %AL
%   [ instance(armpointingposture, New_Posture),
%     hasarmposture(Arm, New_Posture) ]
%).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Operators for lifting:
%% This for some research in Osnabruck -- not imediately relevant 
%% It seems they they should also need "unlifting" ...

%operator_functionality(
%    create_lifted_mug(Lifted_Name, Area, New_On),
%
%   %IL
%   [],
%
%   %KL
%   [ not(instance(mug, Lifted_Name)),
%     new_constant(New_On, on) ],
%
%   %DL
%   [],
%
%   %AL
%   [ instance(mug, Lifted_Name),
%     lifted(Lifted_Name),
%     instance(on, New_On),
%     hasphysicalentity(New_On, Lifted_Name),
%     hasarea(New_On, Area) ]
%).



%operator_functionality(
%   lift_mug(Mug, Lifted_Name),
%
%   %IL
%   [],
%
%   %KL
%   [],
%
%   %DL
%   [ instance(mug, Mug) ],
%
%   %AL
%   [ isliftedas(Mug, Lifted_Name) ]
%).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operators for arm movement:

operator_functionality(
    tuck_arms(LArm, RArm, LPT, RPT, LP, RP, NLPT, NRPT, NLP, NRP), 

    %IL
    [],

    %KL
    [ % Not yet supported:
      % member(NLPT, [armtuckedposture,armuntuckedposture]),
      % member(NRPT, [armtuckedposture,armuntuckedposture]),

      instance(arm, LArm),
      instance(arm, RArm),
      instance(LPT, LP),
      instance(RPT, RP),
      hasarmposture(LArm, LP),
      hasarmposture(RArm, RP)
      %(or (not (= ?lpt ?glpt)) (not (= ?rpt ?grpt))))  %% not supported yet
      ],

    %DL
    [ hasarmposture(LArm, LP),
      hasarmposture(RArm, RP),
      instance(LPT, LP),
      instance(RPT, RP) ],

    %AL
    [ %get_new_constant(NLPT, NLP),   %% not supported yet
      %get_new_constant(NRPT, NRP),   %% not supported yet
      instance(NLPT, NLP),
      instance(NRPT, NRP),
      hasarmposture(LArm, NLP),
      hasarmposture(RArm, NRP) ]
).

operator_functionality(
    move_arms_to_carryposture(LArm, RArm, LPT, RPT, LP, RP, NLP, NRP),

    %IL
    [],

    %KL
    [ instance(arm, LArm),
      instance(arm, RArm) ],

    %DL
    [ hasarmposture(LArm, LP),
      instance(LPT, LP),
      hasarmposture(RArm, RP),
      instance(RPT, RP) ],

    %AL
    [ %get_new_constant(armcarryposture, NLP),
      %get_new_constant(armcarryposture, NRP),
      instance(armcarryposture, NLP),
      instance(armcarryposture, NRP),
      hasarmposture(LArm, NLP),
      hasarmposture(RArm, NRP) ]
).

% this does not work if both arms are tucked in that case the corresponding 
% method has to be used, which first untucks the arms.
operator_functionality(
    move_arm_to_side(Arm, PT, P, NP),
    % OldLeft, OldRight will be added after involving conjunction operator

    %IL
    [],

    %KL
    [ instance(arm, Arm) ],

    %DL
    [ hasarmposture(Arm, P),
      instance(PT, P) ],

    %AL
    [ %get_new_constant(armtosideposture, NP),
      instance(armtosideposture, NP),
      hasarmposture(Arm, NP) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operators for pick up and place objects:

operator_functionality(
    %pick_up_object(Obj, Arm, On, At, MA, PA, G, GH, TP, OP, GP),
    pick_up_object(Obj, Arm, MA, PA, G, GP, NGP, TP, AP),

    %IL
    [],

    %KL
    [ 
      instance(manipulationarea, MA),
      instance(placingarea, PA),
      hasmanipulationarea(PA, MA),
      instance(arm, Arm),
      hasgripper(Arm, G),
 
      robotat(trixi1, MA),
      hasarmposture(Arm, AP),
      instance(armtosideposture, AP),
      instance(torsoupposture, TP) 
      %(not (= GPT gripperholdingposture)) 
    ],

    %DL
    [ on(Obj, PA),
      hasgripperposture(G, GP),
      instance(GPT, GP) ],

    %AL
    [ %get_new_constant(gripperholdingposture, NGP),
      instance(gripperholdingposture, NGP),
      hasgripperposture(G, NGP),
      holding(G, Obj) ]
).

operator_functionality(
    %place_object(Obj, Arm, At, MA, GOn, PA, G, H, TP, OAP, GAP),
    place_object(Obj, Arm, MA, PA, G, GP, NGP, TP, AP),

    %IL
    [],

    %KL
    [ instance(manipulationarea, MA),
      instance(placingarea, PA),
      hasmanipulationarea(PA, MA),
      instance(arm, Arm),
      hasgripper(Arm, G),

      robotat(trixi1, MA),
      holding(G, Obj),
      hasarmposture(Arm, AP),
      instance(armtosideposture, AP),
      instance(torsoupposture, TP), 
      hasgripperposture(G, GP),
      instance(GPT, GP)
      %(= GPT gripperholdingposture)
      ],

    %DL
    [ holding(G, Obj),
      hasgripperposture(G, GP),
      instance(GPT, GP) ],

    %AL
    [ %get_new_constant(gripperopenedposture, NGP),
      instance(gripperopenedposture, NGP),
      hasgripperposture(G, NGP),
      on(Obj, PA) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operators for move:

%%%% NOTE: move_base and move_base_blind should have different pre-conditions!

operator_functionality(
    move_base(From, To),

    %IL
    [],

    %KL
    [],

    %DL
    [ robotat(trixi1, From) ],

    %AL
    [ robotat(trixi1, To) ]
).


% the following are two special cases of move_base_blind,
% which are not defined in the HTN domain

operator_functionality(
    move_base_blind_to_ma(From, To),

    %IL
    [],

    %KL
    [],

    %DL
    [ robotat(trixi1, From) ],

    %AL
    [ robotat(trixi1, To) ]
).

operator_functionality(
    move_base_blind_to_pma(From, To),

    %IL
    [],

    %KL
    [],

    %DL
    [ robotat(trixi1, From) ],

    %AL
    [ robotat(trixi1, To) ]
).


operator_functionality(
    move_torso(Torso, PT, P, NPT, NP),

    %IL
    [],

    %KL
    [ instance(torso, Torso) ],

    %DL
    [ hastorsoposture(Torso, P),
      instance(PT, P) ],

    %AL
    [ %get_new_constant(NPT, NP),
      instance(NPT, NP),
      hastorsoposture(Torso, NP) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operators for perception:

operator_functionality(
    observe_objects_on_area(PA, MA),

    %IL
    [],

    %KL
    [ instance(manipulationarea, MA),
      instance(placingarea, PA),
      hasmanipulationarea(PA, MA),
      robotat(trixi1, MA)
      %on(Obj, PA) 
    ],

    %DL
    [],

    %AL
    []
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operator for wait:

operator_functionality(
    wait_until_unblocked(Area, AT, OBS),

    %IL
    [],

    %KL
    [],

    %DL
    [ instance(at, AT),
      hasarea(AT, Area),
      hasphysicalentity(AT, OBS) ],

    %AL
    []
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RACE abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(tuck_arms(_, _, _, _, _, _, _, _, _, _), []) :- !.
abstract_operator_application(move_arms_to_carryposture(_, _, _, _, _, _, _, _),[]) :- !.
abstract_operator_application(move_arm_to_side(_, _, _, _),[]) :- !.
abstract_operator_application(move_torso(_, _, _, _, _),[]) :- !.
abstract_operator_application(observe_objects_on_area(PA, _),[]) :- !.

%% move class
abstract_operator_application(move_base(From, To), [move(From,To)]) :- !.
abstract_operator_application(move_base_blind(From, To), [move(From,To)]) :- !.
abstract_operator_application(move_base_blind_to_ma(From, To), [move(From,To)]) :- !.
abstract_operator_application(move_base_blind_to_pma(From, To), [move(From,To)]) :- !.

%% pick_up class
abstract_operator_application(pick_up_object(Obj, _, _, PA, _, _, _, _, _),[pick_up(Obj,PA)]) :- !.

%% place class
abstract_operator_application(place_object(Obj, _, _, PA, _, _, _, _, _),[place(Obj,PA)]) :- !.

% remaining operators are not abstracted, at least for now:
%    wait_until_unblocked(Area, AT, OBS),

abstract_operator_application(Op,[Op]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RACE abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% RACE: we need to define the pre-/post-conditions of RACE abstract operators
%%% predicate: abstract_operator/5 (see "operators_mth.pl" 
%%% to see how it was done in the assembly domain)


