(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(t1,p2)
   :parameters  (?_G710 ?_G674)
   :abstract-plan
     ((!pick ?_G660 ?_G739 ?_G710) (((at_goal(in ?_G739 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G739 ?_G710)) (throughout(base ?_G739)) (throughout(red ?_G739)) (throughout(table ?_G710)))-())
      (!stack ?_G660 ?_G739 ?_G818 ?_G674) (((at_goal(in ?_G739 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G739 ?_G710)) (at_start(top ?_G818 ?_G674)) (throughout(base ?_G739)) (throughout(pallet ?_G818)) (throughout(pile ?_G674)) (throughout(red ?_G739)))-())
      (!pick ?_G660 ?_G891 ?_G710) (((at_goal(in ?_G891 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G891 ?_G710)) (throughout(blue ?_G891)) (throughout(table ?_G710)))-())
      (!stack ?_G660 ?_G891 ?_G739 ?_G674) (((at_goal(in ?_G739 ?_G674)) (at_goal(in ?_G891 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G739 ?_G710)) (at_start(ontable ?_G891 ?_G710)) (throughout(base ?_G739)) (throughout(blue ?_G891)) (throughout(pile ?_G674)) (throughout(red ?_G739)))-())
      (forall
      (!pick ?_G660 ?_G1043 ?_G710) (((at_goal(in ?_G1043 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G1043 ?_G710)) (throughout(red ?_G1043)) (throughout(table ?_G710)))-())
      (!stack ?_G660 ?_G1043 ?_G891 ?_G674) (((at_goal(in ?_G891 ?_G674)) (at_goal(in ?_G1043 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G891 ?_G710)) (at_start(ontable ?_G1043 ?_G710)) (throughout(blue ?_G891)) (throughout(pile ?_G674)) (throughout(red ?_G1043)))-())
      (!pick ?_G660 ?_G1195 ?_G710) (((at_goal(in ?_G1195 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G1195 ?_G710)) (throughout(blue ?_G1195)) (throughout(table ?_G710)))-())
      (!stack ?_G660 ?_G1195 ?_G1043 ?_G674) (((at_goal(in ?_G1043 ?_G674)) (at_goal(in ?_G1195 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G1043 ?_G710)) (at_start(ontable ?_G1195 ?_G710)) (throughout(blue ?_G1195)) (throughout(pile ?_G674)) (throughout(red ?_G1043)))-()))
      (!pick ?_G660 ?_G1955 ?_G710) (((at_goal(in ?_G1955 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G1955 ?_G710)) (throughout(red ?_G1955)) (throughout(table ?_G710)))-())
      (!stack ?_G660 ?_G1955 ?_G1803 ?_G674) (((at_goal(in ?_G1803 ?_G674)) (at_goal(in ?_G1955 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G1803 ?_G710)) (at_start(ontable ?_G1955 ?_G710)) (throughout(blue ?_G1803)) (throughout(pile ?_G674)) (throughout(red ?_G1955)))-())
      (!pick ?_G660 ?_G2107 ?_G710) (((at_goal(in ?_G2107 ?_G674)) (at_goal(top ?_G2107 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G2107 ?_G710)) (throughout(blue ?_G2107)) (throughout(table ?_G710)))-())
      (!stack ?_G660 ?_G2107 ?_G1955 ?_G674) (((at_goal(in ?_G1955 ?_G674)) (at_goal(in ?_G2107 ?_G674)) (at_goal(top ?_G2107 ?_G674)) (at_start(empty ?_G660)) (at_start(ontable ?_G1955 ?_G710)) (at_start(ontable ?_G2107 ?_G710)) (throughout(blue ?_G2107)) (throughout(pile ?_G674)) (throughout(red ?_G1955)))-())
      )))