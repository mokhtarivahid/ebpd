(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(p1,p2)
   :parameters  (?_G842 ?_G2290)
   :abstract-plan
     ((!unstack ?_G828 ?_G871 ?_G878 ?_G842) (((at_goal(top ?_G871 ?_G2290)) (at_start(empty ?_G828)) (at_start(top ?_G871 ?_G842)) (throughout(block ?_G871)) (throughout(block ?_G878)) (throughout(pile ?_G842)) (throughout(red ?_G871)) (throughout(red ?_G878)))-())
      (!put ?_G828 ?_G871 ?_G835) (((at_goal(top ?_G871 ?_G2290)) (at_start(empty ?_G828)) (at_start(top ?_G871 ?_G842)) (throughout(block ?_G871)) (throughout(red ?_G871)) (throughout(table ?_G835)))-())
      (forall
      (!unstack ?_G828 ?_G878 ?_G1030 ?_G842) (((at_start(empty ?_G828)) (throughout(block ?_G878)) (throughout(block ?_G1030)) (throughout(pile ?_G842)) (throughout(red ?_G878)) (throughout(red ?_G1030)))-())
      (!put ?_G828 ?_G878 ?_G835) (((at_start(empty ?_G828)) (throughout(block ?_G878)) (throughout(red ?_G878)) (throughout(table ?_G835)))-()))
      (!unstack ?_G828 ?_G1334 ?_G1486 ?_G842) (((at_start(empty ?_G828)) (throughout(block ?_G1334)) (throughout(block ?_G1486)) (throughout(blue ?_G1486)) (throughout(pile ?_G842)) (throughout(red ?_G1334)))-())
      (!put ?_G828 ?_G1334 ?_G835) (((at_start(empty ?_G828)) (throughout(block ?_G1334)) (throughout(red ?_G1334)) (throughout(table ?_G835)))-())
      (forall
      (!unstack ?_G828 ?_G1486 ?_G1638 ?_G842) (((at_start(empty ?_G828)) (throughout(block ?_G1486)) (throughout(block ?_G1638)) (throughout(blue ?_G1486)) (throughout(blue ?_G1638)) (throughout(pile ?_G842)))-())
      (!put ?_G828 ?_G1486 ?_G835) (((at_start(empty ?_G828)) (throughout(block ?_G1486)) (throughout(blue ?_G1486)) (throughout(table ?_G835)))-()))
      (!unstack ?_G828 ?_G2094 ?_G2246 ?_G842) (((at_goal(top ?_G2246 ?_G842)) (at_start(empty ?_G828)) (throughout(block ?_G2094)) (throughout(blue ?_G2094)) (throughout(pallet ?_G2246)) (throughout(pile ?_G842)))-())
      (!stack ?_G828 ?_G2094 ?_G2326 ?_G2290) (((at_start(empty ?_G828)) (at_start(top ?_G2326 ?_G2290)) (throughout(block ?_G2094)) (throughout(blue ?_G2094)) (throughout(pallet ?_G2326)) (throughout(pile ?_G2290)))-())
      (forall
      (!pick ?_G828 ?_G1942 ?_G835) (((at_start(empty ?_G828)) (throughout(block ?_G1942)) (throughout(blue ?_G1942)) (throughout(table ?_G835)))-())
      (!stack ?_G828 ?_G1942 ?_G2094 ?_G2290) (((at_start(empty ?_G828)) (throughout(block ?_G1942)) (throughout(block ?_G2094)) (throughout(blue ?_G1942)) (throughout(blue ?_G2094)) (throughout(pile ?_G2290)))-()))
      (!pick ?_G828 ?_G1334 ?_G835) (((at_start(empty ?_G828)) (throughout(block ?_G1334)) (throughout(red ?_G1334)) (throughout(table ?_G835)))-())
      (!stack ?_G828 ?_G1334 ?_G1486 ?_G2290) (((at_start(empty ?_G828)) (throughout(block ?_G1334)) (throughout(block ?_G1486)) (throughout(blue ?_G1486)) (throughout(pile ?_G2290)) (throughout(red ?_G1334)))-())
      (forall
      (!pick ?_G828 ?_G1182 ?_G835) (((at_start(empty ?_G828)) (throughout(block ?_G1182)) (throughout(red ?_G1182)) (throughout(table ?_G835)))-())
      (!stack ?_G828 ?_G1182 ?_G1334 ?_G2290) (((at_start(empty ?_G828)) (throughout(block ?_G1182)) (throughout(block ?_G1334)) (throughout(pile ?_G2290)) (throughout(red ?_G1182)) (throughout(red ?_G1334)))-()))
      (!pick ?_G828 ?_G871 ?_G835) (((at_goal(top ?_G871 ?_G2290)) (at_start(empty ?_G828)) (at_start(top ?_G871 ?_G842)) (throughout(block ?_G871)) (throughout(red ?_G871)) (throughout(table ?_G835)))-())
      (!stack ?_G828 ?_G871 ?_G878 ?_G2290) (((at_goal(top ?_G871 ?_G2290)) (at_start(empty ?_G828)) (at_start(top ?_G871 ?_G842)) (throughout(block ?_G871)) (throughout(block ?_G878)) (throughout(pile ?_G2290)) (throughout(red ?_G871)) (throughout(red ?_G878)))-())
      )))