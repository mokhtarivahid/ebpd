(robot_activity_schema
  (:domain race)
  (:method transport        ;;; transport(rooma,roomb)
   :parameters  (?_G201 ?_G257)
   :abstract-plan
     ((!pick ?_G194 ?_G201) (((at_goal(at ?_G194 ?_G257)) (at_start(at_robby ?_G201)) (at_start(at ?_G194 ?_G201)) (throughout(ball ?_G194)) (throughout(room ?_G201)))-())
      (!pick ?_G222 ?_G201) (((at_goal(at ?_G222 ?_G257)) (at_start(at_robby ?_G201)) (at_start(at ?_G222 ?_G201)) (throughout(ball ?_G222)) (throughout(room ?_G201)))-())
      (!drop ?_G194 ?_G257) (((at_goal(at ?_G194 ?_G257)) (at_start(at ?_G194 ?_G201)) (throughout(ball ?_G194)) (throughout(room ?_G257)))-())
      (!drop ?_G222 ?_G257) (((at_goal(at ?_G222 ?_G257)) (at_start(at ?_G222 ?_G201)) (throughout(ball ?_G222)) (throughout(room ?_G257)))-())
      (!pick ?_G346 ?_G201) (((at_goal(at ?_G346 ?_G257)) (at_start(at_robby ?_G201)) (at_start(at ?_G346 ?_G201)) (throughout(ball ?_G346)) (throughout(room ?_G201)))-())
      (!pick ?_G374 ?_G201) (((at_goal(at ?_G374 ?_G257)) (at_start(at_robby ?_G201)) (at_start(at ?_G374 ?_G201)) (throughout(ball ?_G374)) (throughout(room ?_G201)))-())
      (!drop ?_G346 ?_G257) (((at_goal(at ?_G346 ?_G257)) (at_start(at ?_G346 ?_G201)) (throughout(ball ?_G346)) (throughout(room ?_G257)))-())
      (!drop ?_G374 ?_G257) (((at_goal(at ?_G374 ?_G257)) (at_start(at ?_G374 ?_G201)) (throughout(ball ?_G374)) (throughout(room ?_G257)))-())
      )))