
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,2).
:-nb_setval(weight,3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(activity_schema(
	%%% clean(table1,tray1)
	clean,
	[_G231,_G259],
	[		[[pick(_G217,_G224,_G231),[[at_goal(free(_G217)),at_goal(at(_G217,_G259)),at_goal(in(_G224,_G259)),at_start(free(_G217)),at_start(at(_G217,_G231)),at_start(on(_G224,_G231)),throughout(arm(_G217)),throughout(bottle(_G224)),throughout(table(_G231))]-[]]],[place(_G217,_G224,_G259),[[at_goal(free(_G217)),at_goal(at(_G217,_G259)),at_goal(in(_G224,_G259)),at_start(free(_G217)),at_start(at(_G217,_G231)),at_start(on(_G224,_G231)),throughout(arm(_G217)),throughout(bottle(_G224)),throughout(tray(_G259))]-[]]]]	],
	[free(_G217),at(_G217,_G259),in(_G224,_G259),in(_G336,_G259),in(_G448,_G259),in(_G560,_G259)]
)).


%%% :-assert(activity_schema(
%%% 	%%% clear8(table1,tray1)
%%% 	clear,
%%% 	[_G439,_G698],
%%% 	[		[[pick(_G432,_G439),[[at_goal(on(_G432,_G698)),at_start(on(_G432,_G439))]-[]]],
%%% 			 [place(_G432,_G698),[[at_goal(on(_G432,_G698)),at_start(on(_G432,_G439))]-[]]]]],
%%% 	[on(_G432,_G698),on(_G460,_G698),on(_G488,_G698),on(_G516,_G698),on(_G544,_G698),on(_G572,_G698),on(_G600,_G698),on(_G628,_G698)]
%%% )).
%%% 
%%% 
%%% %%%% :-assert(activity_schema(
%%% %%%% 	%%% clear8(table1,tray1)
%%% %%%% 	clear,
%%% %%%% 	[_G439,_G698],
%%% %%%% 	[		[[pick(_G432,_G439),[[at_goal(on(_G432,_G698)),at_start(on(_G432,_G439))]-[]]],
%%% %%%% 			 [place(_G432,_G698),[[at_goal(on(_G432,_G698)),at_start(on(_G432,_G439))]-[]]]]	],
%%% %%%% 	[on(_G432,_G698),on(_G460,_G698),on(_G488,_G698),on(_G516,_G698),on(_G544,_G698),on(_G572,_G698),on(_G600,_G698),on(_G628,_G698)]
%%% %%%% )).
