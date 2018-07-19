(robot_activity_schema
  (:domain race)
  (:method take_image        ;;; take_image(satellite0)
   :parameters  (?_G316)
   :abstract-plan
     ((!switch_on ?_G309 ?_G316) (((at_start(power_avail ?_G316)) (throughout(instrument ?_G309)) (throughout(satellite ?_G316)) (throughout(on_board ?_G309 ?_G316)))-())
      (!turn_to ?_G316 ?_G336 ?_G343) (((at_start(power_avail ?_G316)) (at_start(pointing ?_G316 ?_G343)) (throughout(direction ?_G336)) (throughout(direction ?_G343)) (throughout(satellite ?_G316)))-())
      (!calibrate ?_G316 ?_G309 ?_G336) (((at_start(power_avail ?_G316)) (throughout(direction ?_G336)) (throughout(instrument ?_G309)) (throughout(satellite ?_G316)) (throughout(on_board ?_G309 ?_G316)))-())
      (forall
      (!turn_to ?_G316 ?_G392 ?_G336) (((at_start(power_avail ?_G316)) (throughout(direction ?_G336)) (throughout(direction ?_G392)) (throughout(satellite ?_G316)))-())
      (!take_image ?_G316 ?_G392 ?_G309 ?_G434) (((at_start(power_avail ?_G316)) (throughout(direction ?_G392)) (throughout(instrument ?_G309)) (throughout(mode ?_G434)) (throughout(satellite ?_G316)) (throughout(on_board ?_G309 ?_G316)))-()))
      (!switch_off ?_G309 ?_G316) (((at_start(power_avail ?_G316)) (throughout(instrument ?_G309)) (throughout(satellite ?_G316)) (throughout(on_board ?_G309 ?_G316)))-())
      (!switch_on ?_G597 ?_G316) (((at_start(power_avail ?_G316)) (throughout(instrument ?_G597)) (throughout(satellite ?_G316)) (throughout(on_board ?_G597 ?_G316)))-())
      (!turn_to ?_G316 ?_G456 ?_G520) (((at_start(power_avail ?_G316)) (throughout(direction ?_G456)) (throughout(direction ?_G520)) (throughout(satellite ?_G316)))-())
      (!calibrate ?_G316 ?_G597 ?_G456) (((at_start(power_avail ?_G316)) (throughout(direction ?_G456)) (throughout(instrument ?_G597)) (throughout(satellite ?_G316)) (throughout(on_board ?_G597 ?_G316)))-())
      (forall
      (!turn_to ?_G316 ?_G680 ?_G456) (((at_start(power_avail ?_G316)) (throughout(direction ?_G456)) (throughout(direction ?_G680)) (throughout(satellite ?_G316)))-())
      (!take_image ?_G316 ?_G680 ?_G597 ?_G722) (((at_start(power_avail ?_G316)) (throughout(direction ?_G680)) (throughout(instrument ?_G597)) (throughout(mode ?_G722)) (throughout(satellite ?_G316)) (throughout(on_board ?_G597 ?_G316)))-()))
      )))