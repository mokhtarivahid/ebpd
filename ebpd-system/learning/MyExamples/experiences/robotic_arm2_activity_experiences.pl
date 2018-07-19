
:- assert(
robot_activity_experience(
    
    p001,                   %% episode ID
    clear1,              %% problem
    [
        clear1(table1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),           
            at_start(on(obj1, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            activate(jaco,standby,grip),
            detect_pose_pick_up(jaco,obj1,table1),
            pick_up_object(jaco,obj1,table1),
            carry_object(jaco,obj1,table1,tray1),
            detect_pose_place(jaco,obj1,tray1),
            place_object(jaco,obj1,tray1)

        ]
    ]
)).


:- assert(
robot_activity_experience(
    
    p002,                   %% episode ID
    clear2,              %% problem
    [
        clear2(table1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),           
            at_start(on(obj1, table1)),
            at_start(on(obj2, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1)),
            at_end(on(obj2, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            activate(jaco,standby,grip),
            detect_pose_pick_up(jaco,obj1,table1),
            pick_up_object(jaco,obj1,table1),
            detect_pose_pick_up(jaco,obj2,table1),
            carry_object(jaco,obj1,table1,tray1),
            detect_pose_place(jaco,obj1,tray1),
            place_object(jaco,obj1,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj2,table1),
            carry_object(jaco,obj2,table1,tray1),
            detect_pose_place(jaco,obj2,tray1),
            place_object(jaco,obj2,tray1)
        ]
    ]
)).

:- assert(
robot_activity_experience(
    
    p003,                   %% episode ID
    clear3,              %% problem
    [
        clear3(table1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),
            at_start(on(obj1, table1)),
            at_start(on(obj2, table1)),
            at_start(on(obj3, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1)),
            at_end(on(obj2, tray1)),
            at_end(on(obj3, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            activate(jaco,standby,grip),
            detect_pose_pick_up(jaco,obj1,table1),
            detect_pose_pick_up(jaco,obj2,table1),
            detect_pose_pick_up(jaco,obj3,table1),
            pick_up_object(jaco,obj1,table1),
            carry_object(jaco,obj1,table1,tray1),
            detect_pose_place(jaco,obj1,tray1),
            place_object(jaco,obj1,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj2,table1),
            carry_object(jaco,obj2,table1,tray1),
            detect_pose_place(jaco,obj2,tray1),
            place_object(jaco,obj2,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj3,table1),
            carry_object(jaco,obj3,table1,tray1),
            detect_pose_place(jaco,obj3,tray1),
            place_object(jaco,obj3,tray1)
        ]
    ]
)).

:- assert(
robot_activity_experience(
    
    p004,                   %% episode ID
    clear4,              %% problem
    [
        clear4(table1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),
            at_start(on(obj1, table1)),
            at_start(on(obj2, table1)),
            at_start(on(obj3, table1)),
            at_start(on(obj4, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1)),
            at_end(on(obj2, tray1)),
            at_end(on(obj3, tray1)),
            at_end(on(obj4, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            activate(jaco,standby,grip),
            detect_pose_pick_up(jaco,obj1,table1),
            detect_pose_pick_up(jaco,obj2,table1),
            detect_pose_pick_up(jaco,obj3,table1),
            detect_pose_pick_up(jaco,obj4,table1),
            pick_up_object(jaco,obj1,table1),
            carry_object(jaco,obj1,table1,tray1),
            detect_pose_place(jaco,obj1,tray1),
            place_object(jaco,obj1,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj2,table1),
            carry_object(jaco,obj2,table1,tray1),
            detect_pose_place(jaco,obj2,tray1),
            place_object(jaco,obj2,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj3,table1),
            carry_object(jaco,obj3,table1,tray1),
            detect_pose_place(jaco,obj3,tray1),
            place_object(jaco,obj3,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj4,table1),
            carry_object(jaco,obj4,table1,tray1),
            detect_pose_place(jaco,obj4,tray1),
            place_object(jaco,obj4,tray1)
        ]
    ]
)).

:- assert(
robot_activity_experience(
    
    p005,                   %% episode ID
    clear5,              %% problem
    [
        clear5(table1,tray1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),
            at_start(on(obj1, table1)),
            at_start(on(obj2, table1)),
            at_start(on(obj3, table1)),
            at_start(on(obj4, table1)),
            at_start(on(obj5, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1)),
            at_end(on(obj2, tray1)),
            at_end(on(obj3, tray1)),
            at_end(on(obj4, tray1)),
            at_end(on(obj5, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            activate(jaco,standby,grip),
            detect_pose_pick_up(jaco,obj1,table1),
            detect_pose_pick_up(jaco,obj2,table1),
            detect_pose_pick_up(jaco,obj3,table1),
            detect_pose_pick_up(jaco,obj4,table1),
            detect_pose_pick_up(jaco,obj5,table1),
            pick_up_object(jaco,obj1,table1),
            carry_object(jaco,obj1,table1,tray1),
            detect_pose_place(jaco,obj1,tray1),
            place_object(jaco,obj1,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj2,table1),
            carry_object(jaco,obj2,table1,tray1),
            detect_pose_place(jaco,obj2,tray1),
            place_object(jaco,obj2,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj3,table1),
            carry_object(jaco,obj3,table1,tray1),
            detect_pose_place(jaco,obj3,tray1),
            place_object(jaco,obj3,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj4,table1),
            carry_object(jaco,obj4,table1,tray1),
            detect_pose_place(jaco,obj4,tray1),
            place_object(jaco,obj4,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj5,table1),
            carry_object(jaco,obj5,table1,tray1),
            detect_pose_place(jaco,obj5,tray1),
            place_object(jaco,obj5,tray1)
        ]
    ]
)).



:- assert(
robot_activity_experience(
    
    p006,                   %% episode ID
    clear6,              %% problem
    [
        clear6(table1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),
            at_start(on(obj1, table1)),
            at_start(on(obj2, table1)),
            at_start(on(obj3, table1)),
            at_start(on(obj4, table1)),
            at_start(on(obj5, table1)),
            at_start(on(obj6, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1)),
            at_end(on(obj2, tray1)),
            at_end(on(obj3, tray1)),
            at_end(on(obj4, tray1)),
            at_end(on(obj5, tray1)),
            at_end(on(obj6, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            activate(jaco,standby,grip),
            detect_pose_pick_up(jaco,obj1,table1),
            detect_pose_pick_up(jaco,obj2,table1),
            detect_pose_pick_up(jaco,obj3,table1),
            detect_pose_pick_up(jaco,obj4,table1),
            detect_pose_pick_up(jaco,obj5,table1),
            detect_pose_pick_up(jaco,obj6,table1),
            pick_up_object(jaco,obj1,table1),
            carry_object(jaco,obj1,table1,tray1),
            detect_pose_place(jaco,obj1,tray1),
            place_object(jaco,obj1,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj2,table1),
            carry_object(jaco,obj2,table1,tray1),
            detect_pose_place(jaco,obj2,tray1),
            place_object(jaco,obj2,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj3,table1),
            carry_object(jaco,obj3,table1,tray1),
            detect_pose_place(jaco,obj3,tray1),
            place_object(jaco,obj3,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj4,table1),
            carry_object(jaco,obj4,table1,tray1),
            detect_pose_place(jaco,obj4,tray1),
            place_object(jaco,obj4,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj5,table1),
            carry_object(jaco,obj5,table1,tray1),
            detect_pose_place(jaco,obj5,tray1),
            place_object(jaco,obj5,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj6,table1),
            carry_object(jaco,obj6,table1,tray1),
            detect_pose_place(jaco,obj6,tray1),
            place_object(jaco,obj6,tray1)
        ]
    ]
)).

:- assert(
robot_activity_experience(
    
    p007,                   %% episode ID
    clear7,              %% problem
    [
        clear7(table1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),
            at_start(on(obj1, table1)),
            at_start(on(obj2, table1)),
            at_start(on(obj3, table1)),
            at_start(on(obj4, table1)),
            at_start(on(obj5, table1)),
            at_start(on(obj6, table1)),
            at_start(on(obj7, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1)),
            at_end(on(obj2, tray1)),
            at_end(on(obj3, tray1)),
            at_end(on(obj4, tray1)),
            at_end(on(obj5, tray1)),
            at_end(on(obj6, tray1)),
            at_end(on(obj7, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            activate(jaco,standby,grip),
            detect_pose_pick_up(jaco,obj1,table1),
            detect_pose_pick_up(jaco,obj2,table1),
            detect_pose_pick_up(jaco,obj3,table1),
            detect_pose_pick_up(jaco,obj4,table1),
            detect_pose_pick_up(jaco,obj5,table1),
            detect_pose_pick_up(jaco,obj6,table1),
            detect_pose_pick_up(jaco,obj7,table1),
            pick_up_object(jaco,obj1,table1),
            carry_object(jaco,obj1,table1,tray1),
            detect_pose_place(jaco,obj1,tray1),
            place_object(jaco,obj1,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj2,table1),
            carry_object(jaco,obj2,table1,tray1),
            detect_pose_place(jaco,obj2,tray1),
            place_object(jaco,obj2,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj3,table1),
            carry_object(jaco,obj3,table1,tray1),
            detect_pose_place(jaco,obj3,tray1),
            place_object(jaco,obj3,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj4,table1),
            carry_object(jaco,obj4,table1,tray1),
            detect_pose_place(jaco,obj4,tray1),
            place_object(jaco,obj4,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj5,table1),
            carry_object(jaco,obj5,table1,tray1),
            detect_pose_place(jaco,obj5,tray1),
            place_object(jaco,obj5,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj6,table1),
            carry_object(jaco,obj6,table1,tray1),
            detect_pose_place(jaco,obj6,tray1),
            place_object(jaco,obj6,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj7,table1),
            carry_object(jaco,obj7,table1,tray1),
            detect_pose_place(jaco,obj7,tray1),
            place_object(jaco,obj7,tray1)
        ]
    ]
)).

:- assert(
robot_activity_experience(
    
    p008,                   %% episode ID
    clear8,              %% problem
    [
        clear8(table1,tray1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),
            at_start(on(obj1, table1)),
            at_start(on(obj2, table1)),
            at_start(on(obj3, table1)),
            at_start(on(obj4, table1)),
            at_start(on(obj5, table1)),
            at_start(on(obj6, table1)),
            at_start(on(obj7, table1)),
            at_start(on(obj8, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1)),
            at_end(on(obj2, tray1)),
            at_end(on(obj3, tray1)),
            at_end(on(obj4, tray1)),
            at_end(on(obj5, tray1)),
            at_end(on(obj6, tray1)),
            at_end(on(obj7, tray1)),
            at_end(on(obj8, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            activate(jaco,standby,grip),
            detect_pose_pick_up(jaco,obj1,table1),
            detect_pose_pick_up(jaco,obj2,table1),
            detect_pose_pick_up(jaco,obj3,table1),
            detect_pose_pick_up(jaco,obj4,table1),
            detect_pose_pick_up(jaco,obj5,table1),
            detect_pose_pick_up(jaco,obj6,table1),
            detect_pose_pick_up(jaco,obj7,table1),
            detect_pose_pick_up(jaco,obj8,table1),
            pick_up_object(jaco,obj1,table1),
            carry_object(jaco,obj1,table1,tray1),
            detect_pose_place(jaco,obj1,tray1),
            place_object(jaco,obj1,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj2,table1),
            carry_object(jaco,obj2,table1,tray1),
            detect_pose_place(jaco,obj2,tray1),
            place_object(jaco,obj2,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj3,table1),
            carry_object(jaco,obj3,table1,tray1),
            detect_pose_place(jaco,obj3,tray1),
            place_object(jaco,obj3,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj4,table1),
            carry_object(jaco,obj4,table1,tray1),
            detect_pose_place(jaco,obj4,tray1),
            place_object(jaco,obj4,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj5,table1),
            carry_object(jaco,obj5,table1,tray1),
            detect_pose_place(jaco,obj5,tray1),
            place_object(jaco,obj5,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj6,table1),
            carry_object(jaco,obj6,table1,tray1),
            detect_pose_place(jaco,obj6,tray1),
            place_object(jaco,obj6,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj7,table1),
            carry_object(jaco,obj7,table1,tray1),
            detect_pose_place(jaco,obj7,tray1),
            place_object(jaco,obj7,tray1),
            move_arm(jaco,tray1,table1),
            pick_up_object(jaco,obj8,table1),
            carry_object(jaco,obj8,table1,tray1),
            detect_pose_place(jaco,obj8,tray1),
            place_object(jaco,obj8,tray1)
        ]
    ]
)).

:- assert(
robot_activity_experience(
    
    p009,                   %% episode ID
    clear9,              %% problem
    [
        clear9(table1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),
            at_start(on(obj1, table1)),
            at_start(on(obj2, table1)),
            at_start(on(obj3, table1)),
            at_start(on(obj4, table1)),
            at_start(on(obj5, table1)),
            at_start(on(obj6, table1)),
            at_start(on(obj7, table1)),
            at_start(on(obj8, table1)),
            at_start(on(obj9, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1)),
            at_end(on(obj2, tray1)),
            at_end(on(obj3, tray1)),
            at_end(on(obj4, tray1)),
            at_end(on(obj5, tray1)),
            at_end(on(obj6, tray1)),
            at_end(on(obj7, tray1)),
            at_end(on(obj8, tray1)),
            at_end(on(obj9, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
        ]
    ]
)).

:- assert(
robot_activity_experience(
    
    p010,                   %% episode ID
    clear10,              %% problem
    [
        clear10(table1,tray1),  %% Task
        [                       %% KeyProps
            at_start(arm_at(jaco, table1)),
            at_start(arm_active(jaco, standby)),
            at_start(arm_free(jaco)),
            at_start(on(obj1, table1)),
            at_start(on(obj2, table1)),
            at_start(on(obj3, table1)),
            at_start(on(obj4, table1)),
            at_start(on(obj5, table1)),
            at_start(on(obj6, table1)),
            at_start(on(obj7, table1)),
            at_start(on(obj8, table1)),
            at_start(on(obj9, table1)),
            at_start(on(obj10, table1)),
            throughout(arm_canreach(jaco, table1)),
            throughout(arm_canreach(jaco, tray1)),
            throughout(arm_capabilities(jaco, grip)),
            throughout(arm_capabilities(jaco, standby)),
            at_end(on(obj1, tray1)),
            at_end(on(obj2, tray1)),
            at_end(on(obj3, tray1)),
            at_end(on(obj4, tray1)),
            at_end(on(obj5, tray1)),
            at_end(on(obj6, tray1)),
            at_end(on(obj7, tray1)),
            at_end(on(obj8, tray1)),
            at_end(on(obj9, tray1)),
            at_end(on(obj10, tray1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
        ]
    ]
)).

