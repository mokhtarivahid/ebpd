:-assert(robot_activity_experience(
  gripper_2_1_4,    %% episode ID
  gripper,    %% domain
  [
    transport(rooma,roomb),    %% task
    [        %% key propositions
        at_start(at(ball1,rooma)),
        at_start(at(ball2,rooma)),
        at_start(at(ball3,rooma)),
        at_start(at(ball4,rooma)),
        at_start(free(left)),
        at_start(at_robby(rooma)),
        throughout(room(rooma)),
        throughout(room(roomb)),
        throughout(ball(ball1)),
        throughout(ball(ball2)),
        throughout(ball(ball3)),
        throughout(ball(ball4)),
        throughout(gripper(left)),
        at_end(at(ball1,roomb)),
        at_end(at(ball2,roomb)),
        at_end(at(ball3,roomb)),
        at_end(at(ball4,roomb)),
        at_end(at_robby(roomb)),
        at_end(free(left))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        pick(ball1, rooma, left),
        move(rooma, roomb),
        drop(ball1, roomb, left),
        move(roomb, rooma),
        pick(ball2, rooma, left),
        move(rooma, roomb),
        drop(ball2, roomb, left),
        move(roomb, rooma),
        pick(ball3, rooma, left),
        move(rooma, roomb),
        drop(ball3, roomb, left),
        move(roomb, rooma),
        pick(ball4, rooma, left),
        move(rooma, roomb),
        drop(ball4, roomb, left)    
    ]
  ]
)).

:-assert(robot_activity_experience(
  gripper_2_2_4,    %% episode ID
  gripper,    %% domain
  [
    transport(rooma,roomb),    %% task
    [        %% key propositions
        at_start(at(ball1,rooma)),
        at_start(at(ball2,rooma)),
        at_start(at(ball3,rooma)),
        at_start(at(ball4,rooma)),
        at_start(free(left)),
        at_start(free(right)),
        at_start(at_robby(rooma)),
        throughout(room(rooma)),
        throughout(room(roomb)),
        throughout(ball(ball1)),
        throughout(ball(ball2)),
        throughout(ball(ball3)),
        throughout(ball(ball4)),
        throughout(gripper(left)),
        throughout(gripper(right)),
        at_end(at(ball1,roomb)),
        at_end(at(ball2,roomb)),
        at_end(at(ball3,roomb)),
        at_end(at(ball4,roomb)),
        at_end(at_robby(roomb)),
        at_end(free(left)),
        at_end(free(right))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        pick(ball1, rooma, right),
        pick(ball2, rooma, left),
        move(rooma, roomb),
        drop(ball1, roomb, right),
        drop(ball2, roomb, left),
        move(roomb, rooma),
        pick(ball3, rooma, right),
        pick(ball4, rooma, left),
        move(rooma, roomb),
        drop(ball3, roomb, right),
        drop(ball4, roomb, left)
    ]
  ]
)).
