
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,2).
:-nb_setval(weight,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(activity_schema(
	%%% stack(t1,p1)
	stack,
	[_G1119,_G1155],
	[		[pick(_G1105,_G1112,_G1119),[[at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G1112,_G1119)),throughout(block(_G1112)),throughout(blue(_G1112)),throughout(table(_G1119))]-[]]],
			[stack(_G1105,_G1112,_G1191,_G1155),[[at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G1112,_G1119)),at_start(top(_G1191,_G1155)),throughout(block(_G1112)),throughout(blue(_G1112)),throughout(pallet(_G1191)),throughout(pile(_G1155))]-[]]],
			[[pick(_G1105,_G1264,_G1119),[[at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G1264,_G1119)),throughout(block(_G1264)),throughout(blue(_G1264)),throughout(table(_G1119))]-[]]],[stack(_G1105,_G1264,_G1112,_G1155),[[at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G1112,_G1119)),at_start(ontable(_G1264,_G1119)),throughout(block(_G1112)),throughout(block(_G1264)),throughout(blue(_G1112)),throughout(blue(_G1264)),throughout(pile(_G1155))]-[]]]],
			[pick(_G1105,_G2632,_G1119),[[at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G2632,_G1119)),throughout(block(_G2632)),throughout(red(_G2632)),throughout(table(_G1119))]-[]]],
			[stack(_G1105,_G2632,_G2480,_G1155),[[at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G2480,_G1119)),at_start(ontable(_G2632,_G1119)),throughout(block(_G2480)),throughout(block(_G2632)),throughout(blue(_G2480)),throughout(pile(_G1155)),throughout(red(_G2632))]-[]]],
			[[pick(_G1105,_G2784,_G1119),[[at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G2784,_G1119)),throughout(block(_G2784)),throughout(red(_G2784)),throughout(table(_G1119))]-[]]],[stack(_G1105,_G2784,_G2632,_G1155),[[at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G2632,_G1119)),at_start(ontable(_G2784,_G1119)),throughout(block(_G2632)),throughout(block(_G2784)),throughout(pile(_G1155)),throughout(red(_G2632)),throughout(red(_G2784))]-[]]]],
			[pick(_G1105,_G4000,_G1119),[[at_goal(top(_G4000,_G1155)),at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G4000,_G1119)),throughout(block(_G4000)),throughout(red(_G4000)),throughout(table(_G1119))]-[]]],
			[stack(_G1105,_G4000,_G3848,_G1155),[[at_goal(top(_G4000,_G1155)),at_start(empty(_G1105)),at_start(at(_G1105,_G1119)),at_start(ontable(_G3848,_G1119)),at_start(ontable(_G4000,_G1119)),throughout(block(_G3848)),throughout(block(_G4000)),throughout(pile(_G1155)),throughout(red(_G3848)),throughout(red(_G4000))]-[]]]	],
	[top(_G4000,_G1155),on(_G1112,_G1191),on(_G1264,_G1112),on(_G1416,_G1264),on(_G1568,_G1416),on(_G1720,_G1568),on(_G1872,_G1720),on(_G2024,_G1872),on(_G2176,_G2024),on(_G2328,_G2176),on(_G2480,_G2328),on(_G2632,_G2480),on(_G2784,_G2632),on(_G2936,_G2784),on(_G3088,_G2936),on(_G3240,_G3088),on(_G3392,_G3240),on(_G3544,_G3392),on(_G3696,_G3544),on(_G3848,_G3696),on(_G4000,_G3848)]
)).