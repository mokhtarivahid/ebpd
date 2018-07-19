(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(t1,p1)
   :parameters  (?_G1119 ?_G1155)
   :abstract-plan
     ((!pick ?_G1112 ?_G1119) (((at_start(ontable ?_G1112 ?_G1119)) (throughout(block ?_G1112)) (throughout(blue ?_G1112)) (throughout(table ?_G1119)))-())
      (!stack ?_G1112 ?_G1191 ?_G1155) (((at_start(ontable ?_G1112 ?_G1119)) (at_start(top ?_G1191 ?_G1155)) (throughout(block ?_G1112)) (throughout(blue ?_G1112)) (throughout(pallet ?_G1191)) (throughout(pile ?_G1155)))-())
      (forall
      (!pick ?_G1264 ?_G1119) (((at_start(ontable ?_G1264 ?_G1119)) (throughout(block ?_G1264)) (throughout(blue ?_G1264)) (throughout(table ?_G1119)))-())
      (!stack ?_G1264 ?_G1112 ?_G1155) (((at_start(ontable ?_G1112 ?_G1119)) (at_start(ontable ?_G1264 ?_G1119)) (throughout(block ?_G1112)) (throughout(block ?_G1264)) (throughout(blue ?_G1112)) (throughout(blue ?_G1264)) (throughout(pile ?_G1155)))-()))
      (!pick ?_G2632 ?_G1119) (((at_start(ontable ?_G2632 ?_G1119)) (throughout(block ?_G2632)) (throughout(red ?_G2632)) (throughout(table ?_G1119)))-())
      (!stack ?_G2632 ?_G2480 ?_G1155) (((at_start(ontable ?_G2480 ?_G1119)) (at_start(ontable ?_G2632 ?_G1119)) (throughout(block ?_G2480)) (throughout(block ?_G2632)) (throughout(blue ?_G2480)) (throughout(pile ?_G1155)) (throughout(red ?_G2632)))-())
      (forall
      (!pick ?_G2784 ?_G1119) (((at_start(ontable ?_G2784 ?_G1119)) (throughout(block ?_G2784)) (throughout(red ?_G2784)) (throughout(table ?_G1119)))-())
      (!stack ?_G2784 ?_G2632 ?_G1155) (((at_start(ontable ?_G2632 ?_G1119)) (at_start(ontable ?_G2784 ?_G1119)) (throughout(block ?_G2632)) (throughout(block ?_G2784)) (throughout(pile ?_G1155)) (throughout(red ?_G2632)) (throughout(red ?_G2784)))-()))
      (!pick ?_G4000 ?_G1119) (((at_goal(top ?_G4000 ?_G1155)) (at_start(ontable ?_G4000 ?_G1119)) (throughout(block ?_G4000)) (throughout(red ?_G4000)) (throughout(table ?_G1119)))-())
      (!stack ?_G4000 ?_G3848 ?_G1155) (((at_goal(top ?_G4000 ?_G1155)) (at_start(ontable ?_G3848 ?_G1119)) (at_start(ontable ?_G4000 ?_G1119)) (throughout(block ?_G3848)) (throughout(block ?_G4000)) (throughout(pile ?_G1155)) (throughout(red ?_G3848)) (throughout(red ?_G4000)))-())
      )))