(robot_activity_schema
  (:domain race)
  (:method transport        ;;; transport(rooma,roomb)
   :parameters  (?_G215 ?_G243)
   :abstract-plan
     ((forall
      (!pick ?_G208 ?_G215 ?_G222) (((at_goal(free ?_G222)) (at_goal(at ?_G208 ?_G243)) (at_start(at_robby ?_G215)) (at_start(free ?_G222)) (at_start(at ?_G208 ?_G215)) (throughout(ball ?_G208)) (throughout(gripper ?_G222)) (throughout(room ?_G215)))-())
      (!drop ?_G208 ?_G243 ?_G222) (((at_goal(at_robby ?_G243)) (at_goal(free ?_G222)) (at_goal(at ?_G208 ?_G243)) (at_start(free ?_G222)) (at_start(at ?_G208 ?_G215)) (throughout(ball ?_G208)) (throughout(gripper ?_G222)) (throughout(room ?_G243)))-()))
      )))