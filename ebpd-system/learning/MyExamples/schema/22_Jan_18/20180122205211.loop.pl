:-assert(activity_schema(
	%%% stack(t1,p1)
	stack,
	[_G469,_G505],
	[		[pick(_G455,_G462,_G469),[[at_start(empty(_G455)),at_start(at(_G455,_G469)),at_start(ontable(_G462,_G469)),throughout(table(_G469))]-[]]],
			[stack(_G455,_G462,_G541,_G505),[[at_start(empty(_G455)),at_start(at(_G455,_G469)),at_start(ontable(_G462,_G469)),at_start(top(_G541,_G505)),throughout(pallet(_G541)),throughout(pile(_G505))]-[]]],
			[[pick(_G455,_G614,_G469),[[at_start(empty(_G455)),at_start(at(_G455,_G469)),at_start(ontable(_G614,_G469)),throughout(table(_G469))]-[]]],[stack(_G455,_G614,_G462,_G505),[[at_start(empty(_G455)),at_start(at(_G455,_G469)),at_start(ontable(_G462,_G469)),at_start(ontable(_G614,_G469)),throughout(pile(_G505))]-[]]]],
			[pick(_G455,_G1830,_G469),[[at_goal(top(_G1830,_G505)),at_start(empty(_G455)),at_start(at(_G455,_G469)),at_start(ontable(_G1830,_G469)),throughout(table(_G469))]-[]]],
			[stack(_G455,_G1830,_G1678,_G505),[[at_goal(top(_G1830,_G505)),at_start(empty(_G455)),at_start(at(_G455,_G469)),at_start(ontable(_G1678,_G469)),at_start(ontable(_G1830,_G469)),throughout(pile(_G505))]-[]]]	],
	[top(_G1830,_G505),on(_G462,_G541),on(_G614,_G462),on(_G766,_G614),on(_G918,_G766),on(_G1070,_G918),on(_G1222,_G1070),on(_G1374,_G1222),on(_G1526,_G1374),on(_G1678,_G1526),on(_G1830,_G1678)]
)).
