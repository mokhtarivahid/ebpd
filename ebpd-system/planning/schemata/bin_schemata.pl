
%% works with 'sbpabs_h_diff' and weight 2 in heuristic computation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,2).
:-nb_setval(weight,5).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(activity_schema(
	%%% clean(table1,bin1)
	clean,
	[_G447,_G503],
	[		[[pick(_G468,_G447),[[at_goal(in(_G468,_G503)),at_start(on(_G468,_G447)),throughout(table(_G447))]-[]]],
	         [drop(_G468,_G503),[[at_goal(in(_G468,_G503)),at_start(on(_G468,_G447)),throughout(bin(_G503))]-[]]]]],
	[in(_G468,_G503),in(_G580,_G503),in(_G692,_G503),in(_G804,_G503),in(_G916,_G503),in(_G1028,_G503),in(_G1140,_G503),in(_G1252,_G503),in(_G1364,_G503),in(_G1476,_G503)]
)).
