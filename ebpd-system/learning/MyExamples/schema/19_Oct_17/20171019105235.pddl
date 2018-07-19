(robot_activity_schema
  (:domain race)
  (:method c2_2        ;;; c2_2(office1,office2)
   :parameters  (?_G319 ?_G699)
   :abstract-plan
     ((!load ?_G341 ?_G305 ?_G319) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(location ?_G319)) (throughout(object ?_G341)) (throughout(truck ?_G305)) (throughout(vehicle ?_G305)))-())
      (!load ?_G369 ?_G305 ?_G319) (((at_goal(at ?_G369 ?_G699)) (at_start(at ?_G369 ?_G319)) (throughout(location ?_G319)) (throughout(object ?_G369)) (throughout(truck ?_G305)) (throughout(vehicle ?_G305)))-())
      (!unload ?_G341 ?_G305 ?_G312) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airport ?_G312)) (throughout(location ?_G312)) (throughout(object ?_G341)) (throughout(truck ?_G305)) (throughout(vehicle ?_G305)))-())
      (!unload ?_G369 ?_G305 ?_G312) (((at_goal(at ?_G369 ?_G699)) (at_start(at ?_G369 ?_G319)) (throughout(airport ?_G312)) (throughout(location ?_G312)) (throughout(object ?_G369)) (throughout(truck ?_G305)) (throughout(vehicle ?_G305)))-())
      (!load ?_G341 ?_G496 ?_G312) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airplane ?_G496)) (throughout(airport ?_G312)) (throughout(location ?_G312)) (throughout(object ?_G341)) (throughout(vehicle ?_G496)))-())
      (!load ?_G369 ?_G496 ?_G312) (((at_goal(at ?_G369 ?_G699)) (at_start(at ?_G369 ?_G319)) (throughout(airplane ?_G496)) (throughout(airport ?_G312)) (throughout(location ?_G312)) (throughout(object ?_G369)) (throughout(vehicle ?_G496)))-())
      (!unload ?_G341 ?_G496 ?_G559) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airplane ?_G496)) (throughout(airport ?_G559)) (throughout(location ?_G559)) (throughout(object ?_G341)) (throughout(vehicle ?_G496)))-())
      (!unload ?_G369 ?_G496 ?_G559) (((at_goal(at ?_G369 ?_G699)) (at_start(at ?_G369 ?_G319)) (throughout(airplane ?_G496)) (throughout(airport ?_G559)) (throughout(location ?_G559)) (throughout(object ?_G369)) (throughout(vehicle ?_G496)))-())
      (!load ?_G341 ?_G636 ?_G559) (((at_goal(at ?_G341 ?_G699)) (at_goal(at ?_G636 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airport ?_G559)) (throughout(location ?_G559)) (throughout(object ?_G341)) (throughout(truck ?_G636)) (throughout(vehicle ?_G636)))-())
      (!load ?_G369 ?_G636 ?_G559) (((at_goal(at ?_G369 ?_G699)) (at_goal(at ?_G636 ?_G699)) (at_start(at ?_G369 ?_G319)) (throughout(airport ?_G559)) (throughout(location ?_G559)) (throughout(object ?_G369)) (throughout(truck ?_G636)) (throughout(vehicle ?_G636)))-())
      (!unload ?_G341 ?_G636 ?_G699) (((at_goal(at ?_G341 ?_G699)) (at_goal(at ?_G636 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(location ?_G699)) (throughout(object ?_G341)) (throughout(truck ?_G636)) (throughout(vehicle ?_G636)))-())
      (!unload ?_G369 ?_G636 ?_G699) (((at_goal(at ?_G369 ?_G699)) (at_goal(at ?_G636 ?_G699)) (at_start(at ?_G369 ?_G319)) (throughout(location ?_G699)) (throughout(object ?_G369)) (throughout(truck ?_G636)) (throughout(vehicle ?_G636)))-())
      )))