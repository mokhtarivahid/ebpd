(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(p1,p2)
   :parameters  (?_G795 ?_G2243)
   :abstract-plan
     ((!unstack ?_G781 ?_G824 ?_G831 ?_G795) (((at_goal(top ?_G824 ?_G2243)) (at_start(top ?_G824 ?_G795)) (throughout(block ?_G824)) (throughout(block ?_G831)) (throughout(blue ?_G831)) (throughout(pile ?_G795)) (throughout(red ?_G824)))-())
      (!put ?_G781 ?_G824 ?_G788) (((at_goal(top ?_G824 ?_G2243)) (at_start(top ?_G824 ?_G795)) (throughout(block ?_G824)) (throughout(red ?_G824)) (throughout(table ?_G788)))-())
      (!unstack ?_G781 ?_G831 ?_G983 ?_G795) (((throughout(block ?_G831)) (throughout(block ?_G983)) (throughout(blue ?_G831)) (throughout(pile ?_G795)) (throughout(red ?_G983)))-())
      (forall
      (!put ?_G781 ?_G831 ?_G788) (((throughout(block ?_G831)) (throughout(blue ?_G831)) (throughout(table ?_G788)))-())
      (!unstack ?_G781 ?_G983 ?_G1135 ?_G795) (((throughout(block ?_G983)) (throughout(block ?_G1135)) (throughout(blue ?_G1135)) (throughout(pile ?_G795)) (throughout(red ?_G983)))-())
      (!put ?_G781 ?_G983 ?_G788) (((throughout(block ?_G983)) (throughout(red ?_G983)) (throughout(table ?_G788)))-())
      (!unstack ?_G781 ?_G1135 ?_G1287 ?_G795) (((throughout(block ?_G1135)) (throughout(block ?_G1287)) (throughout(blue ?_G1135)) (throughout(pile ?_G795)) (throughout(red ?_G1287)))-()))
      (!put ?_G781 ?_G1743 ?_G788) (((throughout(block ?_G1743)) (throughout(blue ?_G1743)) (throughout(table ?_G788)))-())
      (!unstack ?_G781 ?_G1895 ?_G2047 ?_G795) (((throughout(block ?_G1895)) (throughout(block ?_G2047)) (throughout(blue ?_G2047)) (throughout(pile ?_G795)) (throughout(red ?_G1895)))-())
      (!put ?_G781 ?_G1895 ?_G788) (((throughout(block ?_G1895)) (throughout(red ?_G1895)) (throughout(table ?_G788)))-())
      (!unstack ?_G781 ?_G2047 ?_G2199 ?_G795) (((at_goal(top ?_G2199 ?_G795)) (throughout(block ?_G2047)) (throughout(blue ?_G2047)) (throughout(pallet ?_G2199)) (throughout(pile ?_G795)))-())
      (!stack ?_G781 ?_G2047 ?_G2279 ?_G2243) (((at_start(top ?_G2279 ?_G2243)) (throughout(block ?_G2047)) (throughout(blue ?_G2047)) (throughout(pallet ?_G2279)) (throughout(pile ?_G2243)))-())
      (!pick ?_G781 ?_G1743 ?_G788) (((throughout(block ?_G1743)) (throughout(blue ?_G1743)) (throughout(table ?_G788)))-())
      (forall
      (!stack ?_G781 ?_G1743 ?_G2047 ?_G2243) (((throughout(block ?_G1743)) (throughout(block ?_G2047)) (throughout(blue ?_G1743)) (throughout(blue ?_G2047)) (throughout(pile ?_G2243)))-())
      (!pick ?_G781 ?_G1439 ?_G788) (((throughout(block ?_G1439)) (throughout(blue ?_G1439)) (throughout(table ?_G788)))-()))
      (!stack ?_G781 ?_G831 ?_G1135 ?_G2243) (((throughout(block ?_G831)) (throughout(block ?_G1135)) (throughout(blue ?_G831)) (throughout(blue ?_G1135)) (throughout(pile ?_G2243)))-())
      (!pick ?_G781 ?_G1895 ?_G788) (((throughout(block ?_G1895)) (throughout(red ?_G1895)) (throughout(table ?_G788)))-())
      (!stack ?_G781 ?_G1895 ?_G831 ?_G2243) (((throughout(block ?_G831)) (throughout(block ?_G1895)) (throughout(blue ?_G831)) (throughout(pile ?_G2243)) (throughout(red ?_G1895)))-())
      (!pick ?_G781 ?_G1591 ?_G788) (((throughout(block ?_G1591)) (throughout(red ?_G1591)) (throughout(table ?_G788)))-())
      (forall
      (!stack ?_G781 ?_G1591 ?_G1895 ?_G2243) (((throughout(block ?_G1591)) (throughout(block ?_G1895)) (throughout(pile ?_G2243)) (throughout(red ?_G1591)) (throughout(red ?_G1895)))-())
      (!pick ?_G781 ?_G1287 ?_G788) (((throughout(block ?_G1287)) (throughout(red ?_G1287)) (throughout(table ?_G788)))-()))
      (!stack ?_G781 ?_G983 ?_G1287 ?_G2243) (((throughout(block ?_G983)) (throughout(block ?_G1287)) (throughout(pile ?_G2243)) (throughout(red ?_G983)) (throughout(red ?_G1287)))-())
      (!pick ?_G781 ?_G824 ?_G788) (((at_goal(top ?_G824 ?_G2243)) (at_start(top ?_G824 ?_G795)) (throughout(block ?_G824)) (throughout(red ?_G824)) (throughout(table ?_G788)))-())
      (!stack ?_G781 ?_G824 ?_G983 ?_G2243) (((at_goal(top ?_G824 ?_G2243)) (at_start(top ?_G824 ?_G795)) (throughout(block ?_G824)) (throughout(block ?_G983)) (throughout(pile ?_G2243)) (throughout(red ?_G824)) (throughout(red ?_G983)))-())
      )))