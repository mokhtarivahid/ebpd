(robot_activity_schema
  (:domain race)
  (:method transport        ;;; transport(rooma,roomb)
   :parameters  (?_G483 ?_G551)
   :abstract-plan
     ((forall
      (!pick ?_G208 ?_G215 ?_G222) (((at_goal(free ?_G222)) (at_goal(at ?_G208 ?_G551)) (at_start(free ?_G222)) (at_start(at ?_G208 ?_G483)) (throughout(ball ?_G208)) (throughout(gripper ?_G222)))-())
      (!drop ?_G208 ?_G263 ?_G222) (((at_goal(free ?_G222)) (at_goal(at ?_G208 ?_G551)) (at_start(free ?_G222)) (at_start(at ?_G208 ?_G483)) (throughout(ball ?_G208)) (throughout(gripper ?_G222)))-()))
      (!pick ?_G496 ?_G503 ?_G222) (((at_goal(free ?_G222)) (at_goal(at ?_G496 ?_G551)) (at_start(free ?_G222)) (at_start(at ?_G496 ?_G483)) (throughout(ball ?_G496)) (throughout(gripper ?_G222)))-())
      (!drop ?_G496 ?_G551 ?_G222) (((at_goal(at_robby ?_G551)) (at_goal(free ?_G222)) (at_goal(at ?_G496 ?_G551)) (at_start(free ?_G222)) (at_start(at ?_G496 ?_G483)) (throughout(ball ?_G496)) (throughout(gripper ?_G222)) (throughout(roomb ?_G551)))-())
      )))