(robot_activity_schema
  (:domain race)
  (:method clean        ;;; clean(table1,bin1)
   :parameters  (?_G447 ?_G503)
   :abstract-plan
     ((forall
      (!pick ?_G468 ?_G447) (((at_goal(in ?_G468 ?_G503)) (at_start(on ?_G468 ?_G447)) (throughout(table ?_G447)))-())
      (!drop ?_G468 ?_G503) (((at_goal(in ?_G468 ?_G503)) (at_start(on ?_G468 ?_G447)) (throughout(bin ?_G503)))-()))
      )))