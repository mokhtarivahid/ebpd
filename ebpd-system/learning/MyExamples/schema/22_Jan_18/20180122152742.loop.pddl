(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(t1,p2)
   :parameters  (?_G623 ?_G587)
   :abstract-plan
     ((!pick ?_G573 ?_G652 ?_G623) (((at_start(empty ?_G573)) (at_start(ontable ?_G652 ?_G623)) (throughout(red ?_G652)) (throughout(table ?_G623)))-())
      (!stack ?_G573 ?_G652 ?_G731 ?_G587) (((at_start(empty ?_G573)) (at_start(ontable ?_G652 ?_G623)) (at_start(top ?_G731 ?_G587)) (throughout(pallet ?_G731)) (throughout(pile ?_G587)) (throughout(red ?_G652)))-())
      (forall
      (!pick ?_G573 ?_G804 ?_G623) (((at_start(empty ?_G573)) (at_start(ontable ?_G804 ?_G623)) (throughout(blue ?_G804)) (throughout(table ?_G623)))-())
      (!stack ?_G573 ?_G804 ?_G652 ?_G587) (((at_start(empty ?_G573)) (at_start(ontable ?_G652 ?_G623)) (at_start(ontable ?_G804 ?_G623)) (throughout(blue ?_G804)) (throughout(pile ?_G587)) (throughout(red ?_G652)))-())
      (!pick ?_G573 ?_G956 ?_G623) (((at_start(empty ?_G573)) (at_start(ontable ?_G956 ?_G623)) (throughout(red ?_G956)) (throughout(table ?_G623)))-())
      (!stack ?_G573 ?_G956 ?_G804 ?_G587) (((at_start(empty ?_G573)) (at_start(ontable ?_G804 ?_G623)) (at_start(ontable ?_G956 ?_G623)) (throughout(blue ?_G804)) (throughout(pile ?_G587)) (throughout(red ?_G956)))-()))
      (!pick ?_G573 ?_G2020 ?_G623) (((at_goal(top ?_G2020 ?_G587)) (at_start(empty ?_G573)) (at_start(ontable ?_G2020 ?_G623)) (throughout(blue ?_G2020)) (throughout(table ?_G623)))-())
      (!stack ?_G573 ?_G2020 ?_G1868 ?_G587) (((at_goal(top ?_G2020 ?_G587)) (at_start(empty ?_G573)) (at_start(ontable ?_G1868 ?_G623)) (at_start(ontable ?_G2020 ?_G623)) (throughout(blue ?_G2020)) (throughout(pile ?_G587)) (throughout(red ?_G1868)))-())
      )))