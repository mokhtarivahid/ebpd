(robot_activity_schema
  (:domain race)
  (:method take_image_3        ;;; take_image_3(satellite0)
   :parameters  (?_G305)
   :abstract-plan
     ((!turn_to ?_G305 ?_G312 ?_G319) (((at_start(power_avail ?_G305)) (at_start(pointing ?_G305 ?_G319)) (throughout(direction ?_G312)) (throughout(direction ?_G319)) (throughout(satellite ?_G305)))-())
      (!switch_on ?_G333 ?_G305) (((at_start(power_avail ?_G305)) (throughout(instrument ?_G333)) (throughout(satellite ?_G305)) (throughout(on_board ?_G333 ?_G305)))-())
      (!calibrate ?_G305 ?_G333 ?_G312) (((at_start(power_avail ?_G305)) (throughout(direction ?_G312)) (throughout(instrument ?_G333)) (throughout(satellite ?_G305)) (throughout(on_board ?_G333 ?_G305)))-())
      (forall
      (!turn_to ?_G305 ?_G388 ?_G312) (((at_start(power_avail ?_G305)) (throughout(direction ?_G312)) (throughout(direction ?_G388)) (throughout(satellite ?_G305)))-())
      (!take_image ?_G305 ?_G388 ?_G333 ?_G430) (((at_start(power_avail ?_G305)) (throughout(direction ?_G388)) (throughout(instrument ?_G333)) (throughout(mode ?_G430)) (throughout(satellite ?_G305)) (throughout(on_board ?_G333 ?_G305)))-()))
      (!switch_off ?_G333 ?_G305) (((at_start(power_avail ?_G305)) (throughout(instrument ?_G333)) (throughout(satellite ?_G305)) (throughout(on_board ?_G333 ?_G305)))-())
      (!switch_on ?_G593 ?_G305) (((at_start(power_avail ?_G305)) (throughout(instrument ?_G593)) (throughout(satellite ?_G305)) (throughout(on_board ?_G593 ?_G305)))-())
      (!calibrate ?_G305 ?_G593 ?_G516) (((at_start(power_avail ?_G305)) (throughout(direction ?_G516)) (throughout(instrument ?_G593)) (throughout(satellite ?_G305)) (throughout(on_board ?_G593 ?_G305)))-())
      (forall
      (!turn_to ?_G305 ?_G648 ?_G516) (((at_start(power_avail ?_G305)) (throughout(direction ?_G516)) (throughout(direction ?_G648)) (throughout(satellite ?_G305)))-())
      (!take_image ?_G305 ?_G648 ?_G593 ?_G690) (((at_start(power_avail ?_G305)) (throughout(direction ?_G648)) (throughout(instrument ?_G593)) (throughout(mode ?_G690)) (throughout(satellite ?_G305)) (throughout(on_board ?_G593 ?_G305)))-()))
      )))