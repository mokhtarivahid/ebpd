(robot_activity_schema
  (:domain race)
  (:method gripper        ;;; gripper(table1,table2)
   :parameters  (?_G400 ?_G464)
   :abstract-plan
     ((forall
      (!pick ?_G421 ?_G400) (((at_goal(on ?_G421 ?_G464)) (at_start(on ?_G421 ?_G400)))-())
      (!drop ?_G421 ?_G464) (((at_goal(on ?_G421 ?_G464)) (at_start(on ?_G421 ?_G400)))-()))
      )))