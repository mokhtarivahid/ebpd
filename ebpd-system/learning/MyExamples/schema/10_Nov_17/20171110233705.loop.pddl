(robot_activity_schema
  (:domain race)
  (:method take_image        ;;; take_image(satellite0)
   :parameters  (?_G3)
   :abstract-plan
     ((!switch_on ?_G2 ?_G3) (((at_start(power_avail ?_G3)) (throughout(instrument ?_G2)) (throughout(satellite ?_G3)) (throughout(on_board ?_G2 ?_G3)))-())
      (!turn_to ?_G3 ?_G4 ?_G5) (((at_start(power_avail ?_G3)) (at_start(pointing ?_G3 ?_G5)) (throughout(direction ?_G4)) (throughout(direction ?_G5)) (throughout(satellite ?_G3)))-())
      (!calibrate ?_G3 ?_G2 ?_G4) (((at_start(power_avail ?_G3)) (throughout(direction ?_G4)) (throughout(instrument ?_G2)) (throughout(satellite ?_G3)) (throughout(on_board ?_G2 ?_G3)))-())
      (forall
      (!turn_to ?_G3 ?_G6 ?_G4) (((at_start(power_avail ?_G3)) (throughout(direction ?_G4)) (throughout(direction ?_G6)) (throughout(satellite ?_G3)))-())
      (!take_image ?_G3 ?_G6 ?_G2 ?_G7) (((at_start(power_avail ?_G3)) (throughout(direction ?_G6)) (throughout(instrument ?_G2)) (throughout(mode ?_G7)) (throughout(satellite ?_G3)) (throughout(on_board ?_G2 ?_G3)))-()))
      )))