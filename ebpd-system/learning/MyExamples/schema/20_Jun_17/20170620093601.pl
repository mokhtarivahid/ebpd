:-assert(activity_schema(
	%%% clear(table1,counter1)
	clear,
	[_G5492,_G5493],
	[		[move(_G1030,_G1102),[[throughout(premanipulationarea(_G1030)),throughout(premanipulationarea(_G1102)),throughout(tablepremanipulationarea(_G5492,_G1102))]-[]]],
			[move(_G1102,_G1202),[[throughout(manipulationarea(_G1202)),throughout(premanipulationarea(_G1102)),throughout(tablemanipulationarea(_G5492,_G1202)),throughout(tablepremanipulationarea(_G5492,_G1102))]-[]]],
			[pick(_G1230,_G1237),[[throughout(leftplacingarea(_G1237)),throughout(placingarea(_G1237)),throughout(tableplacingarea(_G5492,_G1237))]-[]]],
			[place(_G1230,_G1281),[[throughout(tray(_G1281))]-[]]],
			[pick(_G1310,_G1237),[[throughout(leftplacingarea(_G1237)),throughout(placingarea(_G1237)),throughout(tableplacingarea(_G5492,_G1237))]-[]]],
			[place(_G1310,_G1281),[[throughout(tray(_G1281))]-[]]],
			[move(_G1202,_G1102),[[throughout(manipulationarea(_G1202)),throughout(premanipulationarea(_G1102)),throughout(tablemanipulationarea(_G5492,_G1202)),throughout(tablepremanipulationarea(_G5492,_G1102))]-[]]],
			[move(_G1102,_G1490),[[throughout(premanipulationarea(_G1102)),throughout(premanipulationarea(_G1490)),throughout(tablepremanipulationarea(_G5492,_G1102)),throughout(tablepremanipulationarea(_G5493,_G1490))]-[]]],
			[move(_G1490,_G1590),[[throughout(manipulationarea(_G1590)),throughout(premanipulationarea(_G1490)),throughout(tablemanipulationarea(_G5493,_G1590)),throughout(tablepremanipulationarea(_G5493,_G1490))]-[]]],
			[pick(_G1310,_G1281),[[throughout(tray(_G1281))]-[]]],
			[place(_G1310,_G1661),[[throughout(placingarea(_G1661)),throughout(rightplacingarea(_G1661)),throughout(tableplacingarea(_G5493,_G1661))]-[]]],
			[pick(_G1230,_G1281),[[throughout(tray(_G1281))]-[]]],
			[place(_G1230,_G1661),[[throughout(placingarea(_G1661)),throughout(rightplacingarea(_G1661)),throughout(tableplacingarea(_G5493,_G1661))]-[]]]	],
	[objectat(_G1230,_G1661),objectat(_G1310,_G1661)]
)).
