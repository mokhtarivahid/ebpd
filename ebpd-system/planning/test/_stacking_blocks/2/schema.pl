
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,5).
:-nb_setval(weight,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% _revese = True
%% without (top,at,empty) key property
:-assert(activity_schema(
	%%% stack(p1,p2)
	stack,
	[_G811,_G2259],
	[		[[unstack(_G797,_G840,_G847,_G811),[[throughout(block(_G840)),throughout(block(_G847)),throughout(pile(_G811)),throughout(red(_G840)),throughout(red(_G847))]-[]]],[put(_G797,_G840,_G804),[[throughout(block(_G840)),throughout(red(_G840)),throughout(table(_G804))]-[]]]],
			[unstack(_G797,_G1303,_G1455,_G811),[[throughout(block(_G1303)),throughout(block(_G1455)),throughout(blue(_G1455)),throughout(pile(_G811)),throughout(red(_G1303))]-[]]],
			[put(_G797,_G1303,_G804),[[throughout(block(_G1303)),throughout(red(_G1303)),throughout(table(_G804))]-[]]],
			[[unstack(_G797,_G1455,_G1607,_G811),[[throughout(block(_G1455)),throughout(block(_G1607)),throughout(blue(_G1455)),throughout(blue(_G1607)),throughout(pile(_G811))]-[]]],[put(_G797,_G1455,_G804),[[throughout(block(_G1455)),throughout(blue(_G1455)),throughout(table(_G804))]-[]]]],
			[unstack(_G797,_G2063,_G2215,_G811),[[at_goal(top(_G2215,_G811)),throughout(block(_G2063)),throughout(blue(_G2063)),throughout(pallet(_G2215)),throughout(pile(_G811))]-[]]],
			[stack(_G797,_G2063,_G2295,_G2259),[[at_start(top(_G2295,_G2259)),throughout(block(_G2063)),throughout(blue(_G2063)),throughout(pallet(_G2295)),throughout(pile(_G2259))]-[]]],
			[[pick(_G797,_G1911,_G804),[[throughout(block(_G1911)),throughout(blue(_G1911)),throughout(table(_G804))]-[]]],[stack(_G797,_G1911,_G2063,_G2259),[[throughout(block(_G1911)),throughout(block(_G2063)),throughout(blue(_G1911)),throughout(blue(_G2063)),throughout(pile(_G2259))]-[]]]],
			[pick(_G797,_G1303,_G804),[[throughout(block(_G1303)),throughout(red(_G1303)),throughout(table(_G804))]-[]]],
			[stack(_G797,_G1303,_G1455,_G2259),[[throughout(block(_G1303)),throughout(block(_G1455)),throughout(blue(_G1455)),throughout(pile(_G2259)),throughout(red(_G1303))]-[]]],
			[[pick(_G797,_G1151,_G804),[[throughout(block(_G1151)),throughout(red(_G1151)),throughout(table(_G804))]-[]]],[stack(_G797,_G1151,_G1303,_G2259),[[throughout(block(_G1151)),throughout(block(_G1303)),throughout(pile(_G2259)),throughout(red(_G1151)),throughout(red(_G1303))]-[]]]]	],
	[top(_G2215,_G811),on(_G2063,_G2295),on(_G1911,_G2063),on(_G1759,_G1911),on(_G1607,_G1759),on(_G1455,_G1607),on(_G1303,_G1455),on(_G1151,_G1303),on(_G999,_G1151),on(_G847,_G999),on(_G840,_G847)]
)).


%% _revese = False
%% without (top,at,empty) key property
%%:-assert(activity_schema(
%%	%%% stack(p1,p2)
%%	stack,
%%	[_G811,_G2259],
%%	[		[unstack(_G797,_G840,_G847,_G811),[[throughout(block(_G840)),throughout(block(_G847)),throughout(pile(_G811)),throughout(red(_G840)),throughout(red(_G847))]-[]]],
%%			[[put(_G797,_G840,_G804),[[throughout(block(_G840)),throughout(red(_G840)),throughout(table(_G804))]-[]]],[unstack(_G797,_G847,_G999,_G811),[[throughout(block(_G847)),throughout(block(_G999)),throughout(pile(_G811)),throughout(red(_G847)),throughout(red(_G999))]-[]]]],
%%			[put(_G797,_G1151,_G804),[[throughout(block(_G1151)),throughout(red(_G1151)),throughout(table(_G804))]-[]]],
%%			[unstack(_G797,_G1303,_G1455,_G811),[[throughout(block(_G1303)),throughout(block(_G1455)),throughout(blue(_G1455)),throughout(pile(_G811)),throughout(red(_G1303))]-[]]],
%%			[put(_G797,_G1303,_G804),[[throughout(block(_G1303)),throughout(red(_G1303)),throughout(table(_G804))]-[]]],
%%			[unstack(_G797,_G1455,_G1607,_G811),[[throughout(block(_G1455)),throughout(block(_G1607)),throughout(blue(_G1455)),throughout(blue(_G1607)),throughout(pile(_G811))]-[]]],
%%			[[put(_G797,_G1455,_G804),[[throughout(block(_G1455)),throughout(blue(_G1455)),throughout(table(_G804))]-[]]],[unstack(_G797,_G1607,_G1759,_G811),[[throughout(block(_G1607)),throughout(block(_G1759)),throughout(blue(_G1607)),throughout(blue(_G1759)),throughout(pile(_G811))]-[]]]],
%%			[put(_G797,_G1911,_G804),[[throughout(block(_G1911)),throughout(blue(_G1911)),throughout(table(_G804))]-[]]],
%%			[unstack(_G797,_G2063,_G2215,_G811),[[at_goal(top(_G2215,_G811)),throughout(block(_G2063)),throughout(blue(_G2063)),throughout(pallet(_G2215)),throughout(pile(_G811))]-[]]],
%%			[stack(_G797,_G2063,_G2295,_G2259),[[at_start(top(_G2295,_G2259)),throughout(block(_G2063)),throughout(blue(_G2063)),throughout(pallet(_G2295)),throughout(pile(_G2259))]-[]]],
%%			[pick(_G797,_G1911,_G804),[[throughout(block(_G1911)),throughout(blue(_G1911)),throughout(table(_G804))]-[]]],
%%			[[stack(_G797,_G1911,_G2063,_G2259),[[throughout(block(_G1911)),throughout(block(_G2063)),throughout(blue(_G1911)),throughout(blue(_G2063)),throughout(pile(_G2259))]-[]]],[pick(_G797,_G1759,_G804),[[throughout(block(_G1759)),throughout(blue(_G1759)),throughout(table(_G804))]-[]]]],
%%			[stack(_G797,_G1455,_G1607,_G2259),[[throughout(block(_G1455)),throughout(block(_G1607)),throughout(blue(_G1455)),throughout(blue(_G1607)),throughout(pile(_G2259))]-[]]],
%%			[pick(_G797,_G1303,_G804),[[throughout(block(_G1303)),throughout(red(_G1303)),throughout(table(_G804))]-[]]],
%%			[stack(_G797,_G1303,_G1455,_G2259),[[throughout(block(_G1303)),throughout(block(_G1455)),throughout(blue(_G1455)),throughout(pile(_G2259)),throughout(red(_G1303))]-[]]],
%%			[[pick(_G797,_G1151,_G804),[[throughout(block(_G1151)),throughout(red(_G1151)),throughout(table(_G804))]-[]]],[stack(_G797,_G1151,_G1303,_G2259),[[throughout(block(_G1151)),throughout(block(_G1303)),throughout(pile(_G2259)),throughout(red(_G1151)),throughout(red(_G1303))]-[]]]],
%%			[pick(_G797,_G840,_G804),[[throughout(block(_G840)),throughout(red(_G840)),throughout(table(_G804))]-[]]],
%%			[stack(_G797,_G840,_G847,_G2259),[[throughout(block(_G840)),throughout(block(_G847)),throughout(pile(_G2259)),throughout(red(_G840)),throughout(red(_G847))]-[]]]	],
%%	[top(_G2215,_G811),on(_G2063,_G2295),on(_G1911,_G2063),on(_G1759,_G1911),on(_G1607,_G1759),on(_G1455,_G1607),on(_G1303,_G1455),on(_G1151,_G1303),on(_G999,_G1151),on(_G847,_G999),on(_G840,_G847)]
%%)).


%% _revese = False
%% without top key property
%% :-assert(activity_schema(
%% 	%%% stack(p1,p2)
%% 	stack,
%% 	[_G826,_G2274],
%% 	[		[unstack(_G812,_G855,_G862,_G826),[[at_start(empty(_G812)),throughout(block(_G855)),throughout(block(_G862)),throughout(pile(_G826)),throughout(red(_G855)),throughout(red(_G862))]-[]]],
%% 			[[put(_G812,_G855,_G819),[[at_start(empty(_G812)),throughout(block(_G855)),throughout(red(_G855)),throughout(table(_G819))]-[]]],[unstack(_G812,_G862,_G1014,_G826),[[at_start(empty(_G812)),throughout(block(_G862)),throughout(block(_G1014)),throughout(pile(_G826)),throughout(red(_G862)),throughout(red(_G1014))]-[]]]],
%% 			[put(_G812,_G1166,_G819),[[at_start(empty(_G812)),throughout(block(_G1166)),throughout(red(_G1166)),throughout(table(_G819))]-[]]],
%% 			[unstack(_G812,_G1318,_G1470,_G826),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(block(_G1470)),throughout(blue(_G1470)),throughout(pile(_G826)),throughout(red(_G1318))]-[]]],
%% 			[put(_G812,_G1318,_G819),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(red(_G1318)),throughout(table(_G819))]-[]]],
%% 			[unstack(_G812,_G1470,_G1622,_G826),[[at_start(empty(_G812)),throughout(block(_G1470)),throughout(block(_G1622)),throughout(blue(_G1470)),throughout(blue(_G1622)),throughout(pile(_G826))]-[]]],
%% 			[[put(_G812,_G1470,_G819),[[at_start(empty(_G812)),throughout(block(_G1470)),throughout(blue(_G1470)),throughout(table(_G819))]-[]]],[unstack(_G812,_G1622,_G1774,_G826),[[at_start(empty(_G812)),throughout(block(_G1622)),throughout(block(_G1774)),throughout(blue(_G1622)),throughout(blue(_G1774)),throughout(pile(_G826))]-[]]]],
%% 			[put(_G812,_G1926,_G819),[[at_start(empty(_G812)),throughout(block(_G1926)),throughout(blue(_G1926)),throughout(table(_G819))]-[]]],
%% 			[unstack(_G812,_G2078,_G2230,_G826),[[at_goal(top(_G2230,_G826)),at_start(empty(_G812)),throughout(block(_G2078)),throughout(blue(_G2078)),throughout(pallet(_G2230)),throughout(pile(_G826))]-[]]],
%% 			[stack(_G812,_G2078,_G2310,_G2274),[[at_start(empty(_G812)),at_start(top(_G2310,_G2274)),throughout(block(_G2078)),throughout(blue(_G2078)),throughout(pallet(_G2310)),throughout(pile(_G2274))]-[]]],
%% 			[pick(_G812,_G1926,_G819),[[at_start(empty(_G812)),throughout(block(_G1926)),throughout(blue(_G1926)),throughout(table(_G819))]-[]]],
%% 			[[stack(_G812,_G1926,_G2078,_G2274),[[at_start(empty(_G812)),throughout(block(_G1926)),throughout(block(_G2078)),throughout(blue(_G1926)),throughout(blue(_G2078)),throughout(pile(_G2274))]-[]]],[pick(_G812,_G1774,_G819),[[at_start(empty(_G812)),throughout(block(_G1774)),throughout(blue(_G1774)),throughout(table(_G819))]-[]]]],
%% 			[stack(_G812,_G1470,_G1622,_G2274),[[at_start(empty(_G812)),throughout(block(_G1470)),throughout(block(_G1622)),throughout(blue(_G1470)),throughout(blue(_G1622)),throughout(pile(_G2274))]-[]]],
%% 			[pick(_G812,_G1318,_G819),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(red(_G1318)),throughout(table(_G819))]-[]]],
%% 			[stack(_G812,_G1318,_G1470,_G2274),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(block(_G1470)),throughout(blue(_G1470)),throughout(pile(_G2274)),throughout(red(_G1318))]-[]]],
%% 			[[pick(_G812,_G1166,_G819),[[at_start(empty(_G812)),throughout(block(_G1166)),throughout(red(_G1166)),throughout(table(_G819))]-[]]],[stack(_G812,_G1166,_G1318,_G2274),[[at_start(empty(_G812)),throughout(block(_G1166)),throughout(block(_G1318)),throughout(pile(_G2274)),throughout(red(_G1166)),throughout(red(_G1318))]-[]]]],
%% 			[pick(_G812,_G855,_G819),[[at_start(empty(_G812)),throughout(block(_G855)),throughout(red(_G855)),throughout(table(_G819))]-[]]],
%% 			[stack(_G812,_G855,_G862,_G2274),[[at_start(empty(_G812)),throughout(block(_G855)),throughout(block(_G862)),throughout(pile(_G2274)),throughout(red(_G855)),throughout(red(_G862))]-[]]]	],
%% 	[top(_G2230,_G826),on(_G2078,_G2310),on(_G1926,_G2078),on(_G1774,_G1926),on(_G1622,_G1774),on(_G1470,_G1622),on(_G1318,_G1470),on(_G1166,_G1318),on(_G1014,_G1166),on(_G862,_G1014),on(_G855,_G862)]
%% )).


