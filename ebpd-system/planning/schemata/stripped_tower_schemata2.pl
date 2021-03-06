%% this does not include 'base' property

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,2).
:-nb_setval(weight,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(activity_schema(
	%%% unstack_stack(p1,p2)
	unstack_stack,
	[_G939,_G2387],
	[		[unstack(_G925,_G968,_G975,_G939),[[at_goal(in(_G968,_G2387)),at_goal(in(_G975,_G2387)),at_goal(top(_G968,_G2387)),at_start(empty(_G925)),at_start(in(_G968,_G939)),at_start(in(_G975,_G939)),at_start(top(_G968,_G939)),throughout(blue(_G968)),throughout(blue(_G975)),throughout(pile(_G939))]-[]]],
			[put(_G925,_G968,_G932),[[at_goal(in(_G968,_G2387)),at_goal(top(_G968,_G2387)),at_start(empty(_G925)),at_start(in(_G968,_G939)),at_start(top(_G968,_G939)),throughout(blue(_G968)),throughout(table(_G932))]-[]]],
			[[unstack(_G925,_G975,_G1127,_G939),[[at_goal(in(_G975,_G2387)),at_goal(in(_G1127,_G2387)),at_start(empty(_G925)),at_start(in(_G975,_G939)),at_start(in(_G1127,_G939)),throughout(blue(_G975)),throughout(blue(_G1127)),throughout(pile(_G939))]-[]]],[put(_G925,_G975,_G932),[[at_goal(in(_G975,_G2387)),at_start(empty(_G925)),at_start(in(_G975,_G939)),throughout(blue(_G975)),throughout(table(_G932))]-[]]]],
			[unstack(_G925,_G1431,_G1583,_G939),[[at_goal(in(_G1431,_G2387)),at_goal(in(_G1583,_G2387)),at_start(empty(_G925)),at_start(in(_G1431,_G939)),at_start(in(_G1583,_G939)),throughout(blue(_G1431)),throughout(pile(_G939)),throughout(red(_G1583))]-[]]],
			[put(_G925,_G1431,_G932),[[at_goal(in(_G1431,_G2387)),at_start(empty(_G925)),at_start(in(_G1431,_G939)),throughout(blue(_G1431)),throughout(table(_G932))]-[]]],
			[[unstack(_G925,_G1583,_G1735,_G939),[[at_goal(in(_G1583,_G2387)),at_goal(in(_G1735,_G2387)),at_start(empty(_G925)),at_start(in(_G1583,_G939)),at_start(in(_G1735,_G939)),throughout(pile(_G939)),throughout(red(_G1583)),throughout(red(_G1735))]-[]]],[put(_G925,_G1583,_G932),[[at_goal(in(_G1583,_G2387)),at_start(empty(_G925)),at_start(in(_G1583,_G939)),throughout(red(_G1583)),throughout(table(_G932))]-[]]]],
			[unstack(_G925,_G2039,_G2191,_G939),[[at_goal(in(_G2039,_G2387)),at_goal(in(_G2191,_G2387)),at_start(empty(_G925)),at_start(in(_G2039,_G939)),at_start(in(_G2191,_G939)),throughout(base(_G2191)),throughout(pile(_G939)),throughout(red(_G2039)),throughout(red(_G2191))]-[]]],
			[put(_G925,_G2039,_G932),[[at_goal(in(_G2039,_G2387)),at_start(empty(_G925)),at_start(in(_G2039,_G939)),throughout(red(_G2039)),throughout(table(_G932))]-[]]],
			[unstack(_G925,_G2191,_G2343,_G939),[[at_goal(in(_G2191,_G2387)),at_goal(top(_G2343,_G939)),at_start(empty(_G925)),at_start(in(_G2191,_G939)),throughout(base(_G2191)),throughout(pallet(_G2343)),throughout(pile(_G939)),throughout(red(_G2191))]-[]]],
			[stack(_G925,_G2191,_G2423,_G2387),[[at_goal(in(_G2191,_G2387)),at_start(empty(_G925)),at_start(in(_G2191,_G939)),at_start(top(_G2423,_G2387)),throughout(base(_G2191)),throughout(pallet(_G2423)),throughout(pile(_G2387)),throughout(red(_G2191))]-[]]],
			[pick(_G925,_G1431,_G932),[[at_goal(in(_G1431,_G2387)),at_start(empty(_G925)),at_start(in(_G1431,_G939)),throughout(blue(_G1431)),throughout(table(_G932))]-[]]],
			[stack(_G925,_G1431,_G2191,_G2387),[[at_goal(in(_G1431,_G2387)),at_goal(in(_G2191,_G2387)),at_start(empty(_G925)),at_start(in(_G1431,_G939)),at_start(in(_G2191,_G939)),throughout(base(_G2191)),throughout(blue(_G1431)),throughout(pile(_G2387)),throughout(red(_G2191))]-[]]],
			[pick(_G925,_G2039,_G932),[[at_goal(in(_G2039,_G2387)),at_start(empty(_G925)),at_start(in(_G2039,_G939)),throughout(red(_G2039)),throughout(table(_G932))]-[]]],
			[stack(_G925,_G2039,_G1431,_G2387),[[at_goal(in(_G1431,_G2387)),at_goal(in(_G2039,_G2387)),at_start(empty(_G925)),at_start(in(_G1431,_G939)),at_start(in(_G2039,_G939)),throughout(blue(_G1431)),throughout(pile(_G2387)),throughout(red(_G2039))]-[]]],
			[[pick(_G925,_G1279,_G932),[[at_goal(in(_G1279,_G2387)),at_start(empty(_G925)),at_start(in(_G1279,_G939)),throughout(blue(_G1279)),throughout(table(_G932))]-[]]],[stack(_G925,_G1279,_G2039,_G2387),[[at_goal(in(_G1279,_G2387)),at_goal(in(_G2039,_G2387)),at_start(empty(_G925)),at_start(in(_G1279,_G939)),at_start(in(_G2039,_G939)),throughout(blue(_G1279)),throughout(pile(_G2387)),throughout(red(_G2039))]-[]]],[pick(_G925,_G1887,_G932),[[at_goal(in(_G1887,_G2387)),at_start(empty(_G925)),at_start(in(_G1887,_G939)),throughout(red(_G1887)),throughout(table(_G932))]-[]]],[stack(_G925,_G1887,_G1279,_G2387),[[at_goal(in(_G1279,_G2387)),at_goal(in(_G1887,_G2387)),at_start(empty(_G925)),at_start(in(_G1279,_G939)),at_start(in(_G1887,_G939)),throughout(blue(_G1279)),throughout(pile(_G2387)),throughout(red(_G1887))]-[]]]],
			[pick(_G925,_G968,_G932),[[at_goal(in(_G968,_G2387)),at_goal(top(_G968,_G2387)),at_start(empty(_G925)),at_start(in(_G968,_G939)),at_start(top(_G968,_G939)),throughout(blue(_G968)),throughout(table(_G932))]-[]]],
			[stack(_G925,_G968,_G1583,_G2387),[[at_goal(in(_G968,_G2387)),at_goal(in(_G1583,_G2387)),at_goal(top(_G968,_G2387)),at_start(empty(_G925)),at_start(in(_G968,_G939)),at_start(in(_G1583,_G939)),at_start(top(_G968,_G939)),throughout(blue(_G968)),throughout(pile(_G2387)),throughout(red(_G1583))]-[]]]	],
	[top(_G2343,_G939),top(_G968,_G2387),in(_G2191,_G2387),in(_G2039,_G2387),in(_G1887,_G2387),in(_G1735,_G2387),in(_G1583,_G2387),in(_G1431,_G2387),in(_G1279,_G2387),in(_G1127,_G2387),in(_G975,_G2387),in(_G968,_G2387),on(_G2191,_G2423),on(_G1431,_G2191),on(_G2039,_G1431),on(_G1279,_G2039),on(_G1887,_G1279),on(_G1127,_G1887),on(_G1735,_G1127),on(_G975,_G1735),on(_G1583,_G975),on(_G968,_G1583)]
)).
