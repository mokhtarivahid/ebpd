:-assert(activity_schema(
	%%% take_image_4(satellite0)
	take_image_4,
	[_G308],
	[		[switch_on(_G301,_G308),[[at_start(power_avail(_G308)),throughout(instrument(_G301)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[calibrate(_G308,_G301,_G335),[[at_start(power_avail(_G308)),at_start(pointing(_G308,_G335)),throughout(direction(_G335)),throughout(instrument(_G301)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[turn_to(_G308,_G356,_G335),[[at_start(power_avail(_G308)),at_start(pointing(_G308,_G335)),throughout(direction(_G335)),throughout(direction(_G356)),throughout(satellite(_G308))]-[]]],
			[take_image(_G308,_G356,_G301,_G398),[[at_start(power_avail(_G308)),throughout(direction(_G356)),throughout(instrument(_G301)),throughout(mode(_G398)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[turn_to(_G308,_G420,_G356),[[at_start(power_avail(_G308)),throughout(direction(_G356)),throughout(direction(_G420)),throughout(satellite(_G308))]-[]]],
			[take_image(_G308,_G420,_G301,_G398),[[at_start(power_avail(_G308)),throughout(direction(_G420)),throughout(instrument(_G301)),throughout(mode(_G398)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[turn_to(_G308,_G484,_G420),[[at_start(power_avail(_G308)),throughout(direction(_G420)),throughout(direction(_G484)),throughout(satellite(_G308))]-[]]],
			[take_image(_G308,_G484,_G301,_G398),[[at_start(power_avail(_G308)),throughout(direction(_G484)),throughout(instrument(_G301)),throughout(mode(_G398)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[switch_off(_G301,_G308),[[at_start(power_avail(_G308)),throughout(instrument(_G301)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[switch_on(_G561,_G308),[[at_start(power_avail(_G308)),throughout(instrument(_G561)),throughout(satellite(_G308)),throughout(on_board(_G561,_G308))]-[]]],
			[calibrate(_G308,_G561,_G484),[[at_start(power_avail(_G308)),throughout(direction(_G484)),throughout(instrument(_G561)),throughout(satellite(_G308)),throughout(on_board(_G561,_G308))]-[]]],
			[turn_to(_G308,_G616,_G484),[[at_start(power_avail(_G308)),throughout(direction(_G484)),throughout(direction(_G616)),throughout(satellite(_G308))]-[]]],
			[take_image(_G308,_G616,_G561,_G658),[[at_start(power_avail(_G308)),throughout(direction(_G616)),throughout(instrument(_G561)),throughout(mode(_G658)),throughout(satellite(_G308)),throughout(on_board(_G561,_G308))]-[]]],
			[turn_to(_G308,_G680,_G616),[[at_start(power_avail(_G308)),throughout(direction(_G616)),throughout(direction(_G680)),throughout(satellite(_G308))]-[]]],
			[take_image(_G308,_G680,_G561,_G722),[[at_start(power_avail(_G308)),throughout(direction(_G680)),throughout(instrument(_G561)),throughout(mode(_G722)),throughout(satellite(_G308)),throughout(on_board(_G561,_G308))]-[]]],
			[turn_to(_G308,_G744,_G680),[[at_start(power_avail(_G308)),throughout(direction(_G680)),throughout(direction(_G744)),throughout(satellite(_G308))]-[]]],
			[take_image(_G308,_G744,_G561,_G722),[[at_start(power_avail(_G308)),throughout(direction(_G744)),throughout(instrument(_G561)),throughout(mode(_G722)),throughout(satellite(_G308)),throughout(on_board(_G561,_G308))]-[]]]	],
	[have_image(_G616,_G658),have_image(_G680,_G722),have_image(_G744,_G722),have_image(_G420,_G398),have_image(_G356,_G398),have_image(_G484,_G398)]
)).
