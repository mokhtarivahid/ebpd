(define (domain cafe)
 (:requirements :strips :typing)
 (:types area placingarea robot arm kitchenware furniture robotposture)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (:constants 
    floorarea1 manipulationareanorthtable1 manipulationareasouthtable1 manipulationareaeasttable2 manipulationareawesttable2 manipulationareaeastcounter1 premanipulationareanorthtable1 premanipulationareasouthtable1 premanipulationareaeastcounter1 premanipulationareaeasttable2 premanipulationareawesttable2 - area
    placingareaeastrightcounter1 placingareaeastrighttable1 placingareaeastlefttable1 placingareasouthrighttable2 placingareasouthlefttable2 placingareawestlefttable1 placingareawestrighttable1 placingareanorthrighttable2 placingareanorthlefttable2 - placingarea
    pr2 - robot
    leftarm rightarm - arm
    mug1 mug2 mug3 mug4 mug5 mug6 plate1 plate2 plate3 plate4 plate5 plate6 - kitchenware
    counter1 table1 table2 - furniture
    armtucked armuntucked armtoside armtocarry torsoup torsodown torsomiddle gripperfree gripperholding - robotposture
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (:predicates    
    (premanipulationarea ?pma - area)
    (manipulationarea ?ma - area)
    (hasmanipulationarea ?pma ?ma - area)

    (table ?t - furniture)
    (counter ?c - furniture)

    (robotat ?robot - robot ?at - area)

    (objectat ?obj - kitchenware ?pa - placingarea)
    (reachable ?ma - area ?pa - placingarea)

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

    (:action tuck_arm
        :parameters (?arm - arm ?ap - robotposture)
        :precondition   (and
                            (robotarmposture ?arm ?ap)
                            ;(not (= ?ap armtucked))
                        )
        :effect         (and
                            (not (robotarmposture ?arm ?ap))
                            (robotarmposture ?arm armtucked))
    )

    (:action untuck_arm
        :parameters (?arm - arm ?ap - robotposture)
        :precondition   (and
                            (robotarmposture ?arm ?ap)
                            ;(not (= ?ap armuntucked))
                        )
        :effect         (and
                            (not (robotarmposture ?arm ?ap))
                            (robotarmposture ?arm armuntucked))
    )

    (:action move_arm_to_side
        :parameters (?arm - arm ?ap - robotposture)
        :precondition   (and
                            (robotarmposture ?arm ?ap)
                            ;(not (= ?ap armtoside))
                        )
        :effect         (and
                            (not (robotarmposture ?arm ?ap))
                            (robotarmposture ?arm armtoside))
    )

    (:action move_arm_to_carry
        :parameters (?arm - arm ?ap - robotposture)
        :precondition   (and
                            (robotarmposture ?arm ?ap)
                            (armgripperposture ?arm gripperholding)
                            ;(not (= ?ap armtocarry)
                        )
        :effect         (and
                            (not (robotarmposture ?arm ?ap))
                            (robotarmposture ?arm armtocarry))
    )

    (:action move_torso
        :parameters (?robot - robot ?tp ?ntp - robotposture)
        :precondition   (and
                            (robottorsoposture ?robot ?tp)
                            (torsoposture ?ntp)
                            ;(not (= ?tp ?ntp))
                        )
        :effect         (and
                            (not (robottorsoposture ?robot ?tp))
                            (robottorsoposture ?robot ?ntp))
    )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;(:action move_base
    ;;    :parameters (?robot - robot ?from ?to - area)
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
        :parameters (?robot - robot ?arm1 ?arm2 - arm ?from ?to - area)
        :precondition   (and 
                            (premanipulationarea ?from)
                            (premanipulationarea ?to)
                            (robotat ?robot ?from)
                            (robottorsoposture ?robot torsodown)
                            (armgripperposture ?arm1 gripperfree)
                            (armgripperposture ?arm2 gripperfree)
                            (robotarmposture ?arm1 armtucked)
                            (robotarmposture ?arm2 armtucked)
                            (not (= ?arm1 ?arm2))
                            (not (= ?from ?to))
                        )
        :effect         (and
                            (not (robotat ?robot ?from))
                            (robotat ?robot ?to))
    )

    ;; move a robot when one arm holds an object, so, torso is middle, 
    ;; one arm is in carry and the other arm is tucked
    (:action move_base
        :parameters (?robot - robot ?arm1 ?arm2 - arm ?from ?to - area)
        :precondition   (and 
                            (premanipulationarea ?from)
                            (premanipulationarea ?to)
                            (robotat ?robot ?from)
                            (robottorsoposture ?robot torsomiddle)
                            (armgripperposture ?arm1 gripperholding)
                            (armgripperposture ?arm2 gripperfree)
                            (robotarmposture ?arm1 armtocarry)
                            (robotarmposture ?arm2 armtucked)
                            (not (= ?arm1 ?arm2))
                            (not (= ?from ?to))
                        )
        :effect         (and
                            (not (robotat ?robot ?from))
                            (robotat ?robot ?to))
    )

    ;; move a robot when both arms hold an object, so, torso is middle,
    ;; and arms are in carry postures
    (:action move_base
        :parameters (?robot - robot ?arm1 ?arm2 - arm ?from ?to - area)
        :precondition   (and 
                            (premanipulationarea ?from)
                            (premanipulationarea ?to)
                            (robotat ?robot ?from)
                            (robottorsoposture ?robot torsomiddle)
                            (armgripperposture ?arm1 gripperholding)
                            (armgripperposture ?arm2 gripperholding)
                            (robotarmposture ?arm1 armtocarry)
                            (robotarmposture ?arm2 armtocarry)
                            (not (= ?arm1 ?arm2))
                            (not (= ?from ?to))
                        )
        :effect         (and
                            (not (robotat ?robot ?from))
                            (robotat ?robot ?to))
    )

    (:action move_blind
        :parameters (?robot - robot ?from ?to - area)
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
        :parameters (?robot - robot ?from ?to - area)
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

   (:action pick_up_object
        :parameters (?robot - robot ?arm - arm ?obj - kitchenware ?pa - placingarea ?ma - area)
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

    (:action place_object
        :parameters (?robot - robot ?arm - arm ?obj - kitchenware ?pa - placingarea ?ma - area)
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
)