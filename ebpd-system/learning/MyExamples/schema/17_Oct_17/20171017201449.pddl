(robot_activity_schema
  (:domain race)
  (:method communicated_soil_rock_image        ;;; communicated_soil_rock_image(waypoint1,waypoint2,waypoint0,waypoint1,objective0,high_res,objective2,high_res,objective0,colour)
   :parameters  (?_G889 ?_G1437 ?_G832 ?_G889 ?_G1089 ?_G1479 ?_G1465 ?_G1479 ?_G1089 ?_G1103)
   :abstract-plan
     ((!calibrate ?_G825 ?_G832) (((at_goal(communicated_rock_data ?_G832)) (at_start(at_rock_sample ?_G832)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible_from ?_G825 ?_G832)) (throughout(visible_from ?_G825 ?_G889)) (throughout(visible_from ?_G825 ?_G1437)) (throughout(visible_from ?_G1089 ?_G832)) (throughout(visible_from ?_G1465 ?_G832)))-())
      (!sample ?_G832) (((at_goal(communicated_rock_data ?_G832)) (at_start(at_rock_sample ?_G832)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible_from ?_G1089 ?_G832)) (throughout(visible_from ?_G1465 ?_G832)))-())
      (!communicate ?_G832) (((at_goal(communicated_rock_data ?_G832)) (at_start(at_rock_sample ?_G832)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible_from ?_G1089 ?_G832)) (throughout(visible_from ?_G1465 ?_G832)))-())
      (!sample ?_G889) (((at_goal(communicated_rock_data ?_G889)) (at_goal(communicated_soil_data ?_G889)) (at_start(at_rock_sample ?_G889)) (at_start(at_soil_sample ?_G889)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G889 ?_G1437)) (throughout(visible ?_G1437 ?_G889)) (throughout(visible_from ?_G1089 ?_G889)) (throughout(visible_from ?_G1465 ?_G889)))-())
      (!communicate ?_G889) (((at_goal(communicated_rock_data ?_G889)) (at_goal(communicated_soil_data ?_G889)) (at_start(at_rock_sample ?_G889)) (at_start(at_soil_sample ?_G889)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G889 ?_G1437)) (throughout(visible ?_G1437 ?_G889)) (throughout(visible_from ?_G1089 ?_G889)) (throughout(visible_from ?_G1465 ?_G889)))-())
      (!calibrate ?_G825 ?_G832) (((at_goal(communicated_rock_data ?_G832)) (at_start(at_rock_sample ?_G832)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible_from ?_G825 ?_G832)) (throughout(visible_from ?_G825 ?_G889)) (throughout(visible_from ?_G825 ?_G1437)) (throughout(visible_from ?_G1089 ?_G832)) (throughout(visible_from ?_G1465 ?_G832)))-())
      (!take ?_G832 ?_G1089 ?_G1103) (((at_goal(communicated_rock_data ?_G832)) (at_goal(communicated_image_data ?_G1089 ?_G1103)) (at_goal(communicated_image_data ?_G1089 ?_G1479)) (at_start(at_rock_sample ?_G832)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible_from ?_G1089 ?_G832)) (throughout(visible_from ?_G1089 ?_G889)) (throughout(visible_from ?_G1089 ?_G1437)) (throughout(visible_from ?_G1465 ?_G832)))-())
      (!communicate ?_G1089 ?_G832 ?_G931) (((at_goal(at_soil_sample ?_G931)) (at_goal(communicated_rock_data ?_G832)) (at_goal(communicated_image_data ?_G1089 ?_G1103)) (at_goal(communicated_image_data ?_G1089 ?_G1479)) (at_start(at_rock_sample ?_G832)) (at_start(at_soil_sample ?_G931)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G832 ?_G931)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G889 ?_G931)) (throughout(visible ?_G931 ?_G832)) (throughout(visible ?_G931 ?_G889)) (throughout(visible ?_G931 ?_G1437)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible ?_G1437 ?_G931)) (throughout(visible_from ?_G1089 ?_G832)) (throughout(visible_from ?_G1089 ?_G889)) (throughout(visible_from ?_G1089 ?_G931)) (throughout(visible_from ?_G1089 ?_G1437)) (throughout(visible_from ?_G1465 ?_G832)))-())
      (!calibrate ?_G825 ?_G832) (((at_goal(communicated_rock_data ?_G832)) (at_start(at_rock_sample ?_G832)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible_from ?_G825 ?_G832)) (throughout(visible_from ?_G825 ?_G889)) (throughout(visible_from ?_G825 ?_G1437)) (throughout(visible_from ?_G1089 ?_G832)) (throughout(visible_from ?_G1465 ?_G832)))-())
      (!take ?_G832 ?_G1089 ?_G1235) (((at_goal(communicated_rock_data ?_G832)) (at_goal(communicated_image_data ?_G1089 ?_G1103)) (at_goal(communicated_image_data ?_G1089 ?_G1479)) (at_start(at_rock_sample ?_G832)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible_from ?_G1089 ?_G832)) (throughout(visible_from ?_G1089 ?_G889)) (throughout(visible_from ?_G1089 ?_G1437)) (throughout(visible_from ?_G1465 ?_G832)))-())
      (!communicate ?_G1089 ?_G832 ?_G931) (((at_goal(at_soil_sample ?_G931)) (at_goal(communicated_rock_data ?_G832)) (at_goal(communicated_image_data ?_G1089 ?_G1103)) (at_goal(communicated_image_data ?_G1089 ?_G1479)) (at_start(at_rock_sample ?_G832)) (at_start(at_soil_sample ?_G931)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G832 ?_G931)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G889 ?_G931)) (throughout(visible ?_G931 ?_G832)) (throughout(visible ?_G931 ?_G889)) (throughout(visible ?_G931 ?_G1437)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible ?_G1437 ?_G931)) (throughout(visible_from ?_G1089 ?_G832)) (throughout(visible_from ?_G1089 ?_G889)) (throughout(visible_from ?_G1089 ?_G931)) (throughout(visible_from ?_G1089 ?_G1437)) (throughout(visible_from ?_G1465 ?_G832)))-())
      (!sample ?_G889) (((at_goal(communicated_rock_data ?_G889)) (at_goal(communicated_soil_data ?_G889)) (at_start(at_rock_sample ?_G889)) (at_start(at_soil_sample ?_G889)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G889 ?_G1437)) (throughout(visible ?_G1437 ?_G889)) (throughout(visible_from ?_G1089 ?_G889)) (throughout(visible_from ?_G1465 ?_G889)))-())
      (!communicate ?_G889) (((at_goal(communicated_rock_data ?_G889)) (at_goal(communicated_soil_data ?_G889)) (at_start(at_rock_sample ?_G889)) (at_start(at_soil_sample ?_G889)) (throughout(visible ?_G832 ?_G889)) (throughout(visible ?_G889 ?_G832)) (throughout(visible ?_G889 ?_G1437)) (throughout(visible ?_G1437 ?_G889)) (throughout(visible_from ?_G1089 ?_G889)) (throughout(visible_from ?_G1465 ?_G889)))-())
      (!take ?_G1437 ?_G1465 ?_G1479) (((at_goal(communicated_soil_data ?_G1437)) (at_goal(communicated_image_data ?_G1089 ?_G1479)) (at_goal(communicated_image_data ?_G1465 ?_G1479)) (at_start(at_soil_sample ?_G1437)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G1437)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible ?_G1437 ?_G889)) (throughout(visible_from ?_G1089 ?_G1437)) (throughout(visible_from ?_G1465 ?_G832)) (throughout(visible_from ?_G1465 ?_G889)) (throughout(visible_from ?_G1465 ?_G1437)))-())
      (!communicate ?_G1465 ?_G1437 ?_G931) (((at_goal(at_soil_sample ?_G931)) (at_goal(communicated_soil_data ?_G1437)) (at_goal(communicated_image_data ?_G1465 ?_G1479)) (at_start(at_soil_sample ?_G931)) (at_start(at_soil_sample ?_G1437)) (throughout(visible ?_G832 ?_G931)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G931)) (throughout(visible ?_G889 ?_G1437)) (throughout(visible ?_G931 ?_G832)) (throughout(visible ?_G931 ?_G889)) (throughout(visible ?_G931 ?_G1437)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible ?_G1437 ?_G889)) (throughout(visible ?_G1437 ?_G931)) (throughout(visible_from ?_G1089 ?_G931)) (throughout(visible_from ?_G1089 ?_G1437)) (throughout(visible_from ?_G1465 ?_G832)) (throughout(visible_from ?_G1465 ?_G889)) (throughout(visible_from ?_G1465 ?_G1437)))-())
      (!sample ?_G1437) (((at_goal(communicated_soil_data ?_G1437)) (at_start(at_soil_sample ?_G1437)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G1437)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible ?_G1437 ?_G889)) (throughout(visible_from ?_G1089 ?_G1437)) (throughout(visible_from ?_G1465 ?_G1437)))-())
      (!communicate ?_G1437) (((at_goal(communicated_soil_data ?_G1437)) (at_start(at_soil_sample ?_G1437)) (throughout(visible ?_G832 ?_G1437)) (throughout(visible ?_G889 ?_G1437)) (throughout(visible ?_G1437 ?_G832)) (throughout(visible ?_G1437 ?_G889)) (throughout(visible_from ?_G1089 ?_G1437)) (throughout(visible_from ?_G1465 ?_G1437)))-())
      )))