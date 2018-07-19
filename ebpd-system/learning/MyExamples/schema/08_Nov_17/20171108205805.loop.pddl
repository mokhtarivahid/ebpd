(robot_activity_schema
  (:domain race)
  (:method flight        ;;; flight(city0,city1)
   :parameters  (?_G10 ?_G7)
   :abstract-plan
     ((!board ?_G2 ?_G4) (((at_goal(in ?_G2 ?_G7)) (at_start(in ?_G2 ?_G10)))-())
      (!board ?_G5 ?_G4) (((at_goal(in ?_G5 ?_G7)) (at_start(in ?_G5 ?_G10)))-())
      (!board ?_G6 ?_G4) (((at_goal(in ?_G6 ?_G7)) (at_start(in ?_G6 ?_G10)))-())
      (!fly ?_G3 ?_G4 ?_G7) (((at_start(at ?_G3 ?_G10)))-())
      (forall
      (!debark ?_G2 ?_G7) (((at_goal(in ?_G2 ?_G7)) (at_start(in ?_G2 ?_G10)))-()))
      )))