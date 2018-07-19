(define (problem test01)
(:domain cafe)
(:init
    ;; area
    (premanipulationarea floorarea1)
    (premanipulationarea premanipulationareanorthtable1)
    (premanipulationarea premanipulationareasouthtable1)
    (premanipulationarea premanipulationareaeastcounter1)
    (premanipulationarea premanipulationareaeasttable2)
    (premanipulationarea premanipulationareawesttable2)

    (manipulationarea manipulationareanorthtable1)
    (manipulationarea manipulationareasouthtable1)
    (manipulationarea manipulationareaeasttable2)
    (manipulationarea manipulationareawesttable2)
    (manipulationarea manipulationareaeastcounter1)

    (placingarea placingareaeastrightcounter1)
    (placingarea placingareaeastlefttable1)
    (placingarea placingareaeastrighttable1)
    (placingarea placingareawestlefttable1)
    (placingarea placingareawestrighttable1)
    (placingarea placingareasouthlefttable2)
    (placingarea placingareasouthrighttable2)
    (placingarea placingareanorthlefttable2)
    (placingarea placingareanorthrighttable2)

    (rightplacingarea placingareaeastrightcounter1)
    (rightplacingarea placingareaeastrighttable1)
    (rightplacingarea placingareasouthrighttable2)
    (rightplacingarea placingareawestrighttable1)
    (rightplacingarea placingareanorthrighttable2)
    (leftplacingarea placingareaeastlefttable1)
    (leftplacingarea placingareasouthlefttable2)
    (leftplacingarea placingareawestlefttable1)
    (leftplacingarea placingareanorthlefttable2)

    (tray tray1)

    (sittingarea sittingareawesttable1)
    (sittingarea sittingareaeasttable1)
    (sittingarea sittingareanorthtable2)
    (sittingarea sittingareasouthtable2)

    ;; belonging area
    (hasmanipulationarea premanipulationareanorthtable1 manipulationareanorthtable1)
    (hasmanipulationarea premanipulationareasouthtable1 manipulationareasouthtable1)
    (hasmanipulationarea premanipulationareaeastcounter1 manipulationareaeastcounter1)
    (hasmanipulationarea premanipulationareaeasttable2 manipulationareaeasttable2)
    (hasmanipulationarea premanipulationareawesttable2 manipulationareawesttable2)

    ;; furnitures
    (table table1)
    (table table2)
    (counter counter1)

    ;; furnitures belongings
    (tablepremanipulationarea table1 premanipulationareanorthtable1)
    (tablepremanipulationarea table1 premanipulationareasouthtable1)
    (tablepremanipulationarea table2 premanipulationareaeasttable2)
    (tablepremanipulationarea table2 premanipulationareawesttable2)
    (tablepremanipulationarea counter1 premanipulationareaeastcounter1)

    (tablemanipulationarea table1 manipulationareanorthtable1)
    (tablemanipulationarea table1 manipulationareasouthtable1)
    (tablemanipulationarea table2 manipulationareaeasttable2)
    (tablemanipulationarea table1 manipulationareawesttable2)
    (tablemanipulationarea counter1 manipulationareaeastcounter1)

    (tableplacingarea table1 placingareaeastlefttable1)
    (tableplacingarea table1 placingareaeastrighttable1)
    (tableplacingarea table1 placingareawestlefttable1)
    (tableplacingarea table1 placingareawestrighttable1)
    (tableplacingarea table2 placingareasouthlefttable2)
    (tableplacingarea table2 placingareasouthrighttable2)
    (tableplacingarea table2 placingareanorthlefttable2)
    (tableplacingarea table2 placingareanorthrighttable2)
    (tableplacingarea counter1 placingareaeastrightcounter1)

    (tablesittingarea table1 sittingareawesttable1)
    (tablesittingarea table1 sittingareaeasttable1)
    (tablesittingarea table2 sittingareanorthtable2)
    (tablesittingarea table2 sittingareasouthtable2)

    ;; sittingarea belongings
    (hasleftplacingarea sittingareawesttable1 placingareawestlefttable1)
    (hasrightplacingarea sittingareawesttable1 placingareawestrighttable1)

    (hasleftplacingarea sittingareaeasttable1 placingareaeastlefttable1)
    (hasrightplacingarea sittingareaeasttable1 placingareaeastrighttable1)

    (hasleftplacingarea sittingareanorthtable2 placingareanorthlefttable2)
    (hasrightplacingarea sittingareanorthtable2 placingareanorthrighttable2)

    (hasleftplacingarea sittingareasouthtable2 placingareasouthlefttable2)
    (hasrightplacingarea sittingareasouthtable2 placingareasouthrighttable2)

    ;; guest / robot
    (guestat guest1 sittingareawesttable1)
    (robotat robot1 floorarea1)

    ;; belonging placingarea
    (hasleftplacingarea sittingareawesttable1 placingareawestlefttable1)
    (hasrightplacingarea sittingareawesttable1 placingareawestrighttable1)

    (hasleftplacingarea sittingareaeasttable1 placingareaeastlefttable1)
    (hasrightplacingarea sittingareaeasttable1 placingareaeastrighttable1)

    (hasleftplacingarea sittingareanorthtable2 placingareanorthlefttable2)
    (hasrightplacingarea sittingareanorthtable2 placingareanorthrighttable2)

    (hasleftplacingarea sittingareasouthtable2 placingareasouthlefttable2)
    (hasrightplacingarea sittingareasouthtable2 placingareasouthrighttable2)

    ;; reachable area
    (reachable manipulationareaeastcounter1 placingareaeastrightcounter1)
    (reachable manipulationareanorthtable1 placingareawestlefttable1)
    (reachable manipulationareanorthtable1 placingareaeastrighttable1)
    (reachable manipulationareasouthtable1 placingareawestrighttable1)
    (reachable manipulationareasouthtable1 placingareaeastlefttable1)
    (reachable manipulationareawesttable2 placingareasouthlefttable2)
    (reachable manipulationareawesttable2 placingareanorthrighttable2)
    (reachable manipulationareaeasttable2 placingareasouthrighttable2)
    (reachable manipulationareaeasttable2 placingareanorthlefttable2)

    ;; torso posture
    (torsoposture torsoup)
    (torsoposture torsodown)
    (torsoposture torsomiddle)

    ;; arm posture
    (armposture armtucked)
    (armposture armuntucked)
    (armposture armtoside)
    (armposture armtocarry)

    ;; gripper posture
    (gripperposture gripperfree)
    (gripperposture gripperholding)

    ;; belonging arm posture
    (robotarmposture arm1 armuntucked)

    ;; belonging torso posture
    (robottorsoposture robot1 torsoup)

    ;; belonging gripper posture
    (armgripperposture arm1 gripperfree)

    ;; object at
    (objectat mug1 placingareawestlefttable1)
    (objectat mug2 placingareawestlefttable1)
    (objectat mug3 placingareawestlefttable1)
    (objectat mug4 placingareawestlefttable1)
    (objectat mug5 placingareawestlefttable1)
    (objectat mug6 placingareawestlefttable1)

    (objectat plate1 placingareawestrighttable1)
    (objectat plate2 placingareawestrighttable1)
    (objectat plate3 placingareawestrighttable1)
    (objectat plate4 placingareawestrighttable1)
    (objectat plate5 placingareawestrighttable1)
    (objectat plate6 placingareawestrighttable1)
)
(:goal
  (and
    (objectat mug1 placingareaeastrightcounter1)
    (objectat mug2 placingareaeastrightcounter1)
)))
