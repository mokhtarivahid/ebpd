:-assert(activity_schema(
	%%% stack(t1,p1)
	stack,
	[_G521,_G557],
	[		[pick(_G514,_G521),[[at_start(ontable(_G514,_G521)),throughout(blue(_G514)),throughout(container(_G514)),throughout(table(_G521))]-[]]],
			[stack(_G514,_G593,_G557),[[at_start(ontable(_G514,_G521)),at_start(top(_G593,_G557)),throughout(blue(_G514)),throughout(container(_G514)),throughout(pallet(_G593)),throughout(pile(_G557))]-[]]],
			[[pick(_G666,_G521),[[at_start(ontable(_G666,_G521)),throughout(blue(_G666)),throughout(container(_G666)),throughout(table(_G521))]-[]]],[stack(_G666,_G514,_G557),[[at_start(ontable(_G514,_G521)),at_start(ontable(_G666,_G521)),throughout(blue(_G514)),throughout(blue(_G666)),throughout(container(_G514)),throughout(container(_G666)),throughout(pile(_G557))]-[]]]],
			[pick(_G1122,_G521),[[at_start(ontable(_G1122,_G521)),throughout(container(_G1122)),throughout(red(_G1122)),throughout(table(_G521))]-[]]],
			[stack(_G1122,_G970,_G557),[[at_start(ontable(_G970,_G521)),at_start(ontable(_G1122,_G521)),throughout(blue(_G970)),throughout(container(_G970)),throughout(container(_G1122)),throughout(pile(_G557)),throughout(red(_G1122))]-[]]],
			[[pick(_G1274,_G521),[[at_start(ontable(_G1274,_G521)),throughout(container(_G1274)),throughout(red(_G1274)),throughout(table(_G521))]-[]]],[stack(_G1274,_G1122,_G557),[[at_start(ontable(_G1122,_G521)),at_start(ontable(_G1274,_G521)),throughout(container(_G1122)),throughout(container(_G1274)),throughout(pile(_G557)),throughout(red(_G1122)),throughout(red(_G1274))]-[]]]],
			[pick(_G1578,_G521),[[at_goal(top(_G1578,_G557)),at_start(ontable(_G1578,_G521)),throughout(container(_G1578)),throughout(red(_G1578)),throughout(table(_G521))]-[]]],
			[stack(_G1578,_G1426,_G557),[[at_goal(top(_G1578,_G557)),at_start(ontable(_G1426,_G521)),at_start(ontable(_G1578,_G521)),throughout(container(_G1426)),throughout(container(_G1578)),throughout(pile(_G557)),throughout(red(_G1426)),throughout(red(_G1578))]-[]]]	],
	[top(_G1578,_G557),on(_G514,_G593),on(_G666,_G514),on(_G818,_G666),on(_G970,_G818),on(_G1122,_G970),on(_G1274,_G1122),on(_G1426,_G1274),on(_G1578,_G1426)]
)).
