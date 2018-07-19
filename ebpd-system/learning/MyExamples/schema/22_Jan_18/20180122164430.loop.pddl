(robot_activity_schema
  (:domain race)
  (:method unstack_stack        ;;; unstack_stack(p1,p2)
   :parameters  (?_G688 ?_G2136)
   :abstract-plan
     ((!unstack ?_G674 ?_G717 ?_G724 ?_G688) (((at_goal(top ?_G717 ?_G2136)) (at_start(empty ?_G674)) (at_start(top ?_G717 ?_G688)) (throughout(pile ?_G688)))-())
      (!put ?_G674 ?_G717 ?_G681) (((at_goal(top ?_G717 ?_G2136)) (at_start(empty ?_G674)) (at_start(top ?_G717 ?_G688)) (throughout(table ?_G681)))-())
      (forall
      (!unstack ?_G674 ?_G724 ?_G876 ?_G688) (((at_start(empty ?_G674)) (throughout(pile ?_G688)))-())
      (!put ?_G674 ?_G724 ?_G681) (((at_start(empty ?_G674)) (throughout(table ?_G681)))-()))
      (!unstack ?_G674 ?_G1940 ?_G2092 ?_G688) (((at_goal(top ?_G2092 ?_G688)) (at_start(empty ?_G674)) (throughout(pile ?_G688)))-())
      (!stack ?_G674 ?_G1940 ?_G2172 ?_G2136) (((at_start(empty ?_G674)) (at_start(top ?_G2172 ?_G2136)) (throughout(pile ?_G2136)))-())
      (forall
      (!pick ?_G674 ?_G1180 ?_G681) (((at_start(empty ?_G674)) (throughout(table ?_G681)))-())
      (!stack ?_G674 ?_G1180 ?_G1940 ?_G2136) (((at_start(empty ?_G674)) (throughout(pile ?_G2136)))-()))
      (!pick ?_G674 ?_G717 ?_G681) (((at_goal(top ?_G717 ?_G2136)) (at_start(empty ?_G674)) (at_start(top ?_G717 ?_G688)) (throughout(table ?_G681)))-())
      (!stack ?_G674 ?_G717 ?_G1332 ?_G2136) (((at_goal(top ?_G717 ?_G2136)) (at_start(empty ?_G674)) (at_start(top ?_G717 ?_G688)) (throughout(pile ?_G2136)))-())
      )))