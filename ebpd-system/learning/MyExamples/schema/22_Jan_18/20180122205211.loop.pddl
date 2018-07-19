(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(t1,p1)
   :parameters  (?_G469 ?_G505)
   :abstract-plan
     ((!pick ?_G455 ?_G462 ?_G469) (((at_start(empty ?_G455)) (at_start(at ?_G455 ?_G469)) (at_start(ontable ?_G462 ?_G469)) (throughout(table ?_G469)))-())
      (!stack ?_G455 ?_G462 ?_G541 ?_G505) (((at_start(empty ?_G455)) (at_start(at ?_G455 ?_G469)) (at_start(ontable ?_G462 ?_G469)) (at_start(top ?_G541 ?_G505)) (throughout(pallet ?_G541)) (throughout(pile ?_G505)))-())
      (forall
      (!pick ?_G455 ?_G614 ?_G469) (((at_start(empty ?_G455)) (at_start(at ?_G455 ?_G469)) (at_start(ontable ?_G614 ?_G469)) (throughout(table ?_G469)))-())
      (!stack ?_G455 ?_G614 ?_G462 ?_G505) (((at_start(empty ?_G455)) (at_start(at ?_G455 ?_G469)) (at_start(ontable ?_G462 ?_G469)) (at_start(ontable ?_G614 ?_G469)) (throughout(pile ?_G505)))-()))
      (!pick ?_G455 ?_G1830 ?_G469) (((at_goal(top ?_G1830 ?_G505)) (at_start(empty ?_G455)) (at_start(at ?_G455 ?_G469)) (at_start(ontable ?_G1830 ?_G469)) (throughout(table ?_G469)))-())
      (!stack ?_G455 ?_G1830 ?_G1678 ?_G505) (((at_goal(top ?_G1830 ?_G505)) (at_start(empty ?_G455)) (at_start(at ?_G455 ?_G469)) (at_start(ontable ?_G1678 ?_G469)) (at_start(ontable ?_G1830 ?_G469)) (throughout(pile ?_G505)))-())
      )))