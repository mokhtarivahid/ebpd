(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(t1,p1)
   :parameters  (?_G521 ?_G557)
   :abstract-plan
     ((!pick ?_G507 ?_G514 ?_G521) (((at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G514 ?_G521)) (throughout(blue ?_G514)) (throughout(container ?_G514)) (throughout(hoist ?_G507)) (throughout(table ?_G521)))-())
      (!stack ?_G507 ?_G514 ?_G593 ?_G557) (((at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G514 ?_G521)) (at_start(top ?_G593 ?_G557)) (throughout(blue ?_G514)) (throughout(container ?_G514)) (throughout(hoist ?_G507)) (throughout(pallet ?_G593)) (throughout(pile ?_G557)))-())
      (forall
      (!pick ?_G507 ?_G666 ?_G521) (((at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G666 ?_G521)) (throughout(blue ?_G666)) (throughout(container ?_G666)) (throughout(hoist ?_G507)) (throughout(table ?_G521)))-())
      (!stack ?_G507 ?_G666 ?_G514 ?_G557) (((at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G514 ?_G521)) (at_start(ontable ?_G666 ?_G521)) (throughout(blue ?_G514)) (throughout(blue ?_G666)) (throughout(container ?_G514)) (throughout(container ?_G666)) (throughout(hoist ?_G507)) (throughout(pile ?_G557)))-()))
      (!pick ?_G507 ?_G1122 ?_G521) (((at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G1122 ?_G521)) (throughout(container ?_G1122)) (throughout(hoist ?_G507)) (throughout(red ?_G1122)) (throughout(table ?_G521)))-())
      (!stack ?_G507 ?_G1122 ?_G970 ?_G557) (((at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G970 ?_G521)) (at_start(ontable ?_G1122 ?_G521)) (throughout(blue ?_G970)) (throughout(container ?_G970)) (throughout(container ?_G1122)) (throughout(hoist ?_G507)) (throughout(pile ?_G557)) (throughout(red ?_G1122)))-())
      (forall
      (!pick ?_G507 ?_G1274 ?_G521) (((at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G1274 ?_G521)) (throughout(container ?_G1274)) (throughout(hoist ?_G507)) (throughout(red ?_G1274)) (throughout(table ?_G521)))-())
      (!stack ?_G507 ?_G1274 ?_G1122 ?_G557) (((at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G1122 ?_G521)) (at_start(ontable ?_G1274 ?_G521)) (throughout(container ?_G1122)) (throughout(container ?_G1274)) (throughout(hoist ?_G507)) (throughout(pile ?_G557)) (throughout(red ?_G1122)) (throughout(red ?_G1274)))-()))
      (!pick ?_G507 ?_G1578 ?_G521) (((at_goal(top ?_G1578 ?_G557)) (at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G1578 ?_G521)) (throughout(container ?_G1578)) (throughout(hoist ?_G507)) (throughout(red ?_G1578)) (throughout(table ?_G521)))-())
      (!stack ?_G507 ?_G1578 ?_G1426 ?_G557) (((at_goal(top ?_G1578 ?_G557)) (at_start(empty ?_G507)) (at_start(at ?_G507 ?_G521)) (at_start(ontable ?_G1426 ?_G521)) (at_start(ontable ?_G1578 ?_G521)) (throughout(container ?_G1426)) (throughout(container ?_G1578)) (throughout(hoist ?_G507)) (throughout(pile ?_G557)) (throughout(red ?_G1426)) (throughout(red ?_G1578)))-())
      )))