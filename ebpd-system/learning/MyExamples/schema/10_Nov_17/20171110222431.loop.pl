:-assert(activity_schema(
	%%% take_image(instrument0)
	take_image,
	[_G322],
	[		[switch_on(_G322,_G329),[[at_goal(calibrated(_G322)),at_goal(power_on(_G322)),at_start(power_avail(_G329)),throughout(instrument(_G322)),throughout(satellite(_G329)),throughout(on_board(_G322,_G329))]-[]]],
			[turn_to(_G329,_G349,_G356),[[at_start(power_avail(_G329)),throughout(direction(_G349)),throughout(direction(_G356)),throughout(satellite(_G329)),throughout(calibration_target(_G322,_G349)),throughout(on_board(_G322,_G329))]-[]]],
			[calibrate(_G329,_G322,_G349),[[at_goal(calibrated(_G322)),at_goal(power_on(_G322)),at_start(power_avail(_G329)),throughout(direction(_G349)),throughout(instrument(_G322)),throughout(satellite(_G329)),throughout(calibration_target(_G322,_G349)),throughout(on_board(_G322,_G329))]-[]]],
			[turn_to(_G329,_G356,_G349),[[at_start(power_avail(_G329)),throughout(direction(_G349)),throughout(direction(_G356)),throughout(satellite(_G329)),throughout(calibration_target(_G322,_G349)),throughout(on_board(_G322,_G329))]-[]]],
			[take_image(_G329,_G356,_G322,_G447),[[at_goal(calibrated(_G322)),at_goal(power_on(_G322)),at_start(power_avail(_G329)),throughout(direction(_G356)),throughout(instrument(_G322)),throughout(mode(_G447)),throughout(satellite(_G329)),throughout(on_board(_G322,_G329)),throughout(supports(_G322,_G447))]-[]]],
			[[turn_to(_G329,_G469,_G356),[[at_start(power_avail(_G329)),throughout(direction(_G356)),throughout(direction(_G469)),throughout(satellite(_G329)),throughout(on_board(_G322,_G329))]-[]]],[take_image(_G329,_G469,_G322,_G447),[[at_goal(calibrated(_G322)),at_goal(power_on(_G322)),at_start(power_avail(_G329)),throughout(direction(_G469)),throughout(instrument(_G322)),throughout(mode(_G447)),throughout(satellite(_G329)),throughout(on_board(_G322,_G329)),throughout(supports(_G322,_G447))]-[]]]]	],
	[calibrated(_G322),power_on(_G322),pointing(_G329,_G533),have_image(_G533,_G447),have_image(_G469,_G447),have_image(_G597,_G639),have_image(_G356,_G447)]
)).
