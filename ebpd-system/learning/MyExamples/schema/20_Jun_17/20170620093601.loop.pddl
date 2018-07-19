(robot_activity_schema
  (:domain race)
  (:method clear        ;;; clear(table1,counter1)
   :parameters  (?_G12 ?_G13)
   :abstract-plan
     ((!move ?_G2 ?_G3) (((throughout(premanipulationarea ?_G2)) (throughout(premanipulationarea ?_G3)) (throughout(tablepremanipulationarea ?_G12 ?_G3)))-())
      (!move ?_G3 ?_G4) (((throughout(manipulationarea ?_G4)) (throughout(premanipulationarea ?_G3)) (throughout(tablemanipulationarea ?_G12 ?_G4)) (throughout(tablepremanipulationarea ?_G12 ?_G3)))-())
      (forall
      (!pick ?_G5 ?_G6) (((throughout(leftplacingarea ?_G6)) (throughout(placingarea ?_G6)) (throughout(tableplacingarea ?_G12 ?_G6)))-())
      (!place ?_G5 ?_G7) (((throughout(tray ?_G7)))-()))
      (!move ?_G4 ?_G3) (((throughout(manipulationarea ?_G4)) (throughout(premanipulationarea ?_G3)) (throughout(tablemanipulationarea ?_G12 ?_G4)) (throughout(tablepremanipulationarea ?_G12 ?_G3)))-())
      (!move ?_G3 ?_G9) (((throughout(premanipulationarea ?_G3)) (throughout(premanipulationarea ?_G9)) (throughout(tablepremanipulationarea ?_G12 ?_G3)) (throughout(tablepremanipulationarea ?_G13 ?_G9)))-())
      (!move ?_G9 ?_G10) (((throughout(manipulationarea ?_G10)) (throughout(premanipulationarea ?_G9)) (throughout(tablemanipulationarea ?_G13 ?_G10)) (throughout(tablepremanipulationarea ?_G13 ?_G9)))-())
      (forall
      (!pick ?_G8 ?_G7) (((throughout(tray ?_G7)))-())
      (!place ?_G8 ?_G11) (((throughout(placingarea ?_G11)) (throughout(rightplacingarea ?_G11)) (throughout(tableplacingarea ?_G13 ?_G11)))-()))
      )))