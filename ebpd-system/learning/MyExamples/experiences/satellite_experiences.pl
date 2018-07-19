%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% experience 1: 1 satellite, 1 instrument, initial pointing is NOT toward a calibrated target
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(robot_activity_experience(
  s4_1,    %% episode ID
  satellite,    %% domain
  [
    take_image1(satellite0),    %% task
    [        %% key propositions
        throughout(direction(star1)),
        throughout(direction(star2)),
        throughout(direction(star0)),
        throughout(direction(star3)),
        throughout(direction(star4)),
        throughout(direction(phenomenon5)),
        throughout(direction(phenomenon6)),
        throughout(direction(phenomenon7)),
        throughout(satellite(satellite0)),
        throughout(instrument(instrument0)),
        throughout(mode(image1)),
        throughout(mode(infrared0)),
        throughout(mode(spectrograph2)),
        throughout(supports(instrument0, spectrograph2)),
        throughout(supports(instrument0, infrared0)),
        throughout(calibration_target(instrument0, star1)),
        throughout(on_board(instrument0, satellite0)),
        at_start(power_avail(satellite0)),
        at_start(pointing(satellite0, star0)),
        at_end(have_image(phenomenon5,spectrograph2)),
        at_end(have_image(phenomenon7,spectrograph2)),
        at_end(have_image(star3,infrared0)),
        at_end(have_image(star4,spectrograph2))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        switch_on(instrument0, satellite0),
        turn_to(satellite0, star1, star0),
        calibrate(satellite0, instrument0, star1),
        turn_to(satellite0, star4, star1),
        take_image(satellite0, star4, instrument0, spectrograph2),
        turn_to(satellite0, phenomenon7, star4),
        take_image(satellite0, phenomenon7, instrument0, spectrograph2),
        turn_to(satellite0, phenomenon5, phenomenon7),
        take_image(satellite0, phenomenon5, instrument0, spectrograph2),
        turn_to(satellite0, star3, phenomenon5),
        take_image(satellite0, star3, instrument0, infrared0)
    ]
  ]
)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% experience 2: 1 satellite, 1 instrument, initial pointing is toward a calibrated target
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(robot_activity_experience(
  s4_2,    %% episode ID
  satellite,    %% domain
  [
    take_image2(satellite0),    %% task
    [        %% key propositions
        throughout(direction(star1)),
        throughout(direction(star2)),
        throughout(direction(star0)),
        throughout(direction(star3)),
        throughout(direction(star4)),
        throughout(direction(phenomenon5)),
        throughout(direction(phenomenon6)),
        throughout(direction(phenomenon7)),
        throughout(satellite(satellite0)),
        throughout(instrument(instrument0)),
        throughout(mode(image1)),
        throughout(mode(infrared0)),
        throughout(mode(spectrograph2)),
        throughout(supports(instrument0, spectrograph2)),
        throughout(supports(instrument0, infrared0)),
        throughout(calibration_target(instrument0, star1)),
        throughout(on_board(instrument0, satellite0)),
        at_start(power_avail(satellite0)),
        at_start(pointing(satellite0, star1)),
        at_end(have_image(phenomenon5,spectrograph2)),
        at_end(have_image(phenomenon7,spectrograph2)),
        at_end(have_image(star3,infrared0)),
        at_end(have_image(star4,spectrograph2))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        switch_on(instrument0, satellite0),
        calibrate(satellite0, instrument0, star1),
        turn_to(satellite0, star4, star1),
        take_image(satellite0, star4, instrument0, spectrograph2),
        turn_to(satellite0, phenomenon7, star4),
        take_image(satellite0, phenomenon7, instrument0, spectrograph2),
        turn_to(satellite0, phenomenon5, phenomenon7),
        take_image(satellite0, phenomenon5, instrument0, spectrograph2),
        turn_to(satellite0, star3, phenomenon5),
        take_image(satellite0, star3, instrument0, infrared0)
    ]
  ]
)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% experience 3: 1 satellite, 2 instruments, initial pointing is NOT toward a calibrated target
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(robot_activity_experience(
  s6_1,    %% episode ID
  satellite,    %% domain
  [
    take_image_3(satellite0),    %% task
    [        %% key propositions
        at_start(power_avail(satellite0)),
        at_start(pointing(satellite0,star0)),
        throughout(direction(star1)),
        throughout(direction(star2)),
        throughout(direction(star0)),
        throughout(direction(star3)),
        throughout(direction(star4)),
        throughout(direction(phenomenon5)),
        throughout(direction(phenomenon6)),
        throughout(direction(phenomenon7)),
        throughout(satellite(satellite0)),
        throughout(instrument(instrument0)),
        throughout(instrument(instrument1)),
        throughout(mode(image1)),
        throughout(mode(infrared0)),
        throughout(mode(spectrograph2)),
        throughout(supports(instrument0,spectrograph2)),
        throughout(supports(instrument0,infrared0)),
        throughout(calibration_target(instrument0,star1)),
        throughout(supports(instrument1,image1)),
        throughout(calibration_target(instrument1,star2)),
        throughout(on_board(instrument0,satellite0)),
        throughout(on_board(instrument1,satellite0)),
        at_end(have_image(star3,infrared0)),
        at_end(have_image(star4,spectrograph2)),
        at_end(have_image(phenomenon5,spectrograph2)),
        at_end(have_image(phenomenon7,image1)),
        at_end(have_image(phenomenon6,image1)),
        at_end(have_image(star1,image1))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        turn_to(satellite0, star2, star0),
        switch_on(instrument1, satellite0),
        calibrate(satellite0, instrument1, star2),
        turn_to(satellite0, phenomenon6, star2),
        take_image(satellite0, phenomenon6, instrument1, image1),
        turn_to(satellite0, phenomenon7, phenomenon6),
        take_image(satellite0, phenomenon7, instrument1, image1),
        turn_to(satellite0, star1, phenomenon7),
        take_image(satellite0, star1, instrument1, image1),
        switch_off(instrument1, satellite0),
        switch_on(instrument0, satellite0),
        calibrate(satellite0, instrument0, star1),
        turn_to(satellite0, star3, star1),
        take_image(satellite0, star3, instrument0, infrared0),
        turn_to(satellite0, star4, star3),
        take_image(satellite0, star4, instrument0, spectrograph2),
        turn_to(satellite0, phenomenon5, star4),
        take_image(satellite0, phenomenon5, instrument0, spectrograph2)
    ]
  ]
)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% experience 3: 1 satellite, 2 instruments, initial pointing is toward a calibrated target
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(robot_activity_experience(
  s6_2,    %% episode ID
  satellite,    %% domain
  [
    take_image_4(satellite0),    %% task
    [        %% key propositions
        at_start(power_avail(satellite0)),
        at_start(pointing(satellite0,star2)),
        throughout(direction(star1)),
        throughout(direction(star2)),
        throughout(direction(star0)),
        throughout(direction(star3)),
        throughout(direction(star4)),
        throughout(direction(phenomenon5)),
        throughout(direction(phenomenon6)),
        throughout(direction(phenomenon7)),
        throughout(satellite(satellite0)),
        throughout(instrument(instrument0)),
        throughout(instrument(instrument1)),
        throughout(mode(image1)),
        throughout(mode(infrared0)),
        throughout(mode(spectrograph2)),
        throughout(supports(instrument0,spectrograph2)),
        throughout(supports(instrument0,infrared0)),
        throughout(calibration_target(instrument0,star1)),
        throughout(supports(instrument1,image1)),
        throughout(calibration_target(instrument1,star2)),
        throughout(on_board(instrument0,satellite0)),
        throughout(on_board(instrument1,satellite0)),
        at_end(have_image(star3,infrared0)),
        at_end(have_image(star4,spectrograph2)),
        at_end(have_image(phenomenon5,spectrograph2)),
        at_end(have_image(phenomenon7,image1)),
        at_end(have_image(phenomenon6,image1)),
        at_end(have_image(star1,image1))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        switch_on(instrument1, satellite0),
        calibrate(satellite0, instrument1, star2),
        turn_to(satellite0, phenomenon6, star2),
        take_image(satellite0, phenomenon6, instrument1, image1),
        turn_to(satellite0, phenomenon7, phenomenon6),
        take_image(satellite0, phenomenon7, instrument1, image1),
        turn_to(satellite0, star1, phenomenon7),
        take_image(satellite0, star1, instrument1, image1),
        switch_off(instrument1, satellite0),
        switch_on(instrument0, satellite0),
        calibrate(satellite0, instrument0, star1),
        turn_to(satellite0, star3, star1),
        take_image(satellite0, star3, instrument0, infrared0),
        turn_to(satellite0, star4, star3),
        take_image(satellite0, star4, instrument0, spectrograph2),
        turn_to(satellite0, phenomenon5, star4),
        take_image(satellite0, phenomenon5, instrument0, spectrograph2)
    ]
  ]
)).
