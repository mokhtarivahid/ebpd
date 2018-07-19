:-assert(activity_schema(
	%%% take_image1(satellite0)
	take_image1,
	[_G237],
	[		[switch_on(_G230,_G237),[[at_start(power_avail(_G237)),throughout(instrument(_G230)),throughout(satellite(_G237)),throughout(on_board(_G230,_G237))]-[]]],
			[turn_to(_G237,_G257,_G264),[[at_start(power_avail(_G237)),at_start(pointing(_G237,_G264)),throughout(direction(_G257)),throughout(direction(_G264)),throughout(satellite(_G237))]-[]]],
			[calibrate(_G237,_G230,_G257),[[at_start(power_avail(_G237)),throughout(direction(_G257)),throughout(instrument(_G230)),throughout(satellite(_G237)),throughout(on_board(_G230,_G237))]-[]]],
			[turn_to(_G237,_G313,_G257),[[at_start(power_avail(_G237)),throughout(direction(_G257)),throughout(direction(_G313)),throughout(satellite(_G237))]-[]]],
			[take_image(_G237,_G313,_G230,_G355),[[at_start(power_avail(_G237)),throughout(direction(_G313)),throughout(instrument(_G230)),throughout(mode(_G355)),throughout(satellite(_G237)),throughout(on_board(_G230,_G237))]-[]]],
			[turn_to(_G237,_G377,_G313),[[at_start(power_avail(_G237)),throughout(direction(_G313)),throughout(direction(_G377)),throughout(satellite(_G237))]-[]]],
			[take_image(_G237,_G377,_G230,_G355),[[at_start(power_avail(_G237)),throughout(direction(_G377)),throughout(instrument(_G230)),throughout(mode(_G355)),throughout(satellite(_G237)),throughout(on_board(_G230,_G237))]-[]]],
			[turn_to(_G237,_G441,_G377),[[at_start(power_avail(_G237)),throughout(direction(_G377)),throughout(direction(_G441)),throughout(satellite(_G237))]-[]]],
			[take_image(_G237,_G441,_G230,_G355),[[at_start(power_avail(_G237)),throughout(direction(_G441)),throughout(instrument(_G230)),throughout(mode(_G355)),throughout(satellite(_G237)),throughout(on_board(_G230,_G237))]-[]]],
			[turn_to(_G237,_G505,_G441),[[at_start(power_avail(_G237)),throughout(direction(_G441)),throughout(direction(_G505)),throughout(satellite(_G237))]-[]]],
			[take_image(_G237,_G505,_G230,_G547),[[at_start(power_avail(_G237)),throughout(direction(_G505)),throughout(instrument(_G230)),throughout(mode(_G547)),throughout(satellite(_G237)),throughout(on_board(_G230,_G237))]-[]]]	],
	[have_image(_G441,_G355),have_image(_G377,_G355),have_image(_G505,_G547),have_image(_G313,_G355)]
)).
