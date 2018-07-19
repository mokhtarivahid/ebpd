(robot_activity_schema
  (:domain race)
  (:method take_image        ;;; take_image(instrument0)
   :parameters  (?_G300)
   :abstract-plan
     ((!switch_on ?_G300 ?_G307) (((at_start(power_avail ?_G307)) (throughout(instrument ?_G300)) (throughout(satellite ?_G307)) (throughout(on_board ?_G300 ?_G307)))-())
      (!turn_to ?_G307 ?_G327 ?_G334) (((at_start(power_avail ?_G307)) (throughout(direction ?_G327)) (throughout(direction ?_G334)) (throughout(satellite ?_G307)) (throughout(calibration_target ?_G300 ?_G327)) (throughout(on_board ?_G300 ?_G307)))-())
      (!calibrate ?_G307 ?_G300 ?_G327) (((at_start(power_avail ?_G307)) (throughout(direction ?_G327)) (throughout(instrument ?_G300)) (throughout(satellite ?_G307)) (throughout(calibration_target ?_G300 ?_G327)) (throughout(on_board ?_G300 ?_G307)))-())
      (!turn_to ?_G307 ?_G334 ?_G327) (((at_start(power_avail ?_G307)) (throughout(direction ?_G327)) (throughout(direction ?_G334)) (throughout(satellite ?_G307)) (throughout(calibration_target ?_G300 ?_G327)) (throughout(on_board ?_G300 ?_G307)))-())
      (!take_image ?_G307 ?_G334 ?_G300 ?_G425) (((at_start(power_avail ?_G307)) (throughout(direction ?_G334)) (throughout(instrument ?_G300)) (throughout(mode ?_G425)) (throughout(satellite ?_G307)) (throughout(on_board ?_G300 ?_G307)) (throughout(supports ?_G300 ?_G425)))-())
      (forall
      (!turn_to ?_G307 ?_G447 ?_G334) (((at_start(power_avail ?_G307)) (throughout(direction ?_G334)) (throughout(direction ?_G447)) (throughout(satellite ?_G307)) (throughout(on_board ?_G300 ?_G307)))-())
      (!take_image ?_G307 ?_G447 ?_G300 ?_G425) (((at_start(power_avail ?_G307)) (throughout(direction ?_G447)) (throughout(instrument ?_G300)) (throughout(mode ?_G425)) (throughout(satellite ?_G307)) (throughout(on_board ?_G300 ?_G307)) (throughout(supports ?_G300 ?_G425)))-()))
      )))