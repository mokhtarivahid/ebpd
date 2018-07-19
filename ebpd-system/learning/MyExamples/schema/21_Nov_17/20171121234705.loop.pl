:-assert(activity_schema(
	%%% take_image(satellite0)
	take_image,
	[_G518],
	[		[turn_to(_G518,_G525,_G532),[[at_start(power_avail(_G518)),at_start(pointing(_G518,_G532)),throughout(direction(_G525)),throughout(direction(_G532)),throughout(satellite(_G518))]-[]]],
			[switch_on(_G546,_G518),[[at_start(power_avail(_G518)),throughout(instrument(_G546)),throughout(satellite(_G518)),throughout(on_board(_G546,_G518))]-[]]],
			[calibrate(_G518,_G546,_G525),[[at_start(power_avail(_G518)),throughout(direction(_G525)),throughout(instrument(_G546)),throughout(satellite(_G518)),throughout(on_board(_G546,_G518))]-[]]],
			[[turn_to(_G518,_G601,_G525),[[at_start(power_avail(_G518)),throughout(direction(_G525)),throughout(direction(_G601)),throughout(satellite(_G518))]-[]]],[take_image(_G518,_G601,_G546,_G643),[[at_start(power_avail(_G518)),throughout(direction(_G601)),throughout(instrument(_G546)),throughout(mode(_G643)),throughout(satellite(_G518)),throughout(on_board(_G546,_G518))]-[]]]],
			[switch_off(_G546,_G518),[[at_start(power_avail(_G518)),throughout(instrument(_G546)),throughout(satellite(_G518)),throughout(on_board(_G546,_G518))]-[]]],
			[turn_to(_G518,_G813,_G729),[[at_start(power_avail(_G518)),throughout(direction(_G729)),throughout(direction(_G813)),throughout(satellite(_G518))]-[]]],
			[switch_on(_G834,_G518),[[at_start(power_avail(_G518)),throughout(instrument(_G834)),throughout(satellite(_G518)),throughout(on_board(_G834,_G518))]-[]]],
			[calibrate(_G518,_G834,_G813),[[at_start(power_avail(_G518)),throughout(direction(_G813)),throughout(instrument(_G834)),throughout(satellite(_G518)),throughout(on_board(_G834,_G518))]-[]]],
			[[turn_to(_G518,_G889,_G813),[[at_start(power_avail(_G518)),throughout(direction(_G813)),throughout(direction(_G889)),throughout(satellite(_G518))]-[]]],[take_image(_G518,_G889,_G834,_G931),[[at_start(power_avail(_G518)),throughout(direction(_G889)),throughout(instrument(_G834)),throughout(mode(_G931)),throughout(satellite(_G518)),throughout(on_board(_G834,_G518))]-[]]]]	],
	[have_image(_G889,_G931),have_image(_G601,_G643),have_image(_G665,_G707),have_image(_G953,_G931),have_image(_G1017,_G931),have_image(_G729,_G707),have_image(_G1081,_G931)]
)).
