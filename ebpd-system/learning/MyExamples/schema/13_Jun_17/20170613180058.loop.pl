:-assert(activity_schema(
	%%% clear(mug1,mug2,table1,counter1)
	clear,
	[_G1169,_G1249,_G5431,_G5432],
	[		[move(_G969,_G1041),[[throughout(premanipulationarea(_G969)),throughout(premanipulationarea(_G1041)),throughout(tablepremanipulationarea(_G5431,_G1041))]-[]]],
			[move(_G1041,_G1141),[[throughout(manipulationarea(_G1141)),throughout(premanipulationarea(_G1041)),throughout(tablemanipulationarea(_G5431,_G1141)),throughout(tablepremanipulationarea(_G5431,_G1041))]-[]]],
			[[pick(_G1169,_G1176),[[at_start(objectat(_G1169,_G1176)),at_start(objectat(_G1249,_G1176)),throughout(placingarea(_G1176)),throughout(tableplacingarea(_G5431,_G1176))]-[]]],[place(_G1169,_G1220),[[throughout(tray(_G1220))]-[]]]],
			[move(_G1141,_G1041),[[throughout(manipulationarea(_G1141)),throughout(premanipulationarea(_G1041)),throughout(tablemanipulationarea(_G5431,_G1141)),throughout(tablepremanipulationarea(_G5431,_G1041))]-[]]],
			[move(_G1041,_G1429),[[throughout(premanipulationarea(_G1041)),throughout(premanipulationarea(_G1429)),throughout(tablepremanipulationarea(_G5431,_G1041)),throughout(tablepremanipulationarea(_G5432,_G1429))]-[]]],
			[move(_G1429,_G1529),[[throughout(manipulationarea(_G1529)),throughout(premanipulationarea(_G1429)),throughout(tablemanipulationarea(_G5432,_G1529)),throughout(tablepremanipulationarea(_G5432,_G1429))]-[]]],
			[[pick(_G1249,_G1220),[[throughout(tray(_G1220))]-[]]],[place(_G1249,_G1600),[[at_goal(objectat(_G1169,_G1600)),at_goal(objectat(_G1249,_G1600)),throughout(placingarea(_G1600)),throughout(tableplacingarea(_G5432,_G1600))]-[]]]]	],
	[objectat(_G1169,_G1600),objectat(_G1249,_G1600)]
)).
