(robot_activity_schema
  (:domain race)
  (:method flight        ;;; flight(city0,city1)
   :parameters  (?_G493 ?_G273)
   :abstract-plan
     ((!board ?_G175 ?_G182 ?_G189) (((at_goal(in ?_G175 ?_G273)) (at_start(at ?_G182 ?_G493)) (at_start(in ?_G175 ?_G493)))-())
      (!board ?_G203 ?_G182 ?_G189) (((at_goal(in ?_G203 ?_G273)) (at_start(at ?_G182 ?_G493)) (at_start(in ?_G203 ?_G493)))-())
      (!board ?_G231 ?_G182 ?_G189) (((at_goal(in ?_G231 ?_G273)) (at_start(at ?_G182 ?_G493)) (at_start(in ?_G231 ?_G493)))-())
      (!fly ?_G182 ?_G189 ?_G273 ?_G280 ?_G287) (((at_start(at ?_G182 ?_G493)))-())
      (forall
      (!debark ?_G175 ?_G182 ?_G273) (((at_goal(in ?_G175 ?_G273)) (at_start(at ?_G182 ?_G493)) (at_start(in ?_G175 ?_G493)))-()))
      )))