 (define (problem p9)

  (:domain robotic_arm)

  (:objects
    arm1 - arm
    obj1 obj2 obj3 obj4 obj5 obj6 obj7 obj8 obj9 - object
    table1 tray1 - table
    standby grip - arm_state)

  (:init
    (arm_canreach arm1 table1)
    (arm_canreach arm1 tray1)
    (arm_at arm1 table1)
    (arm_capabilities arm1 grip)
    (arm_capabilities arm1 standby)
    (arm_active arm1 standby)
    (arm_free arm1)
    (on obj1 table1)
    (on obj2 table1)
    (on obj3 table1)
    (on obj4 table1)
    (on obj5 table1)
    (on obj6 table1)
    (on obj7 table1)
    (on obj8 table1)
    (on obj9 table1)
    )

 (:goal
    (and 
    (on obj1 tray1)
    (on obj2 tray1)
    (on obj3 tray1)
    (on obj4 tray1)
    (on obj5 tray1)
    (on obj6 tray1)
    (on obj7 tray1)
    (on obj8 tray1)
    (on obj9 tray1)
    )))
