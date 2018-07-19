(robot_activity_schema
  (:domain race)
  (:method clean        ;;; clean(table1,tray1)
   :parameters  (?_G231 ?_G259)
   :abstract-plan
     ((forall
      (!pick ?_G217 ?_G224 ?_G231) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G224 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G224 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G224)) (throughout(table ?_G231)))-())
      (!place ?_G217 ?_G224 ?_G259) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G224 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G224 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G224)) (throughout(tray ?_G259)))-()))
      )))