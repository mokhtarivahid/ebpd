:-assert(robot_activity_experience(
  tray_1_1_4,    %% episode ID
  robotic_arm,    %% domain
  [
    clean(table1,tray1),    %% task
    [        %% key propositions
        at_start(on(bottle1,table1)),
        at_start(on(bottle2,table1)),
        at_start(on(bottle3,table1)),
        at_start(on(bottle4,table1)),
        at_start(free(arm1)),
        at_start(at(arm1,table1)),
        throughout(bottle(bottle1)),
        throughout(bottle(bottle2)),
        throughout(bottle(bottle3)),
        throughout(bottle(bottle4)),
        throughout(arm(arm1)),
        throughout(table(table1)),
        throughout(tray(tray1)),
        at_end(free(arm1)),
        at_end(at(arm1,tray1)),
        at_end(in(bottle1,tray1)),
        at_end(in(bottle2,tray1)),
        at_end(in(bottle3,tray1)),
        at_end(in(bottle4,tray1))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        pick(arm1, bottle1, table1),
        move(arm1, table1, tray1),
        place(arm1, bottle1, tray1),
        move(arm1, tray1, table1),
        pick(arm1, bottle2, table1),
        move(arm1, table1, tray1),
        place(arm1, bottle2, tray1),
        move(arm1, tray1, table1),
        pick(arm1, bottle3, table1),
        move(arm1, table1, tray1),
        place(arm1, bottle3, tray1),
        move(arm1, tray1, table1),
        pick(arm1, bottle4, table1),
        move(arm1, table1, tray1),
        place(arm1, bottle4, tray1)
    ]
  ]
)).
