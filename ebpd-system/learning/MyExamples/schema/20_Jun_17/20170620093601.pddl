(robot_activity_schema
  (:domain race)
  (:method clear        ;;; clear(table1,counter1)
   :parameters  (?_G5492 ?_G5493)
   :abstract-plan
     ((!move ?_G1030 ?_G1102) (((throughout(premanipulationarea ?_G1030)) (throughout(premanipulationarea ?_G1102)) (throughout(tablepremanipulationarea ?_G5492 ?_G1102)))-())
      (!move ?_G1102 ?_G1202) (((throughout(manipulationarea ?_G1202)) (throughout(premanipulationarea ?_G1102)) (throughout(tablemanipulationarea ?_G5492 ?_G1202)) (throughout(tablepremanipulationarea ?_G5492 ?_G1102)))-())
      (!pick ?_G1230 ?_G1237) (((throughout(leftplacingarea ?_G1237)) (throughout(placingarea ?_G6)) (throughout(tableplacingarea ?_G12 ?_G6)))-())
      (!place ?_G5 ?_G7) (((throughout(tray ?_G7)))-())
      (!pick ?_G8 ?_G6) (((throughout(leftplacingarea ?_G6)) (throughout(placingarea ?_G6)) (throughout(tableplacingarea ?_G12 ?_G6)))-())
      (!place ?_G8 ?_G7) (((throughout(tray ?_G7)))-())
      (!move ?_G4 ?_G3) (((throughout(manipulationarea ?_G4)) (throughout(premanipulationarea ?_G3)) (throughout(tablemanipulationarea ?_G12 ?_G4)) (throughout(tablepremanipulationarea ?_G12 ?_G3)))-())
      (!move ?_G3 ?_G9) (((throughout(premanipulationarea ?_G3)) (throughout(premanipulationarea ?_G9)) (throughout(tablepremanipulationarea ?_G12 ?_G3)) (throughout(tablepremanipulationarea ?_G13 ?_G9)))-())
      (!move ?_G9 ?_G10) (((throughout(manipulationarea ?_G10)) (throughout(premanipulationarea ?_G9)) (throughout(tablemanipulationarea ?_G13 ?_G10)) (throughout(tablepremanipulationarea ?_G13 ?_G9)))-())
      (!pick ?_G8 ?_G7) (((throughout(tray ?_G7)))-())
      (!place ?_G8 ?_G11) (((throughout(placingarea ?_G11)) (throughout(rightplacingarea ?_G11)) (throughout(tableplacingarea ?_G13 ?_G11)))-())
      (!pick ?_G5 ?_G7) (((throughout(tray ?_G7)))-())
      (!place ?_G5 ?_G11) (((throughout(placingarea ?_G11)) (throughout(rightplacingarea ?_G11)) (throughout(tableplacingarea ?_G13 ?_G11)))-())
      )))