%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% experience 1: p20
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(robot_activity_experience(
  strips-sat-x-1,    %% episode ID
  satellite,    %% domain
  [
    take_image(satellite0),    %% task
    [        %% key propositions
        at_start(power_avail(satellite0)),
        at_start(pointing(satellite0,groundstation7)),
        throughout(satellite(satellite0)),
        throughout(instrument(instrument0)),
        throughout(supports(instrument0,thermograph3)),
        throughout(supports(instrument0,image1)),
        throughout(supports(instrument0,thermograph2)),
        throughout(calibration_target(instrument0,star12)),
        throughout(calibration_target(instrument0,groundstation0)),
        throughout(on_board(instrument0,satellite0)),
        throughout(mode(thermograph0)),
        throughout(mode(thermograph2)),
        throughout(mode(image1)),
        throughout(mode(thermograph3)),
        throughout(direction(groundstation1)),
        throughout(direction(star2)),
        throughout(direction(groundstation3)),
        throughout(direction(groundstation4)),
        throughout(direction(groundstation5)),
        throughout(direction(star6)),
        throughout(direction(groundstation7)),
        throughout(direction(groundstation8)),
        throughout(direction(groundstation9)),
        throughout(direction(groundstation10)),
        throughout(direction(groundstation11)),
        throughout(direction(groundstation13)),
        throughout(direction(star14)),
        throughout(direction(star15)),
        throughout(direction(star16)),
        throughout(direction(star17)),
        throughout(direction(star18)),
        throughout(direction(groundstation19)),
        throughout(direction(groundstation0)),
        throughout(direction(star12)),
        throughout(direction(star20)),
        at_end(have_image(star15,thermograph2)),
        at_end(have_image(star14,thermograph2)),
        at_end(have_image(star17,thermograph3)),
        at_end(have_image(star16,thermograph3)),
        at_end(have_image(groundstation19,thermograph2)),
        at_end(have_image(star2,thermograph3)),
        at_end(have_image(groundstation13,thermograph3)),
        at_end(have_image(star18,image1)),
        at_end(have_image(groundstation11,thermograph3))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        turn_to(satellite0, star12, groundstation7),
        switch_on(instrument0, satellite0),
        calibrate(satellite0, instrument0, star12),
        turn_to(satellite0, star15, star12),
        take_image(satellite0, star15, instrument0, thermograph2),
        turn_to(satellite0, star14, star15),
        take_image(satellite0, star14, instrument0, thermograph2),
        turn_to(satellite0, star17, star14),
        take_image(satellite0, star17, instrument0, thermograph3),
        turn_to(satellite0, star16, star17),
        take_image(satellite0, star16, instrument0, thermograph3),
        turn_to(satellite0, groundstation19, star16),
        take_image(satellite0, groundstation19, instrument0, thermograph2),
        turn_to(satellite0, star2, groundstation19),
        take_image(satellite0, star2, instrument0, thermograph3),
        turn_to(satellite0, groundstation13, star2),
        take_image(satellite0, groundstation13, instrument0, thermograph3),
        turn_to(satellite0, star18, groundstation13),
        take_image(satellite0, star18, instrument0, image1),
        turn_to(satellite0, groundstation11, star18),
        take_image(satellite0, groundstation11, instrument0, thermograph3)
    ]
  ]
)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% experience 2: p22
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(robot_activity_experience(
  strips-sat-x-2,    %% episode ID
  satellite,    %% domain
  [
    take_image(satellite0),    %% task
    [        %% key propositions
        at_start(power_avail(satellite0)),
        at_start(pointing(satellite0,star3)),
        throughout(satellite(satellite0)),
        throughout(instrument(instrument0)),
        throughout(supports(instrument0,thermograph0)),
        throughout(supports(instrument0,thermograph2)),
        throughout(calibration_target(instrument0,star1)),
        throughout(calibration_target(instrument0,star18)),
        throughout(calibration_target(instrument0,star8)),
        throughout(calibration_target(instrument0,groundstation14)),
        throughout(instrument(instrument1)),
        throughout(supports(instrument1,image1)),
        throughout(supports(instrument1,thermograph2)),
        throughout(calibration_target(instrument1,groundstation21)),
        throughout(calibration_target(instrument1,groundstation15)),
        throughout(calibration_target(instrument1,groundstation10)),
        throughout(calibration_target(instrument1,groundstation12)),
        throughout(calibration_target(instrument1,star1)),
        throughout(on_board(instrument0,satellite0)),
        throughout(on_board(instrument1,satellite0)),
        throughout(mode(thermograph3)),
        throughout(mode(thermograph4)),
        throughout(mode(thermograph0)),
        throughout(mode(thermograph2)),
        throughout(mode(image1)),
        throughout(direction(star0)),
        throughout(direction(groundstation2)),
        throughout(direction(star3)),
        throughout(direction(star4)),
        throughout(direction(groundstation5)),
        throughout(direction(groundstation6)),
        throughout(direction(groundstation7)),
        throughout(direction(star9)),
        throughout(direction(groundstation11)),
        throughout(direction(groundstation13)),
        throughout(direction(groundstation16)),
        throughout(direction(star17)),
        throughout(direction(groundstation19)),
        throughout(direction(star20)),
        throughout(direction(groundstation14)),
        throughout(direction(star8)),
        throughout(direction(star18)),
        throughout(direction(star1)),
        throughout(direction(groundstation12)),
        throughout(direction(groundstation10)),
        throughout(direction(groundstation15)),
        throughout(direction(groundstation21)),
        throughout(direction(star22)),
        at_end(have_image(star20,image1)),
        at_end(have_image(star17,thermograph0)),
        at_end(have_image(groundstation19,thermograph2)),
        at_end(have_image(groundstation16,image1)),
        at_end(have_image(groundstation13,image1)),
        at_end(have_image(star22,thermograph2)),
        at_end(have_image(groundstation11,image1))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        turn_to(satellite0, star1, star3),
        switch_on(instrument0, satellite0),
        calibrate(satellite0, instrument0, star1),
        turn_to(satellite0, star17, star1),
        take_image(satellite0, star17, instrument0, thermograph0),
        turn_to(satellite0, groundstation19, star17),
        take_image(satellite0, groundstation19, instrument0, thermograph2),
        turn_to(satellite0, star22, groundstation19),
        take_image(satellite0, star22, instrument0, thermograph2),
        switch_off(instrument0, satellite0),
        turn_to(satellite0, groundstation21, star22),
        switch_on(instrument1, satellite0),
        calibrate(satellite0, instrument1, groundstation21),
        turn_to(satellite0, star20, groundstation21),
        take_image(satellite0, star20, instrument1, image1),
        turn_to(satellite0, groundstation16, star20),
        take_image(satellite0, groundstation16, instrument1, image1),
        turn_to(satellite0, groundstation13, groundstation16),
        take_image(satellite0, groundstation13, instrument1, image1),
        turn_to(satellite0, groundstation11, groundstation13),
        take_image(satellite0, groundstation11, instrument1, image1)
    ]
  ]
)).
