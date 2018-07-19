(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(p1,p2)
   :parameters  (?_G826 ?_G2382)
   :abstract-plan
     ((!unstack ?_G812 ?_G855 ?_G862 ?_G826) (((throughout(block ?_G855)) (throughout(block ?_G862)) (throughout(blue ?_G855)) (throughout(pile ?_G826)) (throughout(red ?_G862)))-())
      (!put ?_G812 ?_G855 ?_G819) (((throughout(block ?_G855)) (throughout(blue ?_G855)) (throughout(table ?_G819)))-())
      (forall
      (!unstack ?_G812 ?_G862 ?_G1014 ?_G826) (((throughout(block ?_G862)) (throughout(block ?_G1014)) (throughout(blue ?_G1014)) (throughout(pile ?_G826)) (throughout(red ?_G862)))-())
      (!put ?_G812 ?_G862 ?_G819) (((throughout(block ?_G862)) (throughout(red ?_G862)) (throughout(table ?_G819)))-())
      (!unstack ?_G812 ?_G1014 ?_G1166 ?_G826) (((throughout(block ?_G1014)) (throughout(block ?_G1166)) (throughout(blue ?_G1014)) (throughout(pile ?_G826)) (throughout(red ?_G1166)))-())
      (!put ?_G812 ?_G1014 ?_G819) (((throughout(block ?_G1014)) (throughout(blue ?_G1014)) (throughout(table ?_G819)))-()))
      (!unstack ?_G812 ?_G2078 ?_G2230 ?_G826) (((at_goal(top ?_G2230 ?_G826)) (throughout(block ?_G2078)) (throughout(pallet ?_G2230)) (throughout(pile ?_G826)) (throughout(red ?_G2078)))-())
      (!put ?_G812 ?_G2078 ?_G819) (((throughout(block ?_G2078)) (throughout(red ?_G2078)) (throughout(table ?_G819)))-())
      (!pick ?_G812 ?_G1926 ?_G819) (((throughout(block ?_G1926)) (throughout(blue ?_G1926)) (throughout(table ?_G819)))-())
      (!stack ?_G812 ?_G1926 ?_G2418 ?_G2382) (((at_start(top ?_G2418 ?_G2382)) (throughout(block ?_G1926)) (throughout(blue ?_G1926)) (throughout(pallet ?_G2418)) (throughout(pile ?_G2382)))-())
      (forall
      (!pick ?_G812 ?_G1622 ?_G819) (((throughout(block ?_G1622)) (throughout(blue ?_G1622)) (throughout(table ?_G819)))-())
      (!stack ?_G812 ?_G1622 ?_G1926 ?_G2382) (((throughout(block ?_G1622)) (throughout(block ?_G1926)) (throughout(blue ?_G1622)) (throughout(blue ?_G1926)) (throughout(pile ?_G2382)))-()))
      (!pick ?_G812 ?_G2078 ?_G819) (((throughout(block ?_G2078)) (throughout(red ?_G2078)) (throughout(table ?_G819)))-())
      (!stack ?_G812 ?_G2078 ?_G855 ?_G2382) (((throughout(block ?_G855)) (throughout(block ?_G2078)) (throughout(blue ?_G855)) (throughout(pile ?_G2382)) (throughout(red ?_G2078)))-())
      (forall
      (!pick ?_G812 ?_G1774 ?_G819) (((throughout(block ?_G1774)) (throughout(red ?_G1774)) (throughout(table ?_G819)))-())
      (!stack ?_G812 ?_G1774 ?_G2078 ?_G2382) (((throughout(block ?_G1774)) (throughout(block ?_G2078)) (throughout(pile ?_G2382)) (throughout(red ?_G1774)) (throughout(red ?_G2078)))-()))
      )))