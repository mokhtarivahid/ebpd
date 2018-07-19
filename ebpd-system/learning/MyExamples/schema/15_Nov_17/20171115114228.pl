:-assert(activity_schema(
	%%% take_image2(satellite0)
	take_image2,
	[_G233],
	[		[switch_on(_G226,_G233),[[at_start(power_avail(_G233)),throughout(instrument(_G226)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]],
			[calibrate(_G233,_G226,_G260),[[at_start(power_avail(_G233)),at_start(pointing(_G233,_G260)),throughout(direction(_G260)),throughout(instrument(_G226)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]],
			[turn_to(_G233,_G281,_G260),[[at_start(power_avail(_G233)),at_start(pointing(_G233,_G260)),throughout(direction(_G260)),throughout(direction(_G281)),throughout(satellite(_G233))]-[]]],
			[take_image(_G233,_G281,_G226,_G323),[[at_start(power_avail(_G233)),throughout(direction(_G281)),throughout(instrument(_G226)),throughout(mode(_G323)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]],
			[turn_to(_G233,_G345,_G281),[[at_start(power_avail(_G233)),throughout(direction(_G281)),throughout(direction(_G345)),throughout(satellite(_G233))]-[]]],
			[take_image(_G233,_G345,_G226,_G323),[[at_start(power_avail(_G233)),throughout(direction(_G345)),throughout(instrument(_G226)),throughout(mode(_G323)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]],
			[turn_to(_G233,_G409,_G345),[[at_start(power_avail(_G233)),throughout(direction(_G345)),throughout(direction(_G409)),throughout(satellite(_G233))]-[]]],
			[take_image(_G233,_G409,_G226,_G323),[[at_start(power_avail(_G233)),throughout(direction(_G409)),throughout(instrument(_G226)),throughout(mode(_G323)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]],
			[turn_to(_G233,_G473,_G409),[[at_start(power_avail(_G233)),throughout(direction(_G409)),throughout(direction(_G473)),throughout(satellite(_G233))]-[]]],
			[take_image(_G233,_G473,_G226,_G515),[[at_start(power_avail(_G233)),throughout(direction(_G473)),throughout(instrument(_G226)),throughout(mode(_G515)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]]	],
	[have_image(_G409,_G323),have_image(_G345,_G323),have_image(_G473,_G515),have_image(_G281,_G323)]
)).
