(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(p1,p2)
   :parameters  (?_G811 ?_G2259)
   :abstract-plan
     ((!unstack ?_G797 ?_G840 ?_G847 ?_G811) (((throughout(block ?_G840)) (throughout(block ?_G847)) (throughout(pile ?_G811)) (throughout(red ?_G840)) (throughout(red ?_G847)))-())
      (forall
      (!put ?_G797 ?_G840 ?_G804) (((throughout(block ?_G840)) (throughout(red ?_G840)) (throughout(table ?_G804)))-())
      (!unstack ?_G797 ?_G847 ?_G999 ?_G811) (((throughout(block ?_G847)) (throughout(block ?_G999)) (throughout(pile ?_G811)) (throughout(red ?_G847)) (throughout(red ?_G999)))-()))
      (!put ?_G797 ?_G1151 ?_G804) (((throughout(block ?_G1151)) (throughout(red ?_G1151)) (throughout(table ?_G804)))-())
      (!unstack ?_G797 ?_G1303 ?_G1455 ?_G811) (((throughout(block ?_G1303)) (throughout(block ?_G1455)) (throughout(blue ?_G1455)) (throughout(pile ?_G811)) (throughout(red ?_G1303)))-())
      (!put ?_G797 ?_G1303 ?_G804) (((throughout(block ?_G1303)) (throughout(red ?_G1303)) (throughout(table ?_G804)))-())
      (!unstack ?_G797 ?_G1455 ?_G1607 ?_G811) (((throughout(block ?_G1455)) (throughout(block ?_G1607)) (throughout(blue ?_G1455)) (throughout(blue ?_G1607)) (throughout(pile ?_G811)))-())
      (forall
      (!put ?_G797 ?_G1455 ?_G804) (((throughout(block ?_G1455)) (throughout(blue ?_G1455)) (throughout(table ?_G804)))-())
      (!unstack ?_G797 ?_G1607 ?_G1759 ?_G811) (((throughout(block ?_G1607)) (throughout(block ?_G1759)) (throughout(blue ?_G1607)) (throughout(blue ?_G1759)) (throughout(pile ?_G811)))-()))
      (!put ?_G797 ?_G1911 ?_G804) (((throughout(block ?_G1911)) (throughout(blue ?_G1911)) (throughout(table ?_G804)))-())
      (!unstack ?_G797 ?_G2063 ?_G2215 ?_G811) (((at_goal(top ?_G2215 ?_G811)) (throughout(block ?_G2063)) (throughout(blue ?_G2063)) (throughout(pallet ?_G2215)) (throughout(pile ?_G811)))-())
      (!stack ?_G797 ?_G2063 ?_G2295 ?_G2259) (((at_start(top ?_G2295 ?_G2259)) (throughout(block ?_G2063)) (throughout(blue ?_G2063)) (throughout(pallet ?_G2295)) (throughout(pile ?_G2259)))-())
      (!pick ?_G797 ?_G1911 ?_G804) (((throughout(block ?_G1911)) (throughout(blue ?_G1911)) (throughout(table ?_G804)))-())
      (forall
      (!stack ?_G797 ?_G1911 ?_G2063 ?_G2259) (((throughout(block ?_G1911)) (throughout(block ?_G2063)) (throughout(blue ?_G1911)) (throughout(blue ?_G2063)) (throughout(pile ?_G2259)))-())
      (!pick ?_G797 ?_G1759 ?_G804) (((throughout(block ?_G1759)) (throughout(blue ?_G1759)) (throughout(table ?_G804)))-()))
      (!stack ?_G797 ?_G1455 ?_G1607 ?_G2259) (((throughout(block ?_G1455)) (throughout(block ?_G1607)) (throughout(blue ?_G1455)) (throughout(blue ?_G1607)) (throughout(pile ?_G2259)))-())
      (!pick ?_G797 ?_G1303 ?_G804) (((throughout(block ?_G1303)) (throughout(red ?_G1303)) (throughout(table ?_G804)))-())
      (!stack ?_G797 ?_G1303 ?_G1455 ?_G2259) (((throughout(block ?_G1303)) (throughout(block ?_G1455)) (throughout(blue ?_G1455)) (throughout(pile ?_G2259)) (throughout(red ?_G1303)))-())
      (forall
      (!pick ?_G797 ?_G1151 ?_G804) (((throughout(block ?_G1151)) (throughout(red ?_G1151)) (throughout(table ?_G804)))-())
      (!stack ?_G797 ?_G1151 ?_G1303 ?_G2259) (((throughout(block ?_G1151)) (throughout(block ?_G1303)) (throughout(pile ?_G2259)) (throughout(red ?_G1151)) (throughout(red ?_G1303)))-()))
      (!pick ?_G797 ?_G840 ?_G804) (((throughout(block ?_G840)) (throughout(red ?_G840)) (throughout(table ?_G804)))-())
      (!stack ?_G797 ?_G840 ?_G847 ?_G2259) (((throughout(block ?_G840)) (throughout(block ?_G847)) (throughout(pile ?_G2259)) (throughout(red ?_G840)) (throughout(red ?_G847)))-())
      )))