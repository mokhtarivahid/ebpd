(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(p1,p2)
   :parameters  (?_G650 ?_G730)
   :abstract-plan
     ((!unstack ?_G636 ?_G679 ?_G686 ?_G650) (((at_start(top ?_G679 ?_G650)) (throughout(block ?_G679)) (throughout(block ?_G686)) (throughout(blue ?_G679)) (throughout(blue ?_G686)) (throughout(pile ?_G650)))-())
      (!stack ?_G636 ?_G679 ?_G766 ?_G730) (((at_start(top ?_G679 ?_G650)) (at_start(top ?_G766 ?_G730)) (throughout(block ?_G679)) (throughout(blue ?_G679)) (throughout(pallet ?_G766)) (throughout(pile ?_G730)))-())
      (!unstack ?_G636 ?_G686 ?_G846 ?_G650) (((throughout(block ?_G686)) (throughout(block ?_G846)) (throughout(blue ?_G686)) (throughout(blue ?_G846)) (throughout(pile ?_G650)))-())
      (!stack ?_G636 ?_G686 ?_G679 ?_G730) (((at_start(top ?_G679 ?_G650)) (throughout(block ?_G679)) (throughout(block ?_G686)) (throughout(blue ?_G679)) (throughout(blue ?_G686)) (throughout(pile ?_G730)))-())
      (!unstack ?_G636 ?_G846 ?_G1006 ?_G650) (((throughout(block ?_G846)) (throughout(block ?_G1006)) (throughout(blue ?_G846)) (throughout(blue ?_G1006)) (throughout(pile ?_G650)))-())
      (!stack ?_G636 ?_G846 ?_G686 ?_G730) (((throughout(block ?_G686)) (throughout(block ?_G846)) (throughout(blue ?_G686)) (throughout(blue ?_G846)) (throughout(pile ?_G730)))-())
      (!unstack ?_G636 ?_G1006 ?_G1166 ?_G650) (((throughout(block ?_G1006)) (throughout(block ?_G1166)) (throughout(blue ?_G1006)) (throughout(blue ?_G1166)) (throughout(pile ?_G650)))-())
      (!stack ?_G636 ?_G1006 ?_G846 ?_G730) (((throughout(block ?_G846)) (throughout(block ?_G1006)) (throughout(blue ?_G846)) (throughout(blue ?_G1006)) (throughout(pile ?_G730)))-())
      (!unstack ?_G636 ?_G1166 ?_G1326 ?_G650) (((throughout(block ?_G1166)) (throughout(block ?_G1326)) (throughout(blue ?_G1166)) (throughout(pile ?_G650)) (throughout(red ?_G1326)))-())
      (!stack ?_G636 ?_G1166 ?_G1006 ?_G730) (((throughout(block ?_G1006)) (throughout(block ?_G1166)) (throughout(blue ?_G1006)) (throughout(blue ?_G1166)) (throughout(pile ?_G730)))-())
      (!unstack ?_G636 ?_G1326 ?_G1486 ?_G650) (((throughout(block ?_G1326)) (throughout(block ?_G1486)) (throughout(pile ?_G650)) (throughout(red ?_G1326)) (throughout(red ?_G1486)))-())
      (!stack ?_G636 ?_G1326 ?_G1166 ?_G730) (((throughout(block ?_G1166)) (throughout(block ?_G1326)) (throughout(blue ?_G1166)) (throughout(pile ?_G730)) (throughout(red ?_G1326)))-())
      (!unstack ?_G636 ?_G1486 ?_G1646 ?_G650) (((throughout(block ?_G1486)) (throughout(block ?_G1646)) (throughout(pile ?_G650)) (throughout(red ?_G1486)) (throughout(red ?_G1646)))-())
      (!stack ?_G636 ?_G1486 ?_G1326 ?_G730) (((throughout(block ?_G1326)) (throughout(block ?_G1486)) (throughout(pile ?_G730)) (throughout(red ?_G1326)) (throughout(red ?_G1486)))-())
      (!unstack ?_G636 ?_G1646 ?_G1806 ?_G650) (((throughout(block ?_G1646)) (throughout(block ?_G1806)) (throughout(pile ?_G650)) (throughout(red ?_G1646)) (throughout(red ?_G1806)))-())
      (!stack ?_G636 ?_G1646 ?_G1486 ?_G730) (((throughout(block ?_G1486)) (throughout(block ?_G1646)) (throughout(pile ?_G730)) (throughout(red ?_G1486)) (throughout(red ?_G1646)))-())
      (!unstack ?_G636 ?_G1806 ?_G1966 ?_G650) (((at_goal(top ?_G1966 ?_G730)) (throughout(block ?_G1806)) (throughout(block ?_G1966)) (throughout(pile ?_G650)) (throughout(red ?_G1806)) (throughout(red ?_G1966)))-())
      (!put ?_G636 ?_G1806 ?_G643) (((throughout(block ?_G1806)) (throughout(red ?_G1806)) (throughout(table ?_G643)))-())
      (!unstack ?_G636 ?_G1966 ?_G2118 ?_G650) (((at_goal(top ?_G1966 ?_G730)) (at_goal(top ?_G2118 ?_G650)) (throughout(block ?_G1966)) (throughout(pallet ?_G2118)) (throughout(pile ?_G650)) (throughout(red ?_G1966)))-())
      (!put ?_G636 ?_G1966 ?_G643) (((at_goal(top ?_G1966 ?_G730)) (throughout(block ?_G1966)) (throughout(red ?_G1966)) (throughout(table ?_G643)))-())
      (!pick ?_G636 ?_G1806 ?_G643) (((throughout(block ?_G1806)) (throughout(red ?_G1806)) (throughout(table ?_G643)))-())
      (!stack ?_G636 ?_G1806 ?_G1646 ?_G730) (((throughout(block ?_G1646)) (throughout(block ?_G1806)) (throughout(pile ?_G730)) (throughout(red ?_G1646)) (throughout(red ?_G1806)))-())
      (!pick ?_G636 ?_G1966 ?_G643) (((at_goal(top ?_G1966 ?_G730)) (throughout(block ?_G1966)) (throughout(red ?_G1966)) (throughout(table ?_G643)))-())
      (!stack ?_G636 ?_G1966 ?_G1806 ?_G730) (((at_goal(top ?_G1966 ?_G730)) (throughout(block ?_G1806)) (throughout(block ?_G1966)) (throughout(pile ?_G730)) (throughout(red ?_G1806)) (throughout(red ?_G1966)))-())
      )))