(robot_activity_schema
  (:domain race)
  (:method transport        ;;; transport(rooma,roomb)
   :parameters  (?_G201 ?_G257)
   :abstract-plan
     ((!pick ?_G194 ?_G201 ?_G208) (((at_goal(at ?_G194 ?_G257)) (at_start(at_robby ?_G201)) (at_start(free ?_G208)) (at_start(at ?_G194 ?_G201)) (throughout(ball ?_G194)) (throughout(gripper ?_G208)) (throughout(room ?_G201)))-())
      (!pick ?_G222 ?_G201 ?_G236) (((at_goal(at ?_G222 ?_G257)) (at_start(at_robby ?_G201)) (at_start(free ?_G236)) (at_start(at ?_G222 ?_G201)) (throughout(ball ?_G222)) (throughout(gripper ?_G236)) (throughout(room ?_G201)))-())
      (!drop ?_G194 ?_G257 ?_G208) (((at_goal(at ?_G194 ?_G257)) (at_start(free ?_G208)) (at_start(at ?_G194 ?_G201)) (throughout(ball ?_G194)) (throughout(gripper ?_G208)) (throughout(room ?_G257)))-())
      (!drop ?_G222 ?_G257 ?_G236) (((at_goal(at ?_G222 ?_G257)) (at_start(free ?_G236)) (at_start(at ?_G222 ?_G201)) (throughout(ball ?_G222)) (throughout(gripper ?_G236)) (throughout(room ?_G257)))-())
      (!pick ?_G346 ?_G201 ?_G208) (((at_goal(at ?_G346 ?_G257)) (at_start(at_robby ?_G201)) (at_start(free ?_G208)) (at_start(at ?_G346 ?_G201)) (throughout(ball ?_G346)) (throughout(gripper ?_G208)) (throughout(room ?_G201)))-())
      (!pick ?_G374 ?_G201 ?_G236) (((at_goal(at ?_G374 ?_G257)) (at_start(at_robby ?_G201)) (at_start(free ?_G236)) (at_start(at ?_G374 ?_G201)) (throughout(ball ?_G374)) (throughout(gripper ?_G236)) (throughout(room ?_G201)))-())
      (!drop ?_G346 ?_G257 ?_G208) (((at_goal(at ?_G346 ?_G257)) (at_start(free ?_G208)) (at_start(at ?_G346 ?_G201)) (throughout(ball ?_G346)) (throughout(gripper ?_G208)) (throughout(room ?_G257)))-())
      (!drop ?_G374 ?_G257 ?_G236) (((at_goal(at ?_G374 ?_G257)) (at_start(free ?_G236)) (at_start(at ?_G374 ?_G201)) (throughout(ball ?_G374)) (throughout(gripper ?_G236)) (throughout(room ?_G257)))-())
      )))