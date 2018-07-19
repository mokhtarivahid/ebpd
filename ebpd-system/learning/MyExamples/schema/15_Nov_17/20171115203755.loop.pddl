(robot_activity_schema
  (:domain race)
  (:method logistic        ;;; logistic(office1,office2)
   :parameters  (?_G319 ?_G699)
   :abstract-plan
     ((!drive ?_G305 ?_G312 ?_G319 ?_G326) (((throughout(airport ?_G312)) (throughout(city ?_G326)) (throughout(location ?_G312)) (throughout(location ?_G319)) (throughout(truck ?_G305)) (throughout(vehicle ?_G305)) (throughout(loc ?_G319 ?_G326)))-())
      (forall
      (!load ?_G341 ?_G305 ?_G319) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(location ?_G319)) (throughout(object ?_G341)) (throughout(truck ?_G305)) (throughout(vehicle ?_G305)))-()))
      (!drive ?_G305 ?_G319 ?_G312 ?_G326) (((throughout(airport ?_G312)) (throughout(city ?_G326)) (throughout(location ?_G312)) (throughout(location ?_G319)) (throughout(truck ?_G305)) (throughout(vehicle ?_G305)) (throughout(loc ?_G319 ?_G326)))-())
      (forall
      (!unload ?_G341 ?_G305 ?_G312) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airport ?_G312)) (throughout(location ?_G312)) (throughout(object ?_G341)) (throughout(truck ?_G305)) (throughout(vehicle ?_G305)))-()))
      (forall
      (!load ?_G341 ?_G496 ?_G312) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airplane ?_G496)) (throughout(airport ?_G312)) (throughout(location ?_G312)) (throughout(object ?_G341)) (throughout(vehicle ?_G496)))-()))
      (!fly ?_G496 ?_G312 ?_G559) (((throughout(airplane ?_G496)) (throughout(airport ?_G312)) (throughout(airport ?_G559)) (throughout(location ?_G312)) (throughout(location ?_G559)) (throughout(vehicle ?_G496)))-())
      (forall
      (!unload ?_G341 ?_G496 ?_G559) (((at_goal(at ?_G341 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airplane ?_G496)) (throughout(airport ?_G559)) (throughout(location ?_G559)) (throughout(object ?_G341)) (throughout(vehicle ?_G496)))-()))
      (forall
      (!load ?_G341 ?_G636 ?_G559) (((at_goal(at ?_G341 ?_G699)) (at_goal(at ?_G636 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(airport ?_G559)) (throughout(location ?_G559)) (throughout(object ?_G341)) (throughout(truck ?_G636)) (throughout(vehicle ?_G636)))-()))
      (!drive ?_G636 ?_G559 ?_G699 ?_G706) (((at_goal(at ?_G636 ?_G699)) (throughout(airport ?_G559)) (throughout(city ?_G706)) (throughout(location ?_G559)) (throughout(location ?_G699)) (throughout(truck ?_G636)) (throughout(vehicle ?_G636)) (throughout(loc ?_G699 ?_G706)))-())
      (forall
      (!unload ?_G341 ?_G636 ?_G699) (((at_goal(at ?_G341 ?_G699)) (at_goal(at ?_G636 ?_G699)) (at_start(at ?_G341 ?_G319)) (throughout(location ?_G699)) (throughout(object ?_G341)) (throughout(truck ?_G636)) (throughout(vehicle ?_G636)))-()))
      )))