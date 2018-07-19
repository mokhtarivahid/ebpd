(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(t1,p2)
   :parameters  (?_G703 ?_G667)
   :abstract-plan
     ((!pick ?_G653 ?_G732 ?_G703) (((at_goal(in ?_G732 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G732 ?_G703)) (throughout(red ?_G732)) (throughout(table ?_G703)))-())
      (!stack ?_G653 ?_G732 ?_G811 ?_G667) (((at_goal(in ?_G732 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G732 ?_G703)) (at_start(top ?_G811 ?_G667)) (throughout(pallet ?_G811)) (throughout(pile ?_G667)) (throughout(red ?_G732)))-())
      (!pick ?_G653 ?_G884 ?_G703) (((at_goal(in ?_G884 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G884 ?_G703)) (throughout(blue ?_G884)) (throughout(table ?_G703)))-())
      (!stack ?_G653 ?_G884 ?_G732 ?_G667) (((at_goal(in ?_G732 ?_G667)) (at_goal(in ?_G884 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G732 ?_G703)) (at_start(ontable ?_G884 ?_G703)) (throughout(blue ?_G884)) (throughout(pile ?_G667)) (throughout(red ?_G732)))-())
      (forall
      (!pick ?_G653 ?_G1036 ?_G703) (((at_goal(in ?_G1036 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G1036 ?_G703)) (throughout(red ?_G1036)) (throughout(table ?_G703)))-())
      (!stack ?_G653 ?_G1036 ?_G884 ?_G667) (((at_goal(in ?_G884 ?_G667)) (at_goal(in ?_G1036 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G884 ?_G703)) (at_start(ontable ?_G1036 ?_G703)) (throughout(blue ?_G884)) (throughout(pile ?_G667)) (throughout(red ?_G1036)))-())
      (!pick ?_G653 ?_G1188 ?_G703) (((at_goal(in ?_G1188 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G1188 ?_G703)) (throughout(blue ?_G1188)) (throughout(table ?_G703)))-())
      (!stack ?_G653 ?_G1188 ?_G1036 ?_G667) (((at_goal(in ?_G1036 ?_G667)) (at_goal(in ?_G1188 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G1036 ?_G703)) (at_start(ontable ?_G1188 ?_G703)) (throughout(blue ?_G1188)) (throughout(pile ?_G667)) (throughout(red ?_G1036)))-()))
      (!pick ?_G653 ?_G1948 ?_G703) (((at_goal(in ?_G1948 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G1948 ?_G703)) (throughout(red ?_G1948)) (throughout(table ?_G703)))-())
      (!stack ?_G653 ?_G1948 ?_G1796 ?_G667) (((at_goal(in ?_G1796 ?_G667)) (at_goal(in ?_G1948 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G1796 ?_G703)) (at_start(ontable ?_G1948 ?_G703)) (throughout(blue ?_G1796)) (throughout(pile ?_G667)) (throughout(red ?_G1948)))-())
      (!pick ?_G653 ?_G2100 ?_G703) (((at_goal(in ?_G2100 ?_G667)) (at_goal(top ?_G2100 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G2100 ?_G703)) (throughout(blue ?_G2100)) (throughout(table ?_G703)))-())
      (!stack ?_G653 ?_G2100 ?_G1948 ?_G667) (((at_goal(in ?_G1948 ?_G667)) (at_goal(in ?_G2100 ?_G667)) (at_goal(top ?_G2100 ?_G667)) (at_start(empty ?_G653)) (at_start(ontable ?_G1948 ?_G703)) (at_start(ontable ?_G2100 ?_G703)) (throughout(blue ?_G2100)) (throughout(pile ?_G667)) (throughout(red ?_G1948)))-())
      )))