(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(p1,p2)
   :parameters  (?_G826 ?_G2274)
   :abstract-plan
     ((!unstack ?_G812 ?_G855 ?_G862 ?_G826) (((at_start(empty ?_G812)) (throughout(block ?_G855)) (throughout(block ?_G862)) (throughout(pile ?_G826)) (throughout(red ?_G855)) (throughout(red ?_G862)))-())
      (forall
      (!put ?_G812 ?_G855 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G855)) (throughout(red ?_G855)) (throughout(table ?_G819)))-())
      (!unstack ?_G812 ?_G862 ?_G1014 ?_G826) (((at_start(empty ?_G812)) (throughout(block ?_G862)) (throughout(block ?_G1014)) (throughout(pile ?_G826)) (throughout(red ?_G862)) (throughout(red ?_G1014)))-()))
      (!put ?_G812 ?_G1166 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G1166)) (throughout(red ?_G1166)) (throughout(table ?_G819)))-())
      (!unstack ?_G812 ?_G1318 ?_G1470 ?_G826) (((at_start(empty ?_G812)) (throughout(block ?_G1318)) (throughout(block ?_G1470)) (throughout(blue ?_G1470)) (throughout(pile ?_G826)) (throughout(red ?_G1318)))-())
      (!put ?_G812 ?_G1318 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G1318)) (throughout(red ?_G1318)) (throughout(table ?_G819)))-())
      (!unstack ?_G812 ?_G1470 ?_G1622 ?_G826) (((at_start(empty ?_G812)) (throughout(block ?_G1470)) (throughout(block ?_G1622)) (throughout(blue ?_G1470)) (throughout(blue ?_G1622)) (throughout(pile ?_G826)))-())
      (forall
      (!put ?_G812 ?_G1470 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G1470)) (throughout(blue ?_G1470)) (throughout(table ?_G819)))-())
      (!unstack ?_G812 ?_G1622 ?_G1774 ?_G826) (((at_start(empty ?_G812)) (throughout(block ?_G1622)) (throughout(block ?_G1774)) (throughout(blue ?_G1622)) (throughout(blue ?_G1774)) (throughout(pile ?_G826)))-()))
      (!put ?_G812 ?_G1926 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G1926)) (throughout(blue ?_G1926)) (throughout(table ?_G819)))-())
      (!unstack ?_G812 ?_G2078 ?_G2230 ?_G826) (((at_goal(top ?_G2230 ?_G826)) (at_start(empty ?_G812)) (throughout(block ?_G2078)) (throughout(blue ?_G2078)) (throughout(pallet ?_G2230)) (throughout(pile ?_G826)))-())
      (!stack ?_G812 ?_G2078 ?_G2310 ?_G2274) (((at_start(empty ?_G812)) (at_start(top ?_G2310 ?_G2274)) (throughout(block ?_G2078)) (throughout(blue ?_G2078)) (throughout(pallet ?_G2310)) (throughout(pile ?_G2274)))-())
      (!pick ?_G812 ?_G1926 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G1926)) (throughout(blue ?_G1926)) (throughout(table ?_G819)))-())
      (forall
      (!stack ?_G812 ?_G1926 ?_G2078 ?_G2274) (((at_start(empty ?_G812)) (throughout(block ?_G1926)) (throughout(block ?_G2078)) (throughout(blue ?_G1926)) (throughout(blue ?_G2078)) (throughout(pile ?_G2274)))-())
      (!pick ?_G812 ?_G1774 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G1774)) (throughout(blue ?_G1774)) (throughout(table ?_G819)))-()))
      (!stack ?_G812 ?_G1470 ?_G1622 ?_G2274) (((at_start(empty ?_G812)) (throughout(block ?_G1470)) (throughout(block ?_G1622)) (throughout(blue ?_G1470)) (throughout(blue ?_G1622)) (throughout(pile ?_G2274)))-())
      (!pick ?_G812 ?_G1318 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G1318)) (throughout(red ?_G1318)) (throughout(table ?_G819)))-())
      (!stack ?_G812 ?_G1318 ?_G1470 ?_G2274) (((at_start(empty ?_G812)) (throughout(block ?_G1318)) (throughout(block ?_G1470)) (throughout(blue ?_G1470)) (throughout(pile ?_G2274)) (throughout(red ?_G1318)))-())
      (forall
      (!pick ?_G812 ?_G1166 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G1166)) (throughout(red ?_G1166)) (throughout(table ?_G819)))-())
      (!stack ?_G812 ?_G1166 ?_G1318 ?_G2274) (((at_start(empty ?_G812)) (throughout(block ?_G1166)) (throughout(block ?_G1318)) (throughout(pile ?_G2274)) (throughout(red ?_G1166)) (throughout(red ?_G1318)))-()))
      (!pick ?_G812 ?_G855 ?_G819) (((at_start(empty ?_G812)) (throughout(block ?_G855)) (throughout(red ?_G855)) (throughout(table ?_G819)))-())
      (!stack ?_G812 ?_G855 ?_G862 ?_G2274) (((at_start(empty ?_G812)) (throughout(block ?_G855)) (throughout(block ?_G862)) (throughout(pile ?_G2274)) (throughout(red ?_G855)) (throughout(red ?_G862)))-())
      )))