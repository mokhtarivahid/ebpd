:-assert(activity_schema(
	%%% stack(t1,p2)
	stack,
	[_G710,_G674],
	[		[pick(_G660,_G739,_G710),[[at_goal(in(_G739,_G674)),at_start(empty(_G660)),at_start(ontable(_G739,_G710)),throughout(base(_G739)),throughout(red(_G739)),throughout(table(_G710))]-[]]],
			[stack(_G660,_G739,_G818,_G674),[[at_goal(in(_G739,_G674)),at_start(empty(_G660)),at_start(ontable(_G739,_G710)),at_start(top(_G818,_G674)),throughout(base(_G739)),throughout(pallet(_G818)),throughout(pile(_G674)),throughout(red(_G739))]-[]]],
			[pick(_G660,_G891,_G710),[[at_goal(in(_G891,_G674)),at_start(empty(_G660)),at_start(ontable(_G891,_G710)),throughout(blue(_G891)),throughout(table(_G710))]-[]]],
			[stack(_G660,_G891,_G739,_G674),[[at_goal(in(_G739,_G674)),at_goal(in(_G891,_G674)),at_start(empty(_G660)),at_start(ontable(_G739,_G710)),at_start(ontable(_G891,_G710)),throughout(base(_G739)),throughout(blue(_G891)),throughout(pile(_G674)),throughout(red(_G739))]-[]]],
			[pick(_G660,_G1043,_G710),[[at_goal(in(_G1043,_G674)),at_start(empty(_G660)),at_start(ontable(_G1043,_G710)),throughout(red(_G1043)),throughout(table(_G710))]-[]]],
			[stack(_G660,_G1043,_G891,_G674),[[at_goal(in(_G891,_G674)),at_goal(in(_G1043,_G674)),at_start(empty(_G660)),at_start(ontable(_G891,_G710)),at_start(ontable(_G1043,_G710)),throughout(blue(_G891)),throughout(pile(_G674)),throughout(red(_G1043))]-[]]],
			[[pick(_G660,_G1195,_G710),[[at_goal(in(_G1195,_G674)),at_start(empty(_G660)),at_start(ontable(_G1195,_G710)),throughout(blue(_G1195)),throughout(table(_G710))]-[]]],[stack(_G660,_G1195,_G1043,_G674),[[at_goal(in(_G1043,_G674)),at_goal(in(_G1195,_G674)),at_start(empty(_G660)),at_start(ontable(_G1043,_G710)),at_start(ontable(_G1195,_G710)),throughout(blue(_G1195)),throughout(pile(_G674)),throughout(red(_G1043))]-[]]],[pick(_G660,_G1347,_G710),[[at_goal(in(_G1347,_G674)),at_start(empty(_G660)),at_start(ontable(_G1347,_G710)),throughout(red(_G1347)),throughout(table(_G710))]-[]]],[stack(_G660,_G1347,_G1195,_G674),[[at_goal(in(_G1195,_G674)),at_goal(in(_G1347,_G674)),at_start(empty(_G660)),at_start(ontable(_G1195,_G710)),at_start(ontable(_G1347,_G710)),throughout(blue(_G1195)),throughout(pile(_G674)),throughout(red(_G1347))]-[]]]],
			[pick(_G660,_G2107,_G710),[[at_goal(in(_G2107,_G674)),at_goal(top(_G2107,_G674)),at_start(empty(_G660)),at_start(ontable(_G2107,_G710)),throughout(blue(_G2107)),throughout(table(_G710))]-[]]],
			[stack(_G660,_G2107,_G1955,_G674),[[at_goal(in(_G1955,_G674)),at_goal(in(_G2107,_G674)),at_goal(top(_G2107,_G674)),at_start(empty(_G660)),at_start(ontable(_G1955,_G710)),at_start(ontable(_G2107,_G710)),throughout(blue(_G2107)),throughout(pile(_G674)),throughout(red(_G1955))]-[]]]	],
	[top(_G12264,_G667),top(_G2107,_G674),in(_G739,_G674),in(_G1043,_G674),in(_G1347,_G674),in(_G1651,_G674),in(_G1955,_G674),in(_G891,_G674),in(_G1195,_G674),in(_G1499,_G674),in(_G1803,_G674),in(_G2107,_G674),on(_G739,_G818),on(_G891,_G739),on(_G1043,_G891),on(_G1195,_G1043),on(_G1347,_G1195),on(_G1499,_G1347),on(_G1651,_G1499),on(_G1803,_G1651),on(_G1955,_G1803),on(_G2107,_G1955)]
)).