%% _revese = True
%% without top key property
%% :-assert(activity_schema(
%% 	%%% stack(p1,p2)
%% 	stack,
%% 	[_G826,_G2274],
%% 	[		[[unstack(_G812,_G855,_G862,_G826),[[at_start(empty(_G812)),throughout(block(_G855)),throughout(block(_G862)),throughout(pile(_G826)),throughout(red(_G855)),throughout(red(_G862))]-[]]],[put(_G812,_G855,_G819),[[at_start(empty(_G812)),throughout(block(_G855)),throughout(red(_G855)),throughout(table(_G819))]-[]]]],
%% 			[unstack(_G812,_G1318,_G1470,_G826),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(block(_G1470)),throughout(blue(_G1470)),throughout(pile(_G826)),throughout(red(_G1318))]-[]]],
%% 			[put(_G812,_G1318,_G819),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(red(_G1318)),throughout(table(_G819))]-[]]],
%% 			[[unstack(_G812,_G1470,_G1622,_G826),[[at_start(empty(_G812)),throughout(block(_G1470)),throughout(block(_G1622)),throughout(blue(_G1470)),throughout(blue(_G1622)),throughout(pile(_G826))]-[]]],[put(_G812,_G1470,_G819),[[at_start(empty(_G812)),throughout(block(_G1470)),throughout(blue(_G1470)),throughout(table(_G819))]-[]]]],
%% 			[unstack(_G812,_G2078,_G2230,_G826),[[at_goal(top(_G2230,_G826)),at_start(empty(_G812)),throughout(block(_G2078)),throughout(blue(_G2078)),throughout(pallet(_G2230)),throughout(pile(_G826))]-[]]],
%% 			[stack(_G812,_G2078,_G2310,_G2274),[[at_start(empty(_G812)),at_start(top(_G2310,_G2274)),throughout(block(_G2078)),throughout(blue(_G2078)),throughout(pallet(_G2310)),throughout(pile(_G2274))]-[]]],
%% 			[[pick(_G812,_G1926,_G819),[[at_start(empty(_G812)),throughout(block(_G1926)),throughout(blue(_G1926)),throughout(table(_G819))]-[]]],[stack(_G812,_G1926,_G2078,_G2274),[[at_start(empty(_G812)),throughout(block(_G1926)),throughout(block(_G2078)),throughout(blue(_G1926)),throughout(blue(_G2078)),throughout(pile(_G2274))]-[]]]],
%% 			[pick(_G812,_G1318,_G819),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(red(_G1318)),throughout(table(_G819))]-[]]],
%% 			[stack(_G812,_G1318,_G1470,_G2274),[[at_start(empty(_G812)),throughout(block(_G1318)),throughout(block(_G1470)),throughout(blue(_G1470)),throughout(pile(_G2274)),throughout(red(_G1318))]-[]]],
%% 			[[pick(_G812,_G1166,_G819),[[at_start(empty(_G812)),throughout(block(_G1166)),throughout(red(_G1166)),throughout(table(_G819))]-[]]],[stack(_G812,_G1166,_G1318,_G2274),[[at_start(empty(_G812)),throughout(block(_G1166)),throughout(block(_G1318)),throughout(pile(_G2274)),throughout(red(_G1166)),throughout(red(_G1318))]-[]]]]	],
%% 	[top(_G2230,_G826),on(_G2078,_G2310),on(_G1926,_G2078),on(_G1774,_G1926),on(_G1622,_G1774),on(_G1470,_G1622),on(_G1318,_G1470),on(_G1166,_G1318),on(_G1014,_G1166),on(_G862,_G1014),on(_G855,_G862)]
%% )).


