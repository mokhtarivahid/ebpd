(robot_activity_schema
  (:domain race)
  (:method take_image2        ;;; take_image2(satellite0)
   :parameters  (?_G233)
   :abstract-plan
     ((!switch_on ?_G226 ?_G233) (((at_start(power_avail ?_G233)) (throughout(instrument ?_G226)) (throughout(satellite ?_G233)) (throughout(on_board ?_G226 ?_G233)))-())
      (!calibrate ?_G3 ?_G2 ?_G4) (((at_start(power_avail ?_G3)) (at_start(pointing ?_G3 ?_G4)) (throughout(direction ?_G4)) (throughout(instrument ?_G2)) (throughout(satellite ?_G3)) (throughout(on_board ?_G2 ?_G3)))-())
      (!turn_to ?_G3 ?_G5 ?_G4) (((at_start(power_avail ?_G3)) (at_start(pointing ?_G3 ?_G4)) (throughout(direction ?_G4)) (throughout(direction ?_G5)) (throughout(satellite ?_G3)))-())
      (!take_image ?_G3 ?_G5 ?_G2 ?_G6) (((at_start(power_avail ?_G3)) (throughout(direction ?_G5)) (throughout(instrument ?_G2)) (throughout(mode ?_G6)) (throughout(satellite ?_G3)) (throughout(on_board ?_G2 ?_G3)))-())
      (!turn_to ?_G3 ?_G7 ?_G5) (((at_start(power_avail ?_G3)) (throughout(direction ?_G5)) (throughout(direction ?_G7)) (throughout(satellite ?_G3)))-())
      (!take_image ?_G3 ?_G7 ?_G2 ?_G6) (((at_start(power_avail ?_G3)) (throughout(direction ?_G7)) (throughout(instrument ?_G2)) (throughout(mode ?_G6)) (throughout(satellite ?_G3)) (throughout(on_board ?_G2 ?_G3)))-())
      (!turn_to ?_G3 ?_G8 ?_G7) (((at_start(power_avail ?_G3)) (throughout(direction ?_G7)) (throughout(direction ?_G8)) (throughout(satellite ?_G3)))-())
      (!take_image ?_G3 ?_G8 ?_G2 ?_G6) (((at_start(power_avail ?_G3)) (throughout(direction ?_G8)) (throughout(instrument ?_G2)) (throughout(mode ?_G6)) (throughout(satellite ?_G3)) (throughout(on_board ?_G2 ?_G3)))-())
      (!turn_to ?_G3 ?_G9 ?_G8) (((at_start(power_avail ?_G3)) (throughout(direction ?_G8)) (throughout(direction ?_G9)) (throughout(satellite ?_G3)))-())
      (!take_image ?_G3 ?_G9 ?_G2 ?_G10) (((at_start(power_avail ?_G3)) (throughout(direction ?_G9)) (throughout(instrument ?_G2)) (throughout(mode ?_G10)) (throughout(satellite ?_G3)) (throughout(on_board ?_G2 ?_G3)))-())
      )))