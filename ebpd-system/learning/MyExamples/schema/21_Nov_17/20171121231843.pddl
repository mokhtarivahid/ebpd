(robot_activity_schema
  (:domain race)
  (:method take_image        ;;; take_image(satellite0)
   :parameters  (?_G438)
   :abstract-plan
     ((!turn_to ?_G438 ?_G445 ?_G452) (((at_start(power_avail ?_G438)) (at_start(pointing ?_G438 ?_G452)) (throughout(direction ?_G445)) (throughout(direction ?_G452)) (throughout(satellite ?_G438)))-())
      (!switch_on ?_G466 ?_G438) (((at_start(power_avail ?_G438)) (throughout(instrument ?_G466)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!calibrate ?_G438 ?_G466 ?_G445) (((at_start(power_avail ?_G438)) (throughout(direction ?_G445)) (throughout(instrument ?_G466)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!turn_to ?_G438 ?_G521 ?_G445) (((at_start(power_avail ?_G438)) (throughout(direction ?_G445)) (throughout(direction ?_G521)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G521 ?_G466 ?_G563) (((at_start(power_avail ?_G438)) (throughout(direction ?_G521)) (throughout(instrument ?_G466)) (throughout(mode ?_G563)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!turn_to ?_G438 ?_G585 ?_G521) (((at_start(power_avail ?_G438)) (throughout(direction ?_G521)) (throughout(direction ?_G585)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G585 ?_G466 ?_G563) (((at_start(power_avail ?_G438)) (throughout(direction ?_G585)) (throughout(instrument ?_G466)) (throughout(mode ?_G563)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!turn_to ?_G438 ?_G649 ?_G585) (((at_start(power_avail ?_G438)) (throughout(direction ?_G585)) (throughout(direction ?_G649)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G649 ?_G466 ?_G691) (((at_start(power_avail ?_G438)) (throughout(direction ?_G649)) (throughout(instrument ?_G466)) (throughout(mode ?_G691)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!turn_to ?_G438 ?_G713 ?_G649) (((at_start(power_avail ?_G438)) (throughout(direction ?_G649)) (throughout(direction ?_G713)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G713 ?_G466 ?_G691) (((at_start(power_avail ?_G438)) (throughout(direction ?_G713)) (throughout(instrument ?_G466)) (throughout(mode ?_G691)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!turn_to ?_G438 ?_G777 ?_G713) (((at_start(power_avail ?_G438)) (throughout(direction ?_G713)) (throughout(direction ?_G777)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G777 ?_G466 ?_G563) (((at_start(power_avail ?_G438)) (throughout(direction ?_G777)) (throughout(instrument ?_G466)) (throughout(mode ?_G563)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!turn_to ?_G438 ?_G841 ?_G777) (((at_start(power_avail ?_G438)) (throughout(direction ?_G777)) (throughout(direction ?_G841)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G841 ?_G466 ?_G691) (((at_start(power_avail ?_G438)) (throughout(direction ?_G841)) (throughout(instrument ?_G466)) (throughout(mode ?_G691)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!turn_to ?_G438 ?_G905 ?_G841) (((at_start(power_avail ?_G438)) (throughout(direction ?_G841)) (throughout(direction ?_G905)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G905 ?_G466 ?_G691) (((at_start(power_avail ?_G438)) (throughout(direction ?_G905)) (throughout(instrument ?_G466)) (throughout(mode ?_G691)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!turn_to ?_G438 ?_G969 ?_G905) (((at_start(power_avail ?_G438)) (throughout(direction ?_G905)) (throughout(direction ?_G969)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G969 ?_G466 ?_G1011) (((at_start(power_avail ?_G438)) (throughout(direction ?_G969)) (throughout(instrument ?_G466)) (throughout(mode ?_G1011)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      (!turn_to ?_G438 ?_G1033 ?_G969) (((at_start(power_avail ?_G438)) (throughout(direction ?_G969)) (throughout(direction ?_G1033)) (throughout(satellite ?_G438)))-())
      (!take_image ?_G438 ?_G1033 ?_G466 ?_G691) (((at_start(power_avail ?_G438)) (throughout(direction ?_G1033)) (throughout(instrument ?_G466)) (throughout(mode ?_G691)) (throughout(satellite ?_G438)) (throughout(on_board ?_G466 ?_G438)))-())
      )))