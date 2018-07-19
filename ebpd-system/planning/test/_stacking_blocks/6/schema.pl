
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,2).
:-nb_setval(weight,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(activity_schema(
	%%% stack(p1,p2,p3)
	stack,
	[_G601,_G1401,_G681],
	[		[unstack(_G587,_G630,_G637,_G601),[[throughout(block(_G630)),throughout(block(_G637)),throughout(blue(_G630)),throughout(blue(_G637)),throughout(pile(_G601))]-[]]],
			[stack(_G587,_G630,_G717,_G681),[[at_start(top(_G717,_G681)),throughout(block(_G630)),throughout(blue(_G630)),throughout(pile(_G681))]-[]]],
			[[unstack(_G587,_G637,_G797,_G601),[[throughout(block(_G637)),throughout(block(_G797)),throughout(blue(_G637)),throughout(blue(_G797)),throughout(pile(_G601))]-[]]],[stack(_G587,_G637,_G630,_G681),[[throughout(block(_G630)),throughout(block(_G637)),throughout(blue(_G630)),throughout(blue(_G637)),throughout(pile(_G681))]-[]]]],
			[unstack(_G587,_G1117,_G1277,_G601),[[at_goal(top(_G1277,_G601)),throughout(block(_G1117)),throughout(blue(_G1117)),throughout(pile(_G601))]-[]]],
			[stack(_G587,_G1117,_G957,_G681),[[throughout(block(_G957)),throughout(block(_G1117)),throughout(blue(_G957)),throughout(blue(_G1117)),throughout(pile(_G681))]-[]]],
			[unstack(_G587,_G1430,_G1437,_G1401),[[throughout(block(_G1430)),throughout(block(_G1437)),throughout(pile(_G1401)),throughout(red(_G1430)),throughout(red(_G1437))]-[]]],
			[stack(_G587,_G1430,_G1117,_G681),[[throughout(block(_G1117)),throughout(block(_G1430)),throughout(blue(_G1117)),throughout(pile(_G681)),throughout(red(_G1430))]-[]]],
			[[unstack(_G587,_G1437,_G1597,_G1401),[[throughout(block(_G1437)),throughout(block(_G1597)),throughout(pile(_G1401)),throughout(red(_G1437)),throughout(red(_G1597))]-[]]],[stack(_G587,_G1437,_G1430,_G681),[[throughout(block(_G1430)),throughout(block(_G1437)),throughout(pile(_G681)),throughout(red(_G1430)),throughout(red(_G1437))]-[]]]],
			[unstack(_G587,_G1917,_G2077,_G1401),[[at_goal(top(_G2077,_G1401)),throughout(block(_G1917)),throughout(pile(_G1401)),throughout(red(_G1917))]-[]]],
			[stack(_G587,_G1917,_G1757,_G681),[[throughout(block(_G1757)),throughout(block(_G1917)),throughout(pile(_G681)),throughout(red(_G1757)),throughout(red(_G1917))]-[]]]	],
	[top(_G1277,_G601),top(_G2077,_G1401),on(_G630,_G717),on(_G637,_G630),on(_G797,_G637),on(_G957,_G797),on(_G1117,_G957),on(_G1430,_G1117),on(_G1437,_G1430),on(_G1597,_G1437),on(_G1757,_G1597),on(_G1917,_G1757)]
)).