%% _revese = False
%% with all key property
%% :-assert(activity_schema(
%% 	%%% stack(p1,p2)
%% 	stack,
%% 	[_G842,_G2290],
%% 	[		[unstack(_G828,_G871,_G878,_G842),[[at_goal(top(_G871,_G2290)),at_start(empty(_G828)),at_start(top(_G871,_G842)),throughout(block(_G871)),throughout(block(_G878)),throughout(pile(_G842)),throughout(red(_G871)),throughout(red(_G878))]-[]]],
%% 			[put(_G828,_G871,_G835),[[at_goal(top(_G871,_G2290)),at_start(empty(_G828)),at_start(top(_G871,_G842)),throughout(block(_G871)),throughout(red(_G871)),throughout(table(_G835))]-[]]],
%% 			[[unstack(_G828,_G878,_G1030,_G842),[[at_start(empty(_G828)),throughout(block(_G878)),throughout(block(_G1030)),throughout(pile(_G842)),throughout(red(_G878)),throughout(red(_G1030))]-[]]],[put(_G828,_G878,_G835),[[at_start(empty(_G828)),throughout(block(_G878)),throughout(red(_G878)),throughout(table(_G835))]-[]]]],
%% 			[unstack(_G828,_G1334,_G1486,_G842),[[at_start(empty(_G828)),throughout(block(_G1334)),throughout(block(_G1486)),throughout(blue(_G1486)),throughout(pile(_G842)),throughout(red(_G1334))]-[]]],
%% 			[put(_G828,_G1334,_G835),[[at_start(empty(_G828)),throughout(block(_G1334)),throughout(red(_G1334)),throughout(table(_G835))]-[]]],
%% 			[[unstack(_G828,_G1486,_G1638,_G842),[[at_start(empty(_G828)),throughout(block(_G1486)),throughout(block(_G1638)),throughout(blue(_G1486)),throughout(blue(_G1638)),throughout(pile(_G842))]-[]]],[put(_G828,_G1486,_G835),[[at_start(empty(_G828)),throughout(block(_G1486)),throughout(blue(_G1486)),throughout(table(_G835))]-[]]]],
%% 			[unstack(_G828,_G2094,_G2246,_G842),[[at_goal(top(_G2246,_G842)),at_start(empty(_G828)),throughout(block(_G2094)),throughout(blue(_G2094)),throughout(pallet(_G2246)),throughout(pile(_G842))]-[]]],
%% 			[stack(_G828,_G2094,_G2326,_G2290),[[at_start(empty(_G828)),at_start(top(_G2326,_G2290)),throughout(block(_G2094)),throughout(blue(_G2094)),throughout(pallet(_G2326)),throughout(pile(_G2290))]-[]]],
%% 			[[pick(_G828,_G1942,_G835),[[at_start(empty(_G828)),throughout(block(_G1942)),throughout(blue(_G1942)),throughout(table(_G835))]-[]]],[stack(_G828,_G1942,_G2094,_G2290),[[at_start(empty(_G828)),throughout(block(_G1942)),throughout(block(_G2094)),throughout(blue(_G1942)),throughout(blue(_G2094)),throughout(pile(_G2290))]-[]]]],
%% 			[pick(_G828,_G1334,_G835),[[at_start(empty(_G828)),throughout(block(_G1334)),throughout(red(_G1334)),throughout(table(_G835))]-[]]],
%% 			[stack(_G828,_G1334,_G1486,_G2290),[[at_start(empty(_G828)),throughout(block(_G1334)),throughout(block(_G1486)),throughout(blue(_G1486)),throughout(pile(_G2290)),throughout(red(_G1334))]-[]]],
%% 			[[pick(_G828,_G1182,_G835),[[at_start(empty(_G828)),throughout(block(_G1182)),throughout(red(_G1182)),throughout(table(_G835))]-[]]],[stack(_G828,_G1182,_G1334,_G2290),[[at_start(empty(_G828)),throughout(block(_G1182)),throughout(block(_G1334)),throughout(pile(_G2290)),throughout(red(_G1182)),throughout(red(_G1334))]-[]]]],
%% 			[pick(_G828,_G871,_G835),[[at_goal(top(_G871,_G2290)),at_start(empty(_G828)),at_start(top(_G871,_G842)),throughout(block(_G871)),throughout(red(_G871)),throughout(table(_G835))]-[]]],
%% 			[stack(_G828,_G871,_G878,_G2290),[[at_goal(top(_G871,_G2290)),at_start(empty(_G828)),at_start(top(_G871,_G842)),throughout(block(_G871)),throughout(block(_G878)),throughout(pile(_G2290)),throughout(red(_G871)),throughout(red(_G878))]-[]]]	],
%% 	[top(_G2246,_G842),top(_G871,_G2290),on(_G2094,_G2326),on(_G1942,_G2094),on(_G1790,_G1942),on(_G1638,_G1790),on(_G1486,_G1638),on(_G1334,_G1486),on(_G1182,_G1334),on(_G1030,_G1182),on(_G878,_G1030),on(_G871,_G878)]
%% )).
