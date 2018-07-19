:-assert(activity_schema(
	%%% unstack_stack(p1,p2)
	unstack_stack,
	[_G688,_G2136],
	[		[unstack(_G674,_G717,_G724,_G688),[[at_goal(top(_G717,_G2136)),at_start(empty(_G674)),at_start(top(_G717,_G688)),throughout(pile(_G688))]-[]]],
			[put(_G674,_G717,_G681),[[at_goal(top(_G717,_G2136)),at_start(empty(_G674)),at_start(top(_G717,_G688)),throughout(table(_G681))]-[]]],
			[[unstack(_G674,_G724,_G876,_G688),[[at_start(empty(_G674)),throughout(pile(_G688))]-[]]],[put(_G674,_G724,_G681),[[at_start(empty(_G674)),throughout(table(_G681))]-[]]]],
			[unstack(_G674,_G1940,_G2092,_G688),[[at_goal(top(_G2092,_G688)),at_start(empty(_G674)),throughout(pile(_G688))]-[]]],
			[stack(_G674,_G1940,_G2172,_G2136),[[at_start(empty(_G674)),at_start(top(_G2172,_G2136)),throughout(pile(_G2136))]-[]]],
			[[pick(_G674,_G1180,_G681),[[at_start(empty(_G674)),throughout(table(_G681))]-[]]],[stack(_G674,_G1180,_G1940,_G2136),[[at_start(empty(_G674)),throughout(pile(_G2136))]-[]]]],
			[pick(_G674,_G717,_G681),[[at_goal(top(_G717,_G2136)),at_start(empty(_G674)),at_start(top(_G717,_G688)),throughout(table(_G681))]-[]]],
			[stack(_G674,_G717,_G1332,_G2136),[[at_goal(top(_G717,_G2136)),at_start(empty(_G674)),at_start(top(_G717,_G688)),throughout(pile(_G2136))]-[]]]	],
	[top(_G2092,_G688),top(_G717,_G2136),on(_G1940,_G2172),on(_G1180,_G1940),on(_G1788,_G1180),on(_G1028,_G1788),on(_G1636,_G1028),on(_G876,_G1636),on(_G1484,_G876),on(_G724,_G1484),on(_G1332,_G724),on(_G717,_G1332)]
)).
