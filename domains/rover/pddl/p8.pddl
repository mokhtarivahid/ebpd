(define (problem roverprob100) (:domain Rover)
(:objects
	general - Lander
	colour high_res low_res - Mode
	rover0 - Rover
	rover0store - Store
	waypoint0 waypoint1 - Waypoint
	camera0 camera1 camera2 camera3 - Camera
	objective0 objective1 objective2 objective3 objective4 objective5 objective6 objective7 objective8 objective9 objective10 objective11 objective12 objective13 objective14 objective15 - Objective
	)
(:init
	(visible waypoint1 waypoint0)
	(visible waypoint0 waypoint1)
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
	(calibration_target camera0 objective7)
	(supports camera0 high_res)
	(on_board camera1 rover0)
	(calibration_target camera1 objective7)
	(supports camera1 colour)
	(supports camera1 high_res)
	(supports camera1 low_res)
	(on_board camera2 rover0)
	(calibration_target camera2 objective11)
	(supports camera2 low_res)
	(on_board camera3 rover0)
	(calibration_target camera3 objective12)
	(supports camera3 colour)
	(supports camera3 low_res)
	(visible_from objective0 waypoint0)
	(visible_from objective1 waypoint0)
	(visible_from objective1 waypoint1)
	(visible_from objective2 waypoint0)
	(visible_from objective3 waypoint0)
	(visible_from objective4 waypoint0)
	(visible_from objective4 waypoint1)
	(visible_from objective5 waypoint0)
	(visible_from objective5 waypoint1)
	(visible_from objective6 waypoint0)
	(visible_from objective7 waypoint0)
	(visible_from objective8 waypoint0)
	(visible_from objective8 waypoint1)
	(visible_from objective9 waypoint0)
	(visible_from objective10 waypoint0)
	(visible_from objective10 waypoint1)
	(visible_from objective11 waypoint0)
	(visible_from objective12 waypoint0)
	(visible_from objective13 waypoint0)
	(visible_from objective14 waypoint0)
	(visible_from objective14 waypoint1)
	(visible_from objective15 waypoint0)
	(visible_from objective15 waypoint1)
)

(:goal (and
(communicated_image_data objective4 low_res)
(communicated_image_data objective2 low_res)
(communicated_image_data objective15 high_res)
(communicated_image_data objective9 high_res)
(communicated_image_data objective5 low_res)
	)
)
)
