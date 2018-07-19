
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,2).
:-nb_setval(weight,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% :-assert(activity_schema(
%%% 	%%% stack(p1,p2)
%%% 	stack,
%%% 	[_G826,_G2274],
%%% 	[		[[unstack(_G812,_G855,_G862,_G826),[[at_start(empty(_G812)),throughout(block(_G855)),throughout(block(_G862)),throughout(blue(_G862)),throughout(pile(_G826)),throughout(red(_G855))]-[]]],[put(_G812,_G855,_G819),[[at_start(empty(_G812)),throughout(block(_G855)),throughout(red(_G855)),throughout(table(_G819))]-[]]]],
%%% 			[unstack(_G812,_G1318,_G1470,_G826),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(block(_G1470)),throughout(blue(_G1470)),throughout(pile(_G826)),throughout(red(_G1318))]-[]]],
%%% 			[put(_G812,_G1318,_G819),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(red(_G1318)),throughout(table(_G819))]-[]]],
%%% 			[[unstack(_G812,_G1470,_G1622,_G826),[[at_start(empty(_G812)),throughout(block(_G1470)),throughout(block(_G1622)),throughout(blue(_G1470)),throughout(pile(_G826)),throughout(red(_G1622))]-[]]],[put(_G812,_G1470,_G819),[[at_start(empty(_G812)),throughout(block(_G1470)),throughout(blue(_G1470)),throughout(table(_G819))]-[]]]],
%%% 			[unstack(_G812,_G2078,_G2230,_G826),[[at_goal(top(_G2230,_G826)),at_start(empty(_G812)),throughout(block(_G2078)),throughout(blue(_G2078)),throughout(pallet(_G2230)),throughout(pile(_G826))]-[]]],
%%% 			[stack(_G812,_G2078,_G2310,_G2274),[[at_start(empty(_G812)),at_start(top(_G2310,_G2274)),throughout(block(_G2078)),throughout(blue(_G2078)),throughout(pallet(_G2310)),throughout(pile(_G2274))]-[]]],
%%% 			[[pick(_G812,_G1774,_G819),[[at_start(empty(_G812)),throughout(block(_G1774)),throughout(blue(_G1774)),throughout(table(_G819))]-[]]],[stack(_G812,_G1774,_G2078,_G2274),[[at_start(empty(_G812)),throughout(block(_G1774)),throughout(block(_G2078)),throughout(blue(_G1774)),throughout(blue(_G2078)),throughout(pile(_G2274))]-[]]]],
%%% 			[pick(_G812,_G1926,_G819),[[at_start(empty(_G812)),throughout(block(_G1926)),throughout(red(_G1926)),throughout(table(_G819))]-[]]],
%%% 			[stack(_G812,_G1926,_G862,_G2274),[[at_start(empty(_G812)),throughout(block(_G862)),throughout(block(_G1926)),throughout(blue(_G862)),throughout(pile(_G2274)),throughout(red(_G1926))]-[]]],
%%% 			[[pick(_G812,_G1622,_G819),[[at_start(empty(_G812)),throughout(block(_G1622)),throughout(red(_G1622)),throughout(table(_G819))]-[]]],[stack(_G812,_G1622,_G1926,_G2274),[[at_start(empty(_G812)),throughout(block(_G1622)),throughout(block(_G1926)),throughout(pile(_G2274)),throughout(red(_G1622)),throughout(red(_G1926))]-[]]]]	],
%%% 	[top(_G2230,_G826),on(_G2078,_G2310),on(_G1774,_G2078),on(_G1470,_G1774),on(_G1166,_G1470),on(_G862,_G1166),on(_G1926,_G862),on(_G1622,_G1926),on(_G1318,_G1622),on(_G1014,_G1318),on(_G855,_G1014)]
%%% )).


