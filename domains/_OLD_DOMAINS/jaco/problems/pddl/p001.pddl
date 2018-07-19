 (define (problem p1)

  (:domain robotic_arm)

  (:objects
    arm1 - arm
    obj1 - object
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
    )

 (:goal
    (on obj1 tray1)))
