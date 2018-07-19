(robot_activity_schema
  (:domain race)
  (:method take_image        ;;; take_image(instrument0)
   :parameters  (?_G195)
   :abstract-plan
     ((!switch_on ?_G195) (()-())
      (!calibrate ?_G195 ?_G222) (((throughout(calibration_target ?_G195 ?_G222)))-())
      (forall
      (!take_image ?_G278 ?_G195 ?_G320) (((throughout(supports ?_G195 ?_G320)))-()))
      )))