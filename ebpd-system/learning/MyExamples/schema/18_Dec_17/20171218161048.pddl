(robot_activity_schema
  (:domain race)
  (:method transport        ;;; transport(rooma,roomb)
   :parameters  (?_G201 ?_G229)
   :abstract-plan
     ((!pick ?_G194 ?_G201 ?_G208) (((at_goal(at ?_G194 ?_G229)) (at_start(at_robby ?_G201)) (at_start(free ?_G208)) (at_start(at ?_G194 ?_G201)) (throughout(ball ?_G194)) (throughout(gripper ?_G208)) (throughout(room ?_G201)))-())
      (!drop ?_G194 ?_G229 ?_G208) (((at_goal(at ?_G194 ?_G229)) (at_start(free ?_G208)) (at_start(at ?_G194 ?_G201)) (throughout(ball ?_G194)) (throughout(gripper ?_G208)) (throughout(room ?_G229)))-())
      (!pick ?_G290 ?_G201 ?_G208) (((at_goal(at ?_G290 ?_G229)) (at_start(at_robby ?_G201)) (at_start(free ?_G208)) (at_start(at ?_G290 ?_G201)) (throughout(ball ?_G290)) (throughout(gripper ?_G208)) (throughout(room ?_G201)))-())
      (!drop ?_G290 ?_G229 ?_G208) (((at_goal(at ?_G290 ?_G229)) (at_start(free ?_G208)) (at_start(at ?_G290 ?_G201)) (throughout(ball ?_G290)) (throughout(gripper ?_G208)) (throughout(room ?_G229)))-())
      (!pick ?_G386 ?_G201 ?_G208) (((at_goal(at ?_G386 ?_G229)) (at_start(at_robby ?_G201)) (at_start(free ?_G208)) (at_start(at ?_G386 ?_G201)) (throughout(ball ?_G386)) (throughout(gripper ?_G208)) (throughout(room ?_G201)))-())
      (!drop ?_G386 ?_G229 ?_G208) (((at_goal(at ?_G386 ?_G229)) (at_start(free ?_G208)) (at_start(at ?_G386 ?_G201)) (throughout(ball ?_G386)) (throughout(gripper ?_G208)) (throughout(room ?_G229)))-())
      (!pick ?_G482 ?_G201 ?_G208) (((at_goal(at ?_G482 ?_G229)) (at_start(at_robby ?_G201)) (at_start(free ?_G208)) (at_start(at ?_G482 ?_G201)) (throughout(ball ?_G482)) (throughout(gripper ?_G208)) (throughout(room ?_G201)))-())
      (!drop ?_G482 ?_G229 ?_G208) (((at_goal(at ?_G482 ?_G229)) (at_start(free ?_G208)) (at_start(at ?_G482 ?_G201)) (throughout(ball ?_G482)) (throughout(gripper ?_G208)) (throughout(room ?_G229)))-())
      )))