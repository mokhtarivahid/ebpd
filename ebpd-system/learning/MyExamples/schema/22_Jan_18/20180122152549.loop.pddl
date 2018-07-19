(robot_activity_schema
  (:domain race)
  (:method unstack_stack        ;;; unstack_stack(p1,p2)
   :parameters  (?_G772 ?_G2220)
   :abstract-plan
     ((!unstack ?_G758 ?_G801 ?_G808 ?_G772) (((at_goal(top ?_G801 ?_G2220)) (at_start(empty ?_G758)) (at_start(top ?_G801 ?_G772)) (throughout(blue ?_G801)) (throughout(blue ?_G808)) (throughout(pile ?_G772)))-())
      (!put ?_G758 ?_G801 ?_G765) (((at_goal(top ?_G801 ?_G2220)) (at_start(empty ?_G758)) (at_start(top ?_G801 ?_G772)) (throughout(blue ?_G801)) (throughout(table ?_G765)))-())
      (forall
      (!unstack ?_G758 ?_G808 ?_G960 ?_G772) (((at_start(empty ?_G758)) (throughout(blue ?_G808)) (throughout(blue ?_G960)) (throughout(pile ?_G772)))-())
      (!put ?_G758 ?_G808 ?_G765) (((at_start(empty ?_G758)) (throughout(blue ?_G808)) (throughout(table ?_G765)))-()))
      (!unstack ?_G758 ?_G1264 ?_G1416 ?_G772) (((at_start(empty ?_G758)) (throughout(blue ?_G1264)) (throughout(pile ?_G772)) (throughout(red ?_G1416)))-())
      (!put ?_G758 ?_G1264 ?_G765) (((at_start(empty ?_G758)) (throughout(blue ?_G1264)) (throughout(table ?_G765)))-())
      (forall
      (!unstack ?_G758 ?_G1416 ?_G1568 ?_G772) (((at_start(empty ?_G758)) (throughout(pile ?_G772)) (throughout(red ?_G1416)) (throughout(red ?_G1568)))-())
      (!put ?_G758 ?_G1416 ?_G765) (((at_start(empty ?_G758)) (throughout(red ?_G1416)) (throughout(table ?_G765)))-()))
      (!unstack ?_G758 ?_G2024 ?_G2176 ?_G772) (((at_goal(top ?_G2176 ?_G772)) (at_start(empty ?_G758)) (throughout(pallet ?_G2176)) (throughout(pile ?_G772)) (throughout(red ?_G2024)))-())
      (!stack ?_G758 ?_G2024 ?_G2256 ?_G2220) (((at_start(empty ?_G758)) (at_start(top ?_G2256 ?_G2220)) (throughout(pallet ?_G2256)) (throughout(pile ?_G2220)) (throughout(red ?_G2024)))-())
      (forall
      (!pick ?_G758 ?_G1264 ?_G765) (((at_start(empty ?_G758)) (throughout(blue ?_G1264)) (throughout(table ?_G765)))-())
      (!stack ?_G758 ?_G1264 ?_G2024 ?_G2220) (((at_start(empty ?_G758)) (throughout(blue ?_G1264)) (throughout(pile ?_G2220)) (throughout(red ?_G2024)))-())
      (!pick ?_G758 ?_G1872 ?_G765) (((at_start(empty ?_G758)) (throughout(red ?_G1872)) (throughout(table ?_G765)))-())
      (!stack ?_G758 ?_G1872 ?_G1264 ?_G2220) (((at_start(empty ?_G758)) (throughout(blue ?_G1264)) (throughout(pile ?_G2220)) (throughout(red ?_G1872)))-()))
      (!pick ?_G758 ?_G801 ?_G765) (((at_goal(top ?_G801 ?_G2220)) (at_start(empty ?_G758)) (at_start(top ?_G801 ?_G772)) (throughout(blue ?_G801)) (throughout(table ?_G765)))-())
      (!stack ?_G758 ?_G801 ?_G1416 ?_G2220) (((at_goal(top ?_G801 ?_G2220)) (at_start(empty ?_G758)) (at_start(top ?_G801 ?_G772)) (throughout(blue ?_G801)) (throughout(pile ?_G2220)) (throughout(red ?_G1416)))-())
      )))