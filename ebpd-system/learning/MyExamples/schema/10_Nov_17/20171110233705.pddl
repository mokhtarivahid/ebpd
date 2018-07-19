(robot_activity_schema
  (:domain race)
  (:method take_image        ;;; take_image(satellite0)
   :parameters  (?_G237)
   :abstract-plan
     ((!switch_on ?_G230 ?_G237) (((at_start(power_avail ?_G237)) (throughout(instrument ?_G230)) (throughout(satellite ?_G237)) (throughout(on_board ?_G230 ?_G237)))-())
      (!turn_to ?_G237 ?_G257 ?_G264) (((at_start(power_avail ?_G237)) (at_start(pointing ?_G237 ?_G264)) (throughout(direction ?_G257)) (throughout(direction ?_G264)) (throughout(satellite ?_G237)))-())
      (!calibrate ?_G237 ?_G230 ?_G257) (((at_start(power_avail ?_G237)) (throughout(direction ?_G257)) (throughout(instrument ?_G230)) (throughout(satellite ?_G237)) (throughout(on_board ?_G230 ?_G237)))-())
      (!turn_to ?_G237 ?_G313 ?_G257) (((at_start(power_avail ?_G237)) (throughout(direction ?_G257)) (throughout(direction ?_G313)) (throughout(satellite ?_G237)))-())
      (!take_image ?_G237 ?_G313 ?_G230 ?_G355) (((at_start(power_avail ?_G237)) (throughout(direction ?_G313)) (throughout(instrument ?_G230)) (throughout(mode ?_G355)) (throughout(satellite ?_G237)) (throughout(on_board ?_G230 ?_G237)))-())
      (!turn_to ?_G237 ?_G377 ?_G313) (((at_start(power_avail ?_G237)) (throughout(direction ?_G313)) (throughout(direction ?_G377)) (throughout(satellite ?_G237)))-())
      (!take_image ?_G237 ?_G377 ?_G230 ?_G355) (((at_start(power_avail ?_G237)) (throughout(direction ?_G377)) (throughout(instrument ?_G230)) (throughout(mode ?_G355)) (throughout(satellite ?_G237)) (throughout(on_board ?_G230 ?_G237)))-())
      (!turn_to ?_G237 ?_G441 ?_G377) (((at_start(power_avail ?_G237)) (throughout(direction ?_G377)) (throughout(direction ?_G441)) (throughout(satellite ?_G237)))-())
      (!take_image ?_G237 ?_G441 ?_G230 ?_G355) (((at_start(power_avail ?_G237)) (throughout(direction ?_G441)) (throughout(instrument ?_G230)) (throughout(mode ?_G355)) (throughout(satellite ?_G237)) (throughout(on_board ?_G230 ?_G237)))-())
      (!turn_to ?_G237 ?_G505 ?_G441) (((at_start(power_avail ?_G237)) (throughout(direction ?_G441)) (throughout(direction ?_G505)) (throughout(satellite ?_G3)))-())
      (!take_image ?_G3 ?_G10 ?_G2 ?_G11) (((at_start(power_avail ?_G3)) (throughout(direction ?_G10)) (throughout(instrument ?_G2)) (throughout(mode ?_G11)) (throughout(satellite ?_G3)) (throughout(on_board ?_G2 ?_G3)))-())
      )))