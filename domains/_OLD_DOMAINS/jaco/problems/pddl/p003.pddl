 (define (problem p3)

  (:domain robotic_arm)

  (:objects
    arm1 - arm
    obj1 obj2 obj3 - object
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
    )

 (:goal
    (and 
    (on obj1 tray1)
    (on obj2 tray1)
    (on obj3 tray1)
    )))
