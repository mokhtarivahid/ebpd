:-assert(robot_activity_experience(
  p5,    %% episode ID
  robotic_arm,    %% domain
  [
    clear(table1,tray1),    %% task
    [        %% key propositions
        at_start(arm_at(jaco,table1)),
        at_start(arm_active(jaco,standby)),
        at_start(arm_free(jaco)),
        at_start(on(obj1,table1)),
        at_start(on(obj2,table1)),
        at_start(on(obj3,table1)),
        at_start(on(obj4,table1)),
        at_start(on(obj5,table1)),
        throughout(arm_canreach(jaco,table1)),
        throughout(arm_canreach(jaco,tray1)),
        throughout(arm_capabilities(jaco,grip)),
        throughout(arm_capabilities(jaco,standby)),
        at_end(on(obj1,tray1)),
        at_end(on(obj2,tray1)),
        at_end(on(obj3,tray1)),
        at_end(on(obj4,tray1)),
        at_end(on(obj5,tray1))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        activate(jaco,standby,grip),
        update_vision(jaco,table1),
        pick_up_object(jaco,obj1,table1),
        move_arm(jaco,table1,tray1),
        update_vision(jaco,tray1),
        place_object(jaco,obj1,tray1),
        move_arm(jaco,tray1,table1),
        update_vision(jaco,table1),
        pick_up_object(jaco,obj2,table1),
        move_arm(jaco,table1,tray1),
        update_vision(jaco,tray1),
        place_object(jaco,obj2,tray1),
        move_arm(jaco,tray1,table1),
        update_vision(jaco,table1),
        pick_up_object(jaco,obj3,table1),
        move_arm(jaco,table1,tray1),
        update_vision(jaco,tray1),
        place_object(jaco,obj3,tray1),
        move_arm(jaco,tray1,table1),
        update_vision(jaco,table1),
        pick_up_object(jaco,obj4,table1),
        move_arm(jaco,table1,tray1),
        update_vision(jaco,tray1),
        place_object(jaco,obj4,tray1),
        move_arm(jaco,tray1,table1),
        update_vision(jaco,table1),
        pick_up_object(jaco,obj5,table1),
        move_arm(jaco,table1,tray1),
        update_vision(jaco,tray1),
        place_object(jaco,obj5,tray1)
    ]
  ]
)).
