(robot_activity_schema
  (:domain race)
  (:method take_image        ;;; take_image(instrument0)
   :parameters  (?_G195)
   :abstract-plan
     ((!switch_on ?_G195 ?_G202) (((at_start(power_avail ?_G202)) (throughout(on_board ?_G195 ?_G202)))-())
      (!turn_to ?_G202 ?_G222 ?_G229) (((at_start(power_avail ?_G202)) (throughout(calibration_target ?_G195 ?_G222)) (throughout(on_board ?_G195 ?_G202)))-())
      (!calibrate ?_G202 ?_G195 ?_G222) (((at_start(power_avail ?_G202)) (throughout(calibration_target ?_G195 ?_G222)) (throughout(on_board ?_G195 ?_G202)))-())
      (!turn_to ?_G202 ?_G278 ?_G222) (((at_start(power_avail ?_G202)) (throughout(calibration_target ?_G195 ?_G222)) (throughout(on_board ?_G195 ?_G202)))-())
      (!take_image ?_G202 ?_G278 ?_G195 ?_G320) (((at_start(power_avail ?_G202)) (throughout(on_board ?_G195 ?_G202)) (throughout(supports ?_G195 ?_G320)))-())
      (forall
      (!turn_to ?_G202 ?_G342 ?_G278) (((at_start(power_avail ?_G202)) (throughout(on_board ?_G195 ?_G202)))-())
      (!take_image ?_G202 ?_G342 ?_G195 ?_G320) (((at_start(power_avail ?_G202)) (throughout(on_board ?_G195 ?_G202)) (throughout(supports ?_G195 ?_G320)))-()))
      )))