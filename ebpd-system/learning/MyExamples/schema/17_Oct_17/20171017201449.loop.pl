:-assert(activity_schema(
	%%% communicated_soil_rock_image(waypoint1,waypoint2,waypoint0,waypoint1,objective0,high_res,objective2,high_res,objective0,colour)
	communicated_soil_rock_image,
	[_G889,_G1437,_G832,_G889,_G1089,_G1479,_G1465,_G1479,_G1089,_G1103],
	[		[calibrate(_G825,_G832),[[at_goal(communicated_rock_data(_G832)),at_start(at_rock_sample(_G832)),throughout(visible(_G832,_G889)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G832)),throughout(visible(_G1437,_G832)),throughout(visible_from(_G825,_G832)),throughout(visible_from(_G825,_G889)),throughout(visible_from(_G825,_G1437)),throughout(visible_from(_G1089,_G832)),throughout(visible_from(_G1465,_G832))]-[]]],
			[sample(_G832),[[at_goal(communicated_rock_data(_G832)),at_start(at_rock_sample(_G832)),throughout(visible(_G832,_G889)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G832)),throughout(visible(_G1437,_G832)),throughout(visible_from(_G1089,_G832)),throughout(visible_from(_G1465,_G832))]-[]]],
			[communicate(_G832),[[at_goal(communicated_rock_data(_G832)),at_start(at_rock_sample(_G832)),throughout(visible(_G832,_G889)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G832)),throughout(visible(_G1437,_G832)),throughout(visible_from(_G1089,_G832)),throughout(visible_from(_G1465,_G832))]-[]]],
			[sample(_G889),[[at_goal(communicated_rock_data(_G889)),at_goal(communicated_soil_data(_G889)),at_start(at_rock_sample(_G889)),at_start(at_soil_sample(_G889)),throughout(visible(_G832,_G889)),throughout(visible(_G889,_G832)),throughout(visible(_G889,_G1437)),throughout(visible(_G1437,_G889)),throughout(visible_from(_G1089,_G889)),throughout(visible_from(_G1465,_G889))]-[]]],
			[communicate(_G889),[[at_goal(communicated_rock_data(_G889)),at_goal(communicated_soil_data(_G889)),at_start(at_rock_sample(_G889)),at_start(at_soil_sample(_G889)),throughout(visible(_G832,_G889)),throughout(visible(_G889,_G832)),throughout(visible(_G889,_G1437)),throughout(visible(_G1437,_G889)),throughout(visible_from(_G1089,_G889)),throughout(visible_from(_G1465,_G889))]-[]]],
			[[calibrate(_G825,_G832),[[at_goal(communicated_rock_data(_G832)),at_start(at_rock_sample(_G832)),throughout(visible(_G832,_G889)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G832)),throughout(visible(_G1437,_G832)),throughout(visible_from(_G825,_G832)),throughout(visible_from(_G825,_G889)),throughout(visible_from(_G825,_G1437)),throughout(visible_from(_G1089,_G832)),throughout(visible_from(_G1465,_G832))]-[]]],[take(_G832,_G1089,_G1103),[[at_goal(communicated_rock_data(_G832)),at_goal(communicated_image_data(_G1089,_G1103)),at_goal(communicated_image_data(_G1089,_G1479)),at_start(at_rock_sample(_G832)),throughout(visible(_G832,_G889)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G832)),throughout(visible(_G1437,_G832)),throughout(visible_from(_G1089,_G832)),throughout(visible_from(_G1089,_G889)),throughout(visible_from(_G1089,_G1437)),throughout(visible_from(_G1465,_G832))]-[]]],[communicate(_G1089,_G832,_G931),[[at_goal(at_soil_sample(_G931)),at_goal(communicated_rock_data(_G832)),at_goal(communicated_image_data(_G1089,_G1103)),at_goal(communicated_image_data(_G1089,_G1479)),at_start(at_rock_sample(_G832)),at_start(at_soil_sample(_G931)),throughout(visible(_G832,_G889)),throughout(visible(_G832,_G931)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G832)),throughout(visible(_G889,_G931)),throughout(visible(_G931,_G832)),throughout(visible(_G931,_G889)),throughout(visible(_G931,_G1437)),throughout(visible(_G1437,_G832)),throughout(visible(_G1437,_G931)),throughout(visible_from(_G1089,_G832)),throughout(visible_from(_G1089,_G889)),throughout(visible_from(_G1089,_G931)),throughout(visible_from(_G1089,_G1437)),throughout(visible_from(_G1465,_G832))]-[]]]],
			[sample(_G889),[[at_goal(communicated_rock_data(_G889)),at_goal(communicated_soil_data(_G889)),at_start(at_rock_sample(_G889)),at_start(at_soil_sample(_G889)),throughout(visible(_G832,_G889)),throughout(visible(_G889,_G832)),throughout(visible(_G889,_G1437)),throughout(visible(_G1437,_G889)),throughout(visible_from(_G1089,_G889)),throughout(visible_from(_G1465,_G889))]-[]]],
			[communicate(_G889),[[at_goal(communicated_rock_data(_G889)),at_goal(communicated_soil_data(_G889)),at_start(at_rock_sample(_G889)),at_start(at_soil_sample(_G889)),throughout(visible(_G832,_G889)),throughout(visible(_G889,_G832)),throughout(visible(_G889,_G1437)),throughout(visible(_G1437,_G889)),throughout(visible_from(_G1089,_G889)),throughout(visible_from(_G1465,_G889))]-[]]],
			[take(_G1437,_G1465,_G1479),[[at_goal(communicated_soil_data(_G1437)),at_goal(communicated_image_data(_G1089,_G1479)),at_goal(communicated_image_data(_G1465,_G1479)),at_start(at_soil_sample(_G1437)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G1437)),throughout(visible(_G1437,_G832)),throughout(visible(_G1437,_G889)),throughout(visible_from(_G1089,_G1437)),throughout(visible_from(_G1465,_G832)),throughout(visible_from(_G1465,_G889)),throughout(visible_from(_G1465,_G1437))]-[]]],
			[communicate(_G1465,_G1437,_G931),[[at_goal(at_soil_sample(_G931)),at_goal(communicated_soil_data(_G1437)),at_goal(communicated_image_data(_G1465,_G1479)),at_start(at_soil_sample(_G931)),at_start(at_soil_sample(_G1437)),throughout(visible(_G832,_G931)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G931)),throughout(visible(_G889,_G1437)),throughout(visible(_G931,_G832)),throughout(visible(_G931,_G889)),throughout(visible(_G931,_G1437)),throughout(visible(_G1437,_G832)),throughout(visible(_G1437,_G889)),throughout(visible(_G1437,_G931)),throughout(visible_from(_G1089,_G931)),throughout(visible_from(_G1089,_G1437)),throughout(visible_from(_G1465,_G832)),throughout(visible_from(_G1465,_G889)),throughout(visible_from(_G1465,_G1437))]-[]]],
			[sample(_G1437),[[at_goal(communicated_soil_data(_G1437)),at_start(at_soil_sample(_G1437)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G1437)),throughout(visible(_G1437,_G832)),throughout(visible(_G1437,_G889)),throughout(visible_from(_G1089,_G1437)),throughout(visible_from(_G1465,_G1437))]-[]]],
			[communicate(_G1437),[[at_goal(communicated_soil_data(_G1437)),at_start(at_soil_sample(_G1437)),throughout(visible(_G832,_G1437)),throughout(visible(_G889,_G1437)),throughout(visible(_G1437,_G832)),throughout(visible(_G1437,_G889)),throughout(visible_from(_G1089,_G1437)),throughout(visible_from(_G1465,_G1437))]-[]]]	],
	[at_soil_sample(_G931),available(_G847),available(_G811),channel_free(_G910),have_rock_analysis(_G847,_G832),at(_G847,_G889),communicated_rock_data(_G832),full(_G854),have_rock_analysis(_G847,_G889),communicated_rock_data(_G889),have_image(_G811,_G1089,_G1103),communicated_image_data(_G1089,_G1103),have_image(_G811,_G1089,_G1479),communicated_image_data(_G1089,_G1479),have_soil_analysis(_G811,_G889),communicated_soil_data(_G889),at(_G811,_G1437),have_image(_G811,_G1465,_G1479),communicated_image_data(_G1465,_G1479),full(_G1338),have_soil_analysis(_G811,_G1437),communicated_soil_data(_G1437)]
)).
