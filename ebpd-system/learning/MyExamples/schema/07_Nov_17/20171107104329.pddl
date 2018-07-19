(robot_activity_schema
  (:domain race)
  (:method take_image        ;;; take_image(instrument0)
   :parameters  (?_G195)
   :abstract-plan
     ((!switch_on ?_G195) (()-())
      (!calibrate ?_G195 ?_G222) (((throughout(calibration_target ?_G195 ?_G222)))-())
      (!take_image ?_G278 ?_G195 ?_G320) (((throughout(supports ?_G195 ?_G320)))-())
      (!take_image ?_G342 ?_G195 ?_G320) (((throughout(supports ?_G195 ?_G320)))-())
      (!take_image ?_G406 ?_G195 ?_G320) (((throughout(supports ?_G195 ?_G320)))-())
      (!take_image ?_G470 ?_G195 ?_G512) (((throughout(supports ?_G195 ?_G512)))-())
      )))