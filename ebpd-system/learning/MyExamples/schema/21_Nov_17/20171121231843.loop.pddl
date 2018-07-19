(robot_activity_schema
  (:domain race)
  (:method take_image        ;;; take_image(satellite0)
   :parameters  (?_G438)
   :abstract-plan
     ((!turn_to ?_G438 ?_G445 ?_G452) (((at_start(power_avail ?_G438)) (at_start(pointing ?_G438 ?_G452)) (throughout(direction ?_G445)) (throughout(direction ?_G452)) (throughout(satellite ?_G438)))-())
      (!switch_on ?_G466 ?_G438) (((at_start(power_avail ?_G438)) (throughout(instrument ?_G466)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!calibrate ?_G438 ?_G466 ?_G445) (((at_start(power_avail ?_G438)) (throughout(direction ?_G445)) (throughout(instrument ?_G466)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (forall
      (!turn_to ?_G438 ?_G521 ?_G445) (((at_start(power_avail ?_G438)) (throughout(direction ?_G445)) (throughout(direction ?_G521)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G521 ?_G466 ?_G563) (((at_start(power_avail ?_G438)) (throughout(direction ?_G521)) (throughout(instrument ?_G466)) (throughout(mode ?_G563)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-()))
      )))