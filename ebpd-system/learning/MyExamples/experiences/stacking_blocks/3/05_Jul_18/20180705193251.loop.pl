:-assert(activity_schema(
	%%% stack(p1,p2)
	stack,
	[_G697,_G777],
	[		[unstack(_G683,_G726,_G733,_G697),[[at_start(empty(_G683)),at_start(top(_G726,_G697)),throughout(block(_G726)),throughout(block(_G733)),throughout(blue(_G726)),throughout(blue(_G733)),throughout(pile(_G697))]-[]]],
			[stack(_G683,_G726,_G813,_G777),[[at_start(empty(_G683)),at_start(top(_G726,_G697)),at_start(top(_G813,_G777)),throughout(block(_G726)),throughout(blue(_G726)),throughout(pallet(_G813)),throughout(pile(_G777))]-[]]],
			[unstack(_G683,_G733,_G893,_G697),[[at_start(empty(_G683)),throughout(block(_G733)),throughout(block(_G893)),throughout(blue(_G733)),throughout(blue(_G893)),throughout(pile(_G697))]-[]]],
			[stack(_G683,_G733,_G726,_G777),[[at_start(empty(_G683)),at_start(top(_G726,_G697)),throughout(block(_G726)),throughout(block(_G733)),throughout(blue(_G726)),throughout(blue(_G733)),throughout(pile(_G777))]-[]]],
			[[unstack(_G683,_G893,_G1053,_G697),[[at_start(empty(_G683)),throughout(block(_G893)),throughout(block(_G1053)),throughout(blue(_G893)),throughout(blue(_G1053)),throughout(pile(_G697))]-[]]],[stack(_G683,_G893,_G733,_G777),[[at_start(empty(_G683)),throughout(block(_G733)),throughout(block(_G893)),throughout(blue(_G733)),throughout(blue(_G893)),throughout(pile(_G777))]-[]]]],
			[unstack(_G683,_G1213,_G1373,_G697),[[at_start(empty(_G683)),throughout(block(_G1213)),throughout(block(_G1373)),throughout(blue(_G1213)),throughout(pile(_G697)),throughout(red(_G1373))]-[]]],
			[stack(_G683,_G1213,_G1053,_G777),[[at_start(empty(_G683)),throughout(block(_G1053)),throughout(block(_G1213)),throughout(blue(_G1053)),throughout(blue(_G1213)),throughout(pile(_G777))]-[]]],
			[unstack(_G683,_G1373,_G1533,_G697),[[at_start(empty(_G683)),throughout(block(_G1373)),throughout(block(_G1533)),throughout(pile(_G697)),throughout(red(_G1373)),throughout(red(_G1533))]-[]]],
			[stack(_G683,_G1373,_G1213,_G777),[[at_start(empty(_G683)),throughout(block(_G1213)),throughout(block(_G1373)),throughout(blue(_G1213)),throughout(pile(_G777)),throughout(red(_G1373))]-[]]],
			[[unstack(_G683,_G1533,_G1693,_G697),[[at_start(empty(_G683)),throughout(block(_G1533)),throughout(block(_G1693)),throughout(pile(_G697)),throughout(red(_G1533)),throughout(red(_G1693))]-[]]],[stack(_G683,_G1533,_G1373,_G777),[[at_start(empty(_G683)),throughout(block(_G1373)),throughout(block(_G1533)),throughout(pile(_G777)),throughout(red(_G1373)),throughout(red(_G1533))]-[]]]],
			[unstack(_G683,_G1853,_G2013,_G697),[[at_goal(top(_G2013,_G777)),at_start(empty(_G683)),throughout(block(_G1853)),throughout(block(_G2013)),throughout(pile(_G697)),throughout(red(_G1853)),throughout(red(_G2013))]-[]]],
			[put(_G683,_G1853,_G690),[[at_start(empty(_G683)),throughout(block(_G1853)),throughout(red(_G1853)),throughout(table(_G690))]-[]]],
			[unstack(_G683,_G2013,_G2165,_G697),[[at_goal(top(_G2013,_G777)),at_goal(top(_G2165,_G697)),at_start(empty(_G683)),throughout(block(_G2013)),throughout(pallet(_G2165)),throughout(pile(_G697)),throughout(red(_G2013))]-[]]],
			[put(_G683,_G2013,_G690),[[at_goal(top(_G2013,_G777)),at_start(empty(_G683)),throughout(block(_G2013)),throughout(red(_G2013)),throughout(table(_G690))]-[]]],
			[pick(_G683,_G1853,_G690),[[at_start(empty(_G683)),throughout(block(_G1853)),throughout(red(_G1853)),throughout(table(_G690))]-[]]],
			[stack(_G683,_G1853,_G1693,_G777),[[at_start(empty(_G683)),throughout(block(_G1693)),throughout(block(_G1853)),throughout(pile(_G777)),throughout(red(_G1693)),throughout(red(_G1853))]-[]]],
			[pick(_G683,_G2013,_G690),[[at_goal(top(_G2013,_G777)),at_start(empty(_G683)),throughout(block(_G2013)),throughout(red(_G2013)),throughout(table(_G690))]-[]]],
			[stack(_G683,_G2013,_G1853,_G777),[[at_goal(top(_G2013,_G777)),at_start(empty(_G683)),throughout(block(_G1853)),throughout(block(_G2013)),throughout(pile(_G777)),throughout(red(_G1853)),throughout(red(_G2013))]-[]]]	],
	[top(_G2165,_G697),top(_G2013,_G777),on(_G726,_G813),on(_G733,_G726),on(_G893,_G733),on(_G1053,_G893),on(_G1213,_G1053),on(_G1373,_G1213),on(_G1533,_G1373),on(_G1693,_G1533),on(_G1853,_G1693),on(_G2013,_G1853)]
)).
