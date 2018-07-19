(robot_activity_schema
  (:domain race)
  (:method transport        ;;; transport(rooma,roomb)
   :parameters  (?_G201 ?_G229)
   :abstract-plan
     ((forall
      (!pick ?_G194 ?_G201 ?_G208) (((at_goal(at ?_G194 ?_G229)) (at_start(at_robby ?_G201)) (at_start(free ?_G208)) (at_start(at ?_G194 ?_G201)) (throughout(ball ?_G2)) (throughout(gripper ?_G4)) (throughout(room ?_G3)))-())
      (!drop ?_G2 ?_G5 ?_G4) (((at_goal(at ?_G2 ?_G5)) (at_start(free ?_G4)) (at_start(at ?_G2 ?_G3)) (throughout(ball ?_G2)) (throughout(gripper ?_G4)) (throughout(room ?_G5)))-()))
      )))