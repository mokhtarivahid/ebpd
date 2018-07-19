
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,2).
:-nb_setval(weight,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(activity_schema(
	%%% stack(t1,p1)
	stack,
	[_G609,_G645],
	[		[pick(_G595,_G602,_G609),[[at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G602,_G609)),throughout(block(_G602)),throughout(blue(_G602)),throughout(table(_G609))]-[]]],
			[stack(_G595,_G602,_G681,_G645),[[at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G602,_G609)),at_start(top(_G681,_G645)),throughout(block(_G602)),throughout(blue(_G602)),throughout(pallet(_G681)),throughout(pile(_G645))]-[]]],
			[[pick(_G595,_G754,_G609),[[at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G754,_G609)),throughout(block(_G754)),throughout(blue(_G754)),throughout(table(_G609))]-[]]],[stack(_G595,_G754,_G602,_G645),[[at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G602,_G609)),at_start(ontable(_G754,_G609)),throughout(block(_G602)),throughout(block(_G754)),throughout(blue(_G602)),throughout(blue(_G754)),throughout(pile(_G645))]-[]]]],
			[pick(_G595,_G1362,_G609),[[at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G1362,_G609)),throughout(block(_G1362)),throughout(red(_G1362)),throughout(table(_G609))]-[]]],
			[stack(_G595,_G1362,_G1210,_G645),[[at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G1210,_G609)),at_start(ontable(_G1362,_G609)),throughout(block(_G1210)),throughout(block(_G1362)),throughout(blue(_G1210)),throughout(pile(_G645)),throughout(red(_G1362))]-[]]],
			[[pick(_G595,_G1514,_G609),[[at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G1514,_G609)),throughout(block(_G1514)),throughout(red(_G1514)),throughout(table(_G609))]-[]]],[stack(_G595,_G1514,_G1362,_G645),[[at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G1362,_G609)),at_start(ontable(_G1514,_G609)),throughout(block(_G1362)),throughout(block(_G1514)),throughout(pile(_G645)),throughout(red(_G1362)),throughout(red(_G1514))]-[]]]],
			[pick(_G595,_G1970,_G609),[[at_goal(top(_G1970,_G645)),at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G1970,_G609)),throughout(block(_G1970)),throughout(red(_G1970)),throughout(table(_G609))]-[]]],
			[stack(_G595,_G1970,_G1818,_G645),[[at_goal(top(_G1970,_G645)),at_start(empty(_G595)),at_start(at(_G595,_G609)),at_start(ontable(_G1818,_G609)),at_start(ontable(_G1970,_G609)),throughout(block(_G1818)),throughout(block(_G1970)),throughout(pile(_G645)),throughout(red(_G1818)),throughout(red(_G1970))]-[]]]	],
	[top(_G1970,_G645),on(_G602,_G681),on(_G754,_G602),on(_G906,_G754),on(_G1058,_G906),on(_G1210,_G1058),on(_G1362,_G1210),on(_G1514,_G1362),on(_G1666,_G1514),on(_G1818,_G1666),on(_G1970,_G1818)]
)).