:-assert(activity_schema(
	%%% stack(p1,p2)
	stack,
	[_G842,_G2290],
	[		[unstack(_G828,_G871,_G878,_G842),[[at_goal(top(_G871,_G2290)),at_start(empty(_G828)),at_start(top(_G871,_G842)),throughout(block(_G871)),throughout(block(_G878)),throughout(blue(_G878)),throughout(pile(_G842)),throughout(red(_G871))]-[]]],
			[put(_G828,_G871,_G835),[[at_goal(top(_G871,_G2290)),at_start(empty(_G828)),at_start(top(_G871,_G842)),throughout(block(_G871)),throughout(red(_G871)),throughout(table(_G835))]-[]]],
			[unstack(_G828,_G878,_G1030,_G842),[[at_start(empty(_G828)),throughout(block(_G878)),throughout(block(_G1030)),throughout(blue(_G878)),throughout(pile(_G842)),throughout(red(_G1030))]-[]]],
			[[put(_G828,_G878,_G835),[[at_start(empty(_G828)),throughout(block(_G878)),throughout(blue(_G878)),throughout(table(_G835))]-[]]],[unstack(_G828,_G1030,_G1182,_G842),[[at_start(empty(_G828)),throughout(block(_G1030)),throughout(block(_G1182)),throughout(blue(_G1182)),throughout(pile(_G842)),throughout(red(_G1030))]-[]]],[put(_G828,_G1030,_G835),[[at_start(empty(_G828)),throughout(block(_G1030)),throughout(red(_G1030)),throughout(table(_G835))]-[]]],[unstack(_G828,_G1182,_G1334,_G842),[[at_start(empty(_G828)),throughout(block(_G1182)),throughout(block(_G1334)),throughout(blue(_G1182)),throughout(pile(_G842)),throughout(red(_G1334))]-[]]]],
			[put(_G828,_G1790,_G835),[[at_start(empty(_G828)),throughout(block(_G1790)),throughout(blue(_G1790)),throughout(table(_G835))]-[]]],
			[unstack(_G828,_G1942,_G2094,_G842),[[at_start(empty(_G828)),throughout(block(_G1942)),throughout(block(_G2094)),throughout(blue(_G2094)),throughout(pile(_G842)),throughout(red(_G1942))]-[]]],
			[put(_G828,_G1942,_G835),[[at_start(empty(_G828)),throughout(block(_G1942)),throughout(red(_G1942)),throughout(table(_G835))]-[]]],
			[unstack(_G828,_G2094,_G2246,_G842),[[at_goal(top(_G2246,_G842)),at_start(empty(_G828)),throughout(block(_G2094)),throughout(blue(_G2094)),throughout(pallet(_G2246)),throughout(pile(_G842))]-[]]],
			[stack(_G828,_G2094,_G2326,_G2290),[[at_start(empty(_G828)),at_start(top(_G2326,_G2290)),throughout(block(_G2094)),throughout(blue(_G2094)),throughout(pallet(_G2326)),throughout(pile(_G2290))]-[]]],
			[pick(_G828,_G1790,_G835),[[at_start(empty(_G828)),throughout(block(_G1790)),throughout(blue(_G1790)),throughout(table(_G835))]-[]]],
			[[stack(_G828,_G1790,_G2094,_G2290),[[at_start(empty(_G828)),throughout(block(_G1790)),throughout(block(_G2094)),throughout(blue(_G1790)),throughout(blue(_G2094)),throughout(pile(_G2290))]-[]]],[pick(_G828,_G1486,_G835),[[at_start(empty(_G828)),throughout(block(_G1486)),throughout(blue(_G1486)),throughout(table(_G835))]-[]]]],
			[stack(_G828,_G878,_G1182,_G2290),[[at_start(empty(_G828)),throughout(block(_G878)),throughout(block(_G1182)),throughout(blue(_G878)),throughout(blue(_G1182)),throughout(pile(_G2290))]-[]]],
			[pick(_G828,_G1942,_G835),[[at_start(empty(_G828)),throughout(block(_G1942)),throughout(red(_G1942)),throughout(table(_G835))]-[]]],
			[stack(_G828,_G1942,_G878,_G2290),[[at_start(empty(_G828)),throughout(block(_G878)),throughout(block(_G1942)),throughout(blue(_G878)),throughout(pile(_G2290)),throughout(red(_G1942))]-[]]],
			[pick(_G828,_G1638,_G835),[[at_start(empty(_G828)),throughout(block(_G1638)),throughout(red(_G1638)),throughout(table(_G835))]-[]]],
			[[stack(_G828,_G1638,_G1942,_G2290),[[at_start(empty(_G828)),throughout(block(_G1638)),throughout(block(_G1942)),throughout(pile(_G2290)),throughout(red(_G1638)),throughout(red(_G1942))]-[]]],[pick(_G828,_G1334,_G835),[[at_start(empty(_G828)),throughout(block(_G1334)),throughout(red(_G1334)),throughout(table(_G835))]-[]]]],
			[stack(_G828,_G1030,_G1334,_G2290),[[at_start(empty(_G828)),throughout(block(_G1030)),throughout(block(_G1334)),throughout(pile(_G2290)),throughout(red(_G1030)),throughout(red(_G1334))]-[]]],
			[pick(_G828,_G871,_G835),[[at_goal(top(_G871,_G2290)),at_start(empty(_G828)),at_start(top(_G871,_G842)),throughout(block(_G871)),throughout(red(_G871)),throughout(table(_G835))]-[]]],
			[stack(_G828,_G871,_G1030,_G2290),[[at_goal(top(_G871,_G2290)),at_start(empty(_G828)),at_start(top(_G871,_G842)),throughout(block(_G871)),throughout(block(_G1030)),throughout(pile(_G2290)),throughout(red(_G871)),throughout(red(_G1030))]-[]]]	],
	[top(_G2246,_G842),top(_G871,_G2290),on(_G2094,_G2326),on(_G1790,_G2094),on(_G1486,_G1790),on(_G1182,_G1486),on(_G878,_G1182),on(_G1942,_G878),on(_G1638,_G1942),on(_G1334,_G1638),on(_G1030,_G1334),on(_G871,_G1030)]
)).
