(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(t1,p1)
   :parameters  (?_G462 ?_G498)
   :abstract-plan
     ((!pick ?_G448 ?_G455 ?_G462) (((at_start(empty ?_G448)) (at_start(at ?_G448 ?_G462)) (at_start(ontable ?_G455 ?_G462)) (throughout(table ?_G462)))-())
      (!stack ?_G448 ?_G455 ?_G534 ?_G498) (((at_start(empty ?_G448)) (at_start(at ?_G448 ?_G462)) (at_start(ontable ?_G455 ?_G462)) (at_start(top ?_G534 ?_G498)) (throughout(pile ?_G498)))-())
      (forall
      (!pick ?_G448 ?_G607 ?_G462) (((at_start(empty ?_G448)) (at_start(at ?_G448 ?_G462)) (at_start(ontable ?_G607 ?_G462)) (throughout(table ?_G462)))-())
      (!stack ?_G448 ?_G607 ?_G455 ?_G498) (((at_start(empty ?_G448)) (at_start(at ?_G448 ?_G462)) (at_start(ontable ?_G455 ?_G462)) (at_start(ontable ?_G607 ?_G462)) (throughout(pile ?_G498)))-()))
      (!pick ?_G448 ?_G1823 ?_G462) (((at_goal(top ?_G1823 ?_G498)) (at_start(empty ?_G448)) (at_start(at ?_G448 ?_G462)) (at_start(ontable ?_G1823 ?_G462)) (throughout(table ?_G462)))-())
      (!stack ?_G448 ?_G1823 ?_G1671 ?_G498) (((at_goal(top ?_G1823 ?_G498)) (at_start(empty ?_G448)) (at_start(at ?_G448 ?_G462)) (at_start(ontable ?_G1671 ?_G462)) (at_start(ontable ?_G1823 ?_G462)) (throughout(pile ?_G498)))-())
      )))