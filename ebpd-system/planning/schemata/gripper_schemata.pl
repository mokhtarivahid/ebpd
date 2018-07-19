
%% works with 'sbpabs_h_diff' and weight 2 in heuristic computation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,3).
:-nb_setval(weight,3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(activity_schema(
	%%% transport(rooma,roomb)
	transport,
	[_G201,_G229],
	[		[[pick(_G194,_G201,_G208),[[at_goal(at(_G194,_G229)),at_start(at_robby(_G201)),at_start(free(_G208)),at_start(at(_G194,_G201)),throughout(ball(_G194)),throughout(gripper(_G208)),throughout(room(_G201))]-[]]],[drop(_G194,_G229,_G208),[[at_goal(at(_G194,_G229)),at_start(free(_G208)),at_start(at(_G194,_G201)),throughout(ball(_G194)),throughout(gripper(_G208)),throughout(room(_G229))]-[]]]]	],
	[at(_G194,_G229),at(_G290,_G229),at(_G386,_G229),at(_G482,_G229)]
)).

%% :-assert(activity_schema(
%% 	%%% transport(rooma,roomb)
%% 	transport,
%% 	[_G201,_G257],
%% 	[		[[pick(_G194,_G201,_G208),[[at_goal(at(_G194,_G257)),at_start(at_robby(_G201)),at_start(free(_G208)),at_start(at(_G194,_G201)),throughout(ball(_G194)),throughout(gripper(_G208)),throughout(room(_G201))]-[]]],[pick(_G222,_G201,_G236),[[at_goal(at(_G222,_G257)),at_start(at_robby(_G201)),at_start(free(_G236)),at_start(at(_G222,_G201)),throughout(ball(_G222)),throughout(gripper(_G236)),throughout(room(_G201))]-[]]],[drop(_G194,_G257,_G208),[[at_goal(at(_G194,_G257)),at_start(free(_G208)),at_start(at(_G194,_G201)),throughout(ball(_G194)),throughout(gripper(_G208)),throughout(room(_G257))]-[]]],[drop(_G222,_G257,_G236),[[at_goal(at(_G222,_G257)),at_start(free(_G236)),at_start(at(_G222,_G201)),throughout(ball(_G222)),throughout(gripper(_G236)),throughout(room(_G257))]-[]]]]	],
%% 	[at(_G194,_G257),at(_G222,_G257),at(_G346,_G257),at(_G374,_G257)]
%% )).
