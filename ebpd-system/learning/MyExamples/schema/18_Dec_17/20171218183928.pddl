(robot_activity_schema
  (:domain race)
  (:method clean        ;;; clean(table1,tray1)
   :parameters  (?_G231 ?_G259)
   :abstract-plan
     ((!pick ?_G217 ?_G224 ?_G231) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G224 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G224 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G224)) (throughout(table ?_G231)))-())
      (!place ?_G217 ?_G224 ?_G259) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G224 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G224 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G224)) (throughout(tray ?_G259)))-())
      (!pick ?_G217 ?_G336 ?_G231) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G336 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G336 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G336)) (throughout(table ?_G231)))-())
      (!place ?_G217 ?_G336 ?_G259) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G336 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G336 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G336)) (throughout(tray ?_G259)))-())
      (!pick ?_G217 ?_G448 ?_G231) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G448 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G448 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G448)) (throughout(table ?_G231)))-())
      (!place ?_G217 ?_G448 ?_G259) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G448 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G448 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G448)) (throughout(tray ?_G259)))-())
      (!pick ?_G217 ?_G560 ?_G231) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G560 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G560 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G560)) (throughout(table ?_G231)))-())
      (!place ?_G217 ?_G560 ?_G259) (((at_goal(free ?_G217)) (at_goal(at ?_G217 ?_G259)) (at_goal(in ?_G560 ?_G259)) (at_start(free ?_G217)) (at_start(at ?_G217 ?_G231)) (at_start(on ?_G560 ?_G231)) (throughout(arm ?_G217)) (throughout(bottle ?_G560)) (throughout(tray ?_G259)))-())
      )))