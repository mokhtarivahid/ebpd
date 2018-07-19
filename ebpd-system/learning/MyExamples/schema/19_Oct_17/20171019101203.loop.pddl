(robot_activity_schema
  (:domain race)
  (:method c2_2        ;;; c2_2(office1,office2)
   :parameters  (?_G319 ?_G699)
   :abstract-plan
     ((forall
      (!load ?_G341 ?_G319) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(location ?_G319)) (throughout(object ?_G341)))-()))
      (forall
      (!unload ?_G341 ?_G312) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airport ?_G312)) (throughout(location ?_G312)) (throughout(object ?_G341)))-()))
      (forall
      (!load ?_G341 ?_G312) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airport ?_G312)) (throughout(location ?_G312)) (throughout(object ?_G341)))-()))
      (forall
      (!unload ?_G341 ?_G699) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(location ?_G699)) (throughout(object ?_G341)))-()))
      )))