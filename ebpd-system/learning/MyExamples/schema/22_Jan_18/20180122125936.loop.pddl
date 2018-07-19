(robot_activity_schema
  (:domain race)
  (:method unstack_stack        ;;; unstack_stack(p1,p2)
   :parameters  (?_G932 ?_G2380)
   :abstract-plan
     ((!unstack ?_G918 ?_G961 ?_G968 ?_G932) (((at_goal(in ?_G961 ?_G2380)) (at_goal(in ?_G968 ?_G2380)) (at_goal(top ?_G961 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G961 ?_G932)) (at_start(in ?_G968 ?_G932)) (at_start(top ?_G961 ?_G932)) (throughout(blue ?_G961)) (throughout(blue ?_G968)) (throughout(pile ?_G932)))-())
      (!put ?_G918 ?_G961 ?_G925) (((at_goal(in ?_G961 ?_G2380)) (at_goal(top ?_G961 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G961 ?_G932)) (at_start(top ?_G961 ?_G932)) (throughout(blue ?_G961)) (throughout(table ?_G925)))-())
      (forall
      (!unstack ?_G918 ?_G968 ?_G1120 ?_G932) (((at_goal(in ?_G968 ?_G2380)) (at_goal(in ?_G1120 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G968 ?_G932)) (at_start(in ?_G1120 ?_G932)) (throughout(blue ?_G968)) (throughout(blue ?_G1120)) (throughout(pile ?_G932)))-())
      (!put ?_G918 ?_G968 ?_G925) (((at_goal(in ?_G968 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G968 ?_G932)) (throughout(blue ?_G968)) (throughout(table ?_G925)))-()))
      (!unstack ?_G918 ?_G1424 ?_G1576 ?_G932) (((at_goal(in ?_G1424 ?_G2380)) (at_goal(in ?_G1576 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G1424 ?_G932)) (at_start(in ?_G1576 ?_G932)) (throughout(blue ?_G1424)) (throughout(pile ?_G932)) (throughout(red ?_G1576)))-())
      (!put ?_G918 ?_G1424 ?_G925) (((at_goal(in ?_G1424 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G1424 ?_G932)) (throughout(blue ?_G1424)) (throughout(table ?_G925)))-())
      (forall
      (!unstack ?_G918 ?_G1576 ?_G1728 ?_G932) (((at_goal(in ?_G1576 ?_G2380)) (at_goal(in ?_G1728 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G1576 ?_G932)) (at_start(in ?_G1728 ?_G932)) (throughout(pile ?_G932)) (throughout(red ?_G1576)) (throughout(red ?_G1728)))-())
      (!put ?_G918 ?_G1576 ?_G925) (((at_goal(in ?_G1576 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G1576 ?_G932)) (throughout(red ?_G1576)) (throughout(table ?_G925)))-()))
      (!unstack ?_G918 ?_G2184 ?_G2336 ?_G932) (((at_goal(in ?_G2184 ?_G2380)) (at_goal(top ?_G2336 ?_G932)) (at_start(empty ?_G918)) (at_start(in ?_G2184 ?_G932)) (throughout(pallet ?_G2336)) (throughout(pile ?_G932)) (throughout(red ?_G2184)))-())
      (!stack ?_G918 ?_G2184 ?_G2416 ?_G2380) (((at_goal(in ?_G2184 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G2184 ?_G932)) (at_start(top ?_G2416 ?_G2380)) (throughout(pallet ?_G2416)) (throughout(pile ?_G2380)) (throughout(red ?_G2184)))-())
      (forall
      (!pick ?_G918 ?_G1424 ?_G925) (((at_goal(in ?_G1424 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G1424 ?_G932)) (throughout(blue ?_G1424)) (throughout(table ?_G925)))-())
      (!stack ?_G918 ?_G1424 ?_G2184 ?_G2380) (((at_goal(in ?_G1424 ?_G2380)) (at_goal(in ?_G2184 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G1424 ?_G932)) (at_start(in ?_G2184 ?_G932)) (throughout(blue ?_G1424)) (throughout(pile ?_G2380)) (throughout(red ?_G2184)))-())
      (!pick ?_G918 ?_G2032 ?_G925) (((at_goal(in ?_G2032 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G2032 ?_G932)) (throughout(red ?_G2032)) (throughout(table ?_G925)))-())
      (!stack ?_G918 ?_G2032 ?_G1424 ?_G2380) (((at_goal(in ?_G1424 ?_G2380)) (at_goal(in ?_G2032 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G1424 ?_G932)) (at_start(in ?_G2032 ?_G932)) (throughout(blue ?_G1424)) (throughout(pile ?_G2380)) (throughout(red ?_G2032)))-()))
      (!pick ?_G918 ?_G961 ?_G925) (((at_goal(in ?_G961 ?_G2380)) (at_goal(top ?_G961 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G961 ?_G932)) (at_start(top ?_G961 ?_G932)) (throughout(blue ?_G961)) (throughout(table ?_G925)))-())
      (!stack ?_G918 ?_G961 ?_G1576 ?_G2380) (((at_goal(in ?_G961 ?_G2380)) (at_goal(in ?_G1576 ?_G2380)) (at_goal(top ?_G961 ?_G2380)) (at_start(empty ?_G918)) (at_start(in ?_G961 ?_G932)) (at_start(in ?_G1576 ?_G932)) (at_start(top ?_G961 ?_G932)) (throughout(blue ?_G961)) (throughout(pile ?_G2380)) (throughout(red ?_G1576)))-())
      )))