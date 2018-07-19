
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,2).
:-nb_setval(weight,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(activity_schema(
	%%% stack(p1,p2)
	stack,
	[_G826,_G2382],
	[		[unstack(_G812,_G855,_G862,_G826),[[throughout(block(_G855)),throughout(block(_G862)),throughout(blue(_G855)),throughout(pile(_G826)),throughout(red(_G862))]-[]]],
			[put(_G812,_G855,_G819),[[throughout(block(_G855)),throughout(blue(_G855)),throughout(table(_G819))]-[]]],
			[[unstack(_G812,_G862,_G1014,_G826),[[throughout(block(_G862)),throughout(block(_G1014)),throughout(blue(_G1014)),throughout(pile(_G826)),throughout(red(_G862))]-[]]],[put(_G812,_G862,_G819),[[throughout(block(_G862)),throughout(red(_G862)),throughout(table(_G819))]-[]]],[unstack(_G812,_G1014,_G1166,_G826),[[throughout(block(_G1014)),throughout(block(_G1166)),throughout(blue(_G1014)),throughout(pile(_G826)),throughout(red(_G1166))]-[]]],[put(_G812,_G1014,_G819),[[throughout(block(_G1014)),throughout(blue(_G1014)),throughout(table(_G819))]-[]]]],
			[unstack(_G812,_G2078,_G2230,_G826),[[at_goal(top(_G2230,_G826)),throughout(block(_G2078)),throughout(pallet(_G2230)),throughout(pile(_G826)),throughout(red(_G2078))]-[]]],
			[put(_G812,_G2078,_G819),[[throughout(block(_G2078)),throughout(red(_G2078)),throughout(table(_G819))]-[]]],
			[pick(_G812,_G1926,_G819),[[throughout(block(_G1926)),throughout(blue(_G1926)),throughout(table(_G819))]-[]]],
			[stack(_G812,_G1926,_G2418,_G2382),[[at_start(top(_G2418,_G2382)),throughout(block(_G1926)),throughout(blue(_G1926)),throughout(pallet(_G2418)),throughout(pile(_G2382))]-[]]],
			[[pick(_G812,_G1622,_G819),[[throughout(block(_G1622)),throughout(blue(_G1622)),throughout(table(_G819))]-[]]],[stack(_G812,_G1622,_G1926,_G2382),[[throughout(block(_G1622)),throughout(block(_G1926)),throughout(blue(_G1622)),throughout(blue(_G1926)),throughout(pile(_G2382))]-[]]]],
			[pick(_G812,_G2078,_G819),[[throughout(block(_G2078)),throughout(red(_G2078)),throughout(table(_G819))]-[]]],
			[stack(_G812,_G2078,_G855,_G2382),[[throughout(block(_G855)),throughout(block(_G2078)),throughout(blue(_G855)),throughout(pile(_G2382)),throughout(red(_G2078))]-[]]],
			[[pick(_G812,_G1774,_G819),[[throughout(block(_G1774)),throughout(red(_G1774)),throughout(table(_G819))]-[]]],[stack(_G812,_G1774,_G2078,_G2382),[[throughout(block(_G1774)),throughout(block(_G2078)),throughout(pile(_G2382)),throughout(red(_G1774)),throughout(red(_G2078))]-[]]]]	],
	[top(_G2230,_G826),on(_G1926,_G2418),on(_G1622,_G1926),on(_G1318,_G1622),on(_G1014,_G1318),on(_G855,_G1014),on(_G2078,_G855),on(_G1774,_G2078),on(_G1470,_G1774),on(_G1166,_G1470),on(_G862,_G1166)]
)).


%% :-assert(activity_schema(
%% 	%%% stack(p1,p2)
%% 	stack,
%% 	[_G822,_G2118],
%% 	[		[unstack(_G808,_G851,_G858,_G822),[[at_goal(top(_G858,_G2118)),at_start(empty(_G808)),at_start(top(_G851,_G822)),throughout(block(_G851)),throughout(block(_G858)),throughout(blue(_G851)),throughout(pile(_G822)),throughout(red(_G858))]-[]]],
%% 			[put(_G808,_G851,_G815),[[at_start(empty(_G808)),at_start(top(_G851,_G822)),throughout(block(_G851)),throughout(blue(_G851)),throughout(table(_G815))]-[]]],
%% 			[unstack(_G808,_G858,_G1010,_G822),[[at_goal(top(_G858,_G2118)),at_start(empty(_G808)),throughout(block(_G858)),throughout(block(_G1010)),throughout(blue(_G1010)),throughout(pile(_G822)),throughout(red(_G858))]-[]]],
%% 			[put(_G808,_G858,_G815),[[at_goal(top(_G858,_G2118)),at_start(empty(_G808)),throughout(block(_G858)),throughout(red(_G858)),throughout(table(_G815))]-[]]],
%% 			[unstack(_G808,_G1010,_G1162,_G822),[[at_start(empty(_G808)),throughout(block(_G1010)),throughout(block(_G1162)),throughout(blue(_G1010)),throughout(pile(_G822)),throughout(red(_G1162))]-[]]],
%% 			[[put(_G808,_G1010,_G815),[[at_start(empty(_G808)),throughout(block(_G1010)),throughout(blue(_G1010)),throughout(table(_G815))]-[]]],[unstack(_G808,_G1162,_G1314,_G822),[[at_start(empty(_G808)),throughout(block(_G1162)),throughout(block(_G1314)),throughout(blue(_G1314)),throughout(pile(_G822)),throughout(red(_G1162))]-[]]],[put(_G808,_G1162,_G815),[[at_start(empty(_G808)),throughout(block(_G1162)),throughout(red(_G1162)),throughout(table(_G815))]-[]]],[unstack(_G808,_G1314,_G1466,_G822),[[at_start(empty(_G808)),throughout(block(_G1314)),throughout(block(_G1466)),throughout(blue(_G1314)),throughout(pile(_G822)),throughout(red(_G1466))]-[]]]],
%% 			[stack(_G808,_G1922,_G2154,_G2118),[[at_start(empty(_G808)),at_start(top(_G2154,_G2118)),throughout(block(_G1922)),throughout(blue(_G1922)),throughout(pallet(_G2154)),throughout(pile(_G2118))]-[]]],
%% 			[[pick(_G808,_G1618,_G815),[[at_start(empty(_G808)),throughout(block(_G1618)),throughout(blue(_G1618)),throughout(table(_G815))]-[]]],[stack(_G808,_G1618,_G1922,_G2118),[[at_start(empty(_G808)),throughout(block(_G1618)),throughout(block(_G1922)),throughout(blue(_G1618)),throughout(blue(_G1922)),throughout(pile(_G2118))]-[]]]],
%% 			[pick(_G808,_G851,_G815),[[at_start(empty(_G808)),at_start(top(_G851,_G822)),throughout(block(_G851)),throughout(blue(_G851)),throughout(table(_G815))]-[]]],
%% 			[stack(_G808,_G851,_G1010,_G2118),[[at_start(empty(_G808)),at_start(top(_G851,_G822)),throughout(block(_G851)),throughout(block(_G1010)),throughout(blue(_G851)),throughout(blue(_G1010)),throughout(pile(_G2118))]-[]]],
%% 			[unstack(_G808,_G2074,_G2842,_G822),[[at_goal(top(_G2842,_G822)),at_start(empty(_G808)),throughout(block(_G2074)),throughout(pallet(_G2842)),throughout(pile(_G822)),throughout(red(_G2074))]-[]]],
%% 			[stack(_G808,_G2074,_G851,_G2118),[[at_start(empty(_G808)),at_start(top(_G851,_G822)),throughout(block(_G851)),throughout(block(_G2074)),throughout(blue(_G851)),throughout(pile(_G2118)),throughout(red(_G2074))]-[]]],
%% 			[[pick(_G808,_G1770,_G815),[[at_start(empty(_G808)),throughout(block(_G1770)),throughout(red(_G1770)),throughout(table(_G815))]-[]]],[stack(_G808,_G1770,_G2074,_G2118),[[at_start(empty(_G808)),throughout(block(_G1770)),throughout(block(_G2074)),throughout(pile(_G2118)),throughout(red(_G1770)),throughout(red(_G2074))]-[]]]],
%% 			[pick(_G808,_G858,_G815),[[at_goal(top(_G858,_G2118)),at_start(empty(_G808)),throughout(block(_G858)),throughout(red(_G858)),throughout(table(_G815))]-[]]],
%% 			[stack(_G808,_G858,_G1162,_G2118),[[at_goal(top(_G858,_G2118)),at_start(empty(_G808)),throughout(block(_G858)),throughout(block(_G1162)),throughout(pile(_G2118)),throughout(red(_G858)),throughout(red(_G1162))]-[]]]	],
%% 	[top(_G2842,_G822),top(_G858,_G2118),on(_G1922,_G2154),on(_G1618,_G1922),on(_G1314,_G1618),on(_G1010,_G1314),on(_G851,_G1010),on(_G2074,_G851),on(_G1770,_G2074),on(_G1466,_G1770),on(_G1162,_G1466),on(_G858,_G1162)]
%% )).
