:-assert(activity_schema(
	%%% stack(t1,p1)
	stack,
	[_G462,_G498],
	[		[pick(_G448,_G455,_G462),[[at_start(empty(_G448)),at_start(at(_G448,_G462)),at_start(ontable(_G455,_G462)),throughout(table(_G462))]-[]]],
			[stack(_G448,_G455,_G534,_G498),[[at_start(empty(_G448)),at_start(at(_G448,_G462)),at_start(ontable(_G455,_G462)),at_start(top(_G534,_G498)),throughout(pile(_G498))]-[]]],
			[[pick(_G448,_G607,_G462),[[at_start(empty(_G448)),at_start(at(_G448,_G462)),at_start(ontable(_G607,_G462)),throughout(table(_G462))]-[]]],[stack(_G448,_G607,_G455,_G498),[[at_start(empty(_G448)),at_start(at(_G448,_G462)),at_start(ontable(_G455,_G462)),at_start(ontable(_G607,_G462)),throughout(pile(_G498))]-[]]]],
			[pick(_G448,_G1823,_G462),[[at_goal(top(_G1823,_G498)),at_start(empty(_G448)),at_start(at(_G448,_G462)),at_start(ontable(_G1823,_G462)),throughout(table(_G462))]-[]]],
			[stack(_G448,_G1823,_G1671,_G498),[[at_goal(top(_G1823,_G498)),at_start(empty(_G448)),at_start(at(_G448,_G462)),at_start(ontable(_G1671,_G462)),at_start(ontable(_G1823,_G462)),throughout(pile(_G498))]-[]]]	],
	[top(_G1823,_G498),on(_G455,_G534),on(_G607,_G455),on(_G759,_G607),on(_G911,_G759),on(_G1063,_G911),on(_G1215,_G1063),on(_G1367,_G1215),on(_G1519,_G1367),on(_G1671,_G1519),on(_G1823,_G1671)]
)).
