:-assert(activity_schema(
	%%% take_image(satellite0)
	take_image,
	[_G438],
	[		[turn_to(_G438,_G445,_G452),[[at_start(power_avail(_G438)),at_start(pointing(_G438,_G452)),throughout(direction(_G445)),throughout(direction(_G452)),throughout(satellite(_G438))]-[]]],
			[switch_on(_G466,_G438),[[at_start(power_avail(_G438)),throughout(instrument(_G466)),throughout(satellite(_G438)),throughout(on_board(_G466,_G438))]-[]]],
			[calibrate(_G438,_G466,_G445),[[at_start(power_avail(_G438)),throughout(direction(_G445)),throughout(instrument(_G466)),throughout(satellite(_G438)),throughout(on_board(_G466,_G438))]-[]]],
			[[turn_to(_G438,_G521,_G445),[[at_start(power_avail(_G438)),throughout(direction(_G445)),throughout(direction(_G521)),throughout(satellite(_G438))]-[]]],[take_image(_G438,_G521,_G466,_G563),[[at_start(power_avail(_G438)),throughout(direction(_G521)),throughout(instrument(_G466)),throughout(mode(_G563)),throughout(satellite(_G438)),throughout(on_board(_G466,_G438))]-[]]]]	],
	[have_image(_G521,_G563),have_image(_G585,_G563),have_image(_G649,_G691),have_image(_G713,_G691),have_image(_G777,_G563),have_image(_G841,_G691),have_image(_G905,_G691),have_image(_G969,_G1011),have_image(_G1033,_G691)]
)).
