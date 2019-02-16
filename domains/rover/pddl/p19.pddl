(define (problem roverprob100) (:domain Rover)
(:objects
	general - Lander
	colour high_res low_res - Mode
	rover0 - Rover
	rover0store - Store
	waypoint0 waypoint1 - Waypoint
	camera0 camera1 - Camera
	objective0 objective1 objective2 objective3 objective4 - Objective
	)
(:init
	(visible waypoint1 waypoint0)
	(visible waypoint0 waypoint1)
	(at_soil_sample waypoint0)
	(at_rock_sample waypoint1)
	(at_lander general waypoint0)
	(channel_free general)
	(at rover0 waypoint0)
	(available rover0)
	(store_of rover0store rover0)
	(empty rover0store)
	(equipped_for_soil_analysis rover0)
	(equipped_for_imaging rover0)
	(can_traverse rover0 waypoint0 waypoint1)
	(can_traverse rover0 waypoint1 waypoint0)
	(on_board camera0 rover0)
	(calibration_target camera0 objective2)
	(supports camera0 high_res)
	(on_board camera1 rover0)
	(calibration_target camera1 objective2)
	(supports camera1 colour)
	(supports camera1 high_res)
	(supports camera1 low_res)
	(visible_from objective0 waypoint0)
	(visible_from objective0 waypoint1)
	(visible_from objective1 waypoint0)
	(visible_from objective1 waypoint1)
	(visible_from objective2 waypoint0)
	(visible_from objective3 waypoint0)
	(visible_from objective3 waypoint1)
	(visible_from objective4 waypoint0)
)

(:goal (and
(communicated_soil_data waypoint0)
(communicated_image_data objective0 low_res)
(communicated_image_data objective3 high_res)
(communicated_image_data objective1 colour)
	)
)
)
