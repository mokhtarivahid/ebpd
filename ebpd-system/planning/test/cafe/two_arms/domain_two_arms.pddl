(define (domain cafe)
 (:requirements :strips :typing)
 (:types guest robot movearea placearea seatarea arm kitchenware furniture robotposture)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (:constants
    floorarea1 manipulationareanorthtable1 manipulationareasouthtable1 manipulationareaeasttable2 manipulationareawesttable2 manipulationareaeastcounter1 premanipulationareanorthtable1 premanipulationareasouthtable1 premanipulationareaeastcounter1 premanipulationareaeasttable2 premanipulationareawesttable2 - movearea
    placingareaeastrightcounter1 placingareaeastrighttable1 placingareaeastlefttable1 placingareasouthrighttable2 placingareasouthlefttable2 placingareawestlefttable1 placingareawestrighttable1 placingareanorthrighttable2 placingareanorthlefttable2 tray1 - placearea
    sittingareawesttable1 sittingareaeasttable1 sittingareanorthtable2 sittingareasouthtable2 - seatarea
    guest1 - guest
    pr2 - robot
    leftarm rightarm - arm
    mug1 mug2 mug3 mug4 mug5 mug6 plate1 plate2 plate3 plate4 plate5 plate6 - kitchenware
    counter1 table1 table2 - furniture
    armtucked armuntucked armtoside armtocarry torsoup torsodown torsomiddle gripperfree gripperholding - robotposture
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (:predicates
    (premanipulationarea ?pma - movearea)
    (manipulationarea ?ma - movearea)
    (placingarea ?pa - placearea)
    (tray ?pa - placearea)
    (sittingarea ?sa - seatarea)

    (table ?t - furniture)
    (counter ?c - furniture)

    (hasmanipulationarea ?pma ?ma - movearea)

    (tablemanipulationarea ?table - furniture ?ma - movearea)
    (tablepremanipulationarea ?table - furniture ?pma - movearea)
    (tableplacingarea ?table - furniture ?pa - placearea)
    (tablesittingarea ?table - furniture ?sa - seatarea)

    (hasleftplacingarea ?sa - seatarea ?pa - placearea)  ;; sittingarea has leftplacingarea
    (hasrightplacingarea ?sa - seatarea ?pa - placearea) ;; sittingarea has rightplacingarea

    (robotat ?robot - robot ?at - movearea) ;; robotat pre/manipulationarea
    (guestat ?guest - guest ?at - seatarea) ;; guest at sittingarea

    (objectat ?obj - kitchenware ?pa - placearea) ;; object at placingarea
    (reachable ?ma - movearea ?pa - placearea)

    (robotarmposture ?arm - arm ?ap - robotposture)
    (robottorsoposture ?robot - robot ?t - robotposture)
    (armgripperposture ?arm - arm ?ag - robotposture)

    (torsoposture ?tp - robotposture)
    (armposture ?ap - robotposture)
    (gripperposture ?gp - robotposture)

    (armholding ?arm - arm ?obj - kitchenware)

 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;(:action tuck_arms
    ;;    :parameters (?arm1 ?arm2 - arm ?ap1 ?ap2 - robotposture)
    ;;    :precondition   (and
    ;;                        (robotarmposture ?arm1 ?ap1)
    ;;                        (robotarmposture ?arm2 ?ap2)
    ;;                        ;(not (= ?ap armtucked))
    ;;                    )
    ;;    :effect         (and
    ;;                        (not (robotarmposture ?arm1 ?ap1))
    ;;                        (not (robotarmposture ?arm2 ?ap2))
    ;;                        (robotarmposture ?arm1 armtucked)
    ;;                        (robotarmposture ?arm2 armtucked))
    ;;)

    ;; tuck an arm, the robot should be in a premanipulationarea
    (:action tuck_arm
        :parameters (?robot - robot ?arm - arm ?pma - movearea ?ap - robotposture)
        :precondition   (and
                            (robotarmposture ?arm ?ap)
                            (robotat ?robot ?pma)
                            (premanipulationarea ?pma)
                            (not (= ?ap armtucked))
                        )
        :effect         (and
                            (not (robotarmposture ?arm ?ap))
                            (robotarmposture ?arm armtucked))
    )

    ;; untuck an arm, the robot should be in a premanipulationarea
    (:action untuck_arm
        :parameters (?robot - robot ?arm - arm ?pma - movearea ?ap - robotposture)
        :precondition   (and
                            (robotarmposture ?arm ?ap)
                            (robotat ?robot ?pma)
                            (premanipulationarea ?pma)
                            (not (= ?ap armuntucked))
                        )
        :effect         (and
                            (not (robotarmposture ?arm ?ap))
                            (robotarmposture ?arm armuntucked))
    )

    ;; move an arm to side, the robot should be in a premanipulationarea
    (:action move_arm_to_side
        :parameters (?robot - robot ?arm - arm ?pma - movearea ?ap - robotposture)
        :precondition   (and
                            (robotarmposture ?arm ?ap)
                            (robotat ?robot ?pma)
                            (premanipulationarea ?pma)
                            (not (= ?ap armtoside))
                        )
        :effect         (and
                            (not (robotarmposture ?arm ?ap))
                            (robotarmposture ?arm armtoside))
    )

    ;; move an arm to carry, the robot should be in a premanipulationarea
    (:action move_arm_to_carry
        :parameters (?robot - robot ?arm - arm ?pma - movearea ?ap - robotposture)
        :precondition   (and
                            (robotarmposture ?arm ?ap)
                            (armgripperposture ?arm gripperholding)
                            (robotat ?robot ?pma)
                            (premanipulationarea ?pma)
                            (not (= ?ap armtocarry))
                        )
        :effect         (and
                            (not (robotarmposture ?arm ?ap))
                            (robotarmposture ?arm armtocarry))
    )

    ;; move torso up/down/middle, the robot should be in a premanipulationarea
    (:action move_torso
        :parameters (?robot - robot ?pma - movearea ?tp ?ntp - robotposture)
        :precondition   (and
                            (robottorsoposture ?robot ?tp)
                            (torsoposture ?ntp)
                            (robotat ?robot ?pma)
                            (premanipulationarea ?pma)
                            (not (= ?tp ?ntp))
                        )
        :effect         (and
                            (not (robottorsoposture ?robot ?tp))
                            (robottorsoposture ?robot ?ntp))
    )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;(:action move_base
    ;;    :parameters (?robot - robot ?from ?to - movearea)
    ;;    :precondition   (and 
    ;;                        (premanipulationarea ?from)
    ;;                        (premanipulationarea ?to)
    ;;                        (robotat ?robot ?from)
    ;;                        ;(not (= ?from ?to))
    ;;                    )
    ;;    :effect         (and
    ;;                        (not (robotat ?robot ?from))
    ;;                        (robotat ?robot ?to))
    ;;)

    ;; move a robot when nothing is held by the robot,
    ;; so, torso is down and arms are tucked
    (:action move_base
        :parameters (?robot - robot ?from ?to - movearea)
        :precondition   (and 
                            (premanipulationarea ?from)
                            (premanipulationarea ?to)
                            (robotat ?robot ?from)
                            (robottorsoposture ?robot torsodown)
                            (armgripperposture leftarm gripperfree)
                            (armgripperposture rightarm gripperfree)
                            (robotarmposture leftarm armtucked)
                            (robotarmposture rightarm armtucked)
                            (not (= ?from ?to))
                        )
        :effect         (and
                            (not (robotat ?robot ?from))
                            (robotat ?robot ?to))
    )

    ;; move a robot when one arm holds an object, so, torso is middle, 
    ;; one arm is in carry and the other arm is tucked
    ;; leftarm holding an object
    (:action move_base
        :parameters (?robot - robot ?from ?to - movearea)
        :precondition   (and 
                            (premanipulationarea ?from)
                            (premanipulationarea ?to)
                            (robotat ?robot ?from)
                            (robottorsoposture ?robot torsomiddle)
                            (armgripperposture leftarm gripperholding)
                            (armgripperposture rightarm gripperfree)
                            (robotarmposture leftarm armtocarry)
                            (robotarmposture rightarm armtucked)
                            (not (= ?from ?to))
                        )
        :effect         (and
                            (not (robotat ?robot ?from))
                            (robotat ?robot ?to))
    )

    ;; rightarm holding an object
    (:action move_base
        :parameters (?robot - robot ?from ?to - movearea)
        :precondition   (and 
                            (premanipulationarea ?from)
                            (premanipulationarea ?to)
                            (robotat ?robot ?from)
                            (robottorsoposture ?robot torsomiddle)
                            (armgripperposture rightarm gripperholding)
                            (armgripperposture leftarm gripperfree)
                            (robotarmposture rightarm armtocarry)
                            (robotarmposture leftarm armtucked)
                            (not (= ?from ?to))
                        )
        :effect         (and
                            (not (robotat ?robot ?from))
                            (robotat ?robot ?to))
    )

    ;; move a robot when both arms hold an object, so, torso is middle,
    ;; and arms are in carry postures
    (:action move_base
        :parameters (?robot - robot ?from ?to - movearea)
        :precondition   (and 
                            (premanipulationarea ?from)
                            (premanipulationarea ?to)
                            (robotat ?robot ?from)
                            (robottorsoposture ?robot torsomiddle)
                            (armgripperposture leftarm gripperholding)
                            (armgripperposture rightarm gripperholding)
                            (robotarmposture leftarm armtocarry)
                            (robotarmposture rightarm armtocarry)
                            (not (= ?from ?to))
                        )
        :effect         (and
                            (not (robotat ?robot ?from))
                            (robotat ?robot ?to))
    )

    (:action move_blind
        :parameters (?robot - robot ?from ?to - movearea)
        :precondition   (and 
                            (premanipulationarea ?from)
                            (manipulationarea ?to)
                            (hasmanipulationarea ?from ?to)
                            (robotat ?robot ?from)
                        )
        :effect         (and
                            (not (robotat ?robot ?from))
                            (robotat ?robot ?to))
    )

    (:action move_blind
        :parameters (?robot - robot ?from ?to - movearea)
        :precondition   (and 
                            (manipulationarea ?from)
                            (premanipulationarea ?to)
                            (hasmanipulationarea ?to ?from)
                            (robotat ?robot ?from)
                        )
        :effect         (and
                            (not (robotat ?robot ?from))
                            (robotat ?robot ?to))
    )

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   (:action pick_up_from_table
        :parameters (?robot - robot ?arm - arm ?obj - kitchenware ?pa - placearea ?ma - movearea)
        :precondition   (and 
                            (objectat ?obj ?pa)
                            (reachable ?ma ?pa)
                            (robotat ?robot ?ma)
                            (robotarmposture ?arm armtoside)
                            (robottorsoposture ?robot torsoup)
                            (armgripperposture ?arm gripperfree)
                        )
        :effect         (and
                            (not (objectat ?obj ?pa))
                            (not (armgripperposture ?arm gripperfree))
                            (armholding ?arm ?obj)
                            (armgripperposture ?arm gripperholding))
    )

    (:action place_on_table
        :parameters (?robot - robot ?arm - arm ?obj - kitchenware ?pa - placearea ?ma - movearea)
        :precondition   (and
                            (armholding ?arm ?obj)
                            (robotat ?robot ?ma)
                            (reachable ?ma ?pa)
                            (robotarmposture ?arm armtoside)
                            (robottorsoposture ?robot torsoup)
                            (armgripperposture ?arm gripperholding)
                        )
        :effect         (and
                            (not (armholding ?arm ?obj))
                            (not (armgripperposture ?arm gripperholding))
                            (objectat ?obj ?pa)
                            (armgripperposture ?arm gripperfree))
    )

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   (:action pick_up_from_tray
        :parameters (?robot - robot ?arm - arm ?obj - kitchenware ?pa - placearea)
        :precondition   (and 
                            (objectat ?obj ?pa)
                            (tray ?pa)
                            (robotarmposture ?arm armtoside)
                            (robottorsoposture ?robot torsoup)
                            (armgripperposture ?arm gripperfree)
                        )
        :effect         (and
                            (not (objectat ?obj ?pa))
                            (not (armgripperposture ?arm gripperfree))
                            (armholding ?arm ?obj)
                            (armgripperposture ?arm gripperholding))
    )

    (:action place_on_tray
        :parameters (?robot - robot ?arm - arm ?obj - kitchenware ?pa - placearea)
        :precondition   (and
                            (armholding ?arm ?obj)
                            (tray ?pa)
                            (robotarmposture ?arm armtoside)
                            (robottorsoposture ?robot torsoup)
                            (armgripperposture ?arm gripperholding)
                        )
        :effect         (and
                            (not (armholding ?arm ?obj))
                            (not (armgripperposture ?arm gripperholding))
                            (objectat ?obj ?pa)
                            (armgripperposture ?arm gripperfree))
    )
)