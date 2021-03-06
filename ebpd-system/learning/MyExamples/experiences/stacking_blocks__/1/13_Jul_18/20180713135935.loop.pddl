(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(t1,p1)
   :parameters  (?_G570 ?_G606)
   :abstract-plan
     ((!pick ?_G556 ?_G563 ?_G570) (((at_start(ontable ?_G563 ?_G570)) (throughout(block ?_G563)) (throughout(blue ?_G563)) (throughout(table ?_G570)))-())
      (!stack ?_G556 ?_G563 ?_G642 ?_G606) (((at_start(ontable ?_G563 ?_G570)) (at_start(top ?_G642 ?_G606)) (throughout(block ?_G563)) (throughout(blue ?_G563)) (throughout(pallet ?_G642)) (throughout(pile ?_G606)))-())
      (forall
      (!pick ?_G556 ?_G715 ?_G570) (((at_start(ontable ?_G715 ?_G570)) (throughout(block ?_G715)) (throughout(blue ?_G715)) (throughout(table ?_G570)))-())
      (!stack ?_G556 ?_G715 ?_G563 ?_G606) (((at_start(ontable ?_G563 ?_G570)) (at_start(ontable ?_G715 ?_G570)) (throughout(block ?_G563)) (throughout(block ?_G715)) (throughout(blue ?_G563)) (throughout(blue ?_G715)) (throughout(pile ?_G606)))-()))
      (!pick ?_G556 ?_G1323 ?_G570) (((at_start(ontable ?_G1323 ?_G570)) (throughout(block ?_G1323)) (throughout(red ?_G1323)) (throughout(table ?_G570)))-())
      (!stack ?_G556 ?_G1323 ?_G1171 ?_G606) (((at_start(ontable ?_G1171 ?_G570)) (at_start(ontable ?_G1323 ?_G570)) (throughout(block ?_G1171)) (throughout(block ?_G1323)) (throughout(blue ?_G1171)) (throughout(pile ?_G606)) (throughout(red ?_G1323)))-())
      (forall
      (!pick ?_G556 ?_G1475 ?_G570) (((at_start(ontable ?_G1475 ?_G570)) (throughout(block ?_G1475)) (throughout(red ?_G1475)) (throughout(table ?_G570)))-())
      (!stack ?_G556 ?_G1475 ?_G1323 ?_G606) (((at_start(ontable ?_G1323 ?_G570)) (at_start(ontable ?_G1475 ?_G570)) (throughout(block ?_G1323)) (throughout(block ?_G1475)) (throughout(pile ?_G606)) (throughout(red ?_G1323)) (throughout(red ?_G1475)))-()))
      (!pick ?_G556 ?_G1931 ?_G570) (((at_goal(top ?_G1931 ?_G606)) (at_start(ontable ?_G1931 ?_G570)) (throughout(block ?_G1931)) (throughout(red ?_G1931)) (throughout(table ?_G570)))-())
      (!stack ?_G556 ?_G1931 ?_G1779 ?_G606) (((at_goal(top ?_G1931 ?_G606)) (at_start(ontable ?_G1779 ?_G570)) (at_start(ontable ?_G1931 ?_G570)) (throughout(block ?_G1779)) (throughout(block ?_G1931)) (throughout(pile ?_G606)) (throughout(red ?_G1779)) (throughout(red ?_G1931)))-())
      )))