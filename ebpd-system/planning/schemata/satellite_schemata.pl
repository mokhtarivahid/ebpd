
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-nb_setval(alpha,1).
:-nb_setval(weight,2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-assert(activity_schema(
	%%% take_image1(satellite0)
	take_image1,
	[_G237],
	[		[switch_on(_G230,_G237),[[at_start(power_avail(_G237)),throughout(instrument(_G230)),throughout(satellite(_G237)),throughout(on_board(_G230,_G237))]-[]]],
			[turn_to(_G237,_G257,_G264),[[at_start(power_avail(_G237)),at_start(pointing(_G237,_G264)),throughout(direction(_G257)),throughout(direction(_G264)),throughout(satellite(_G237))]-[]]],
			[calibrate(_G237,_G230,_G257),[[at_start(power_avail(_G237)),throughout(direction(_G257)),throughout(instrument(_G230)),throughout(satellite(_G237)),throughout(on_board(_G230,_G237))]-[]]],
			[[turn_to(_G237,_G313,_G257),[[at_start(power_avail(_G237)),throughout(direction(_G257)),throughout(direction(_G313)),throughout(satellite(_G237))]-[]]],[take_image(_G237,_G313,_G230,_G355),[[at_start(power_avail(_G237)),throughout(direction(_G313)),throughout(instrument(_G230)),throughout(mode(_G355)),throughout(satellite(_G237)),throughout(on_board(_G230,_G237))]-[]]]]	],
	[have_image(_G441,_G355),have_image(_G377,_G355),have_image(_G505,_G547),have_image(_G313,_G355)]
)).

:-assert(activity_schema(
	%%% take_image2(satellite0)
	take_image2,
	[_G233],
	[		[switch_on(_G226,_G233),[[at_start(power_avail(_G233)),throughout(instrument(_G226)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]],
			[calibrate(_G233,_G226,_G260),[[at_start(power_avail(_G233)),at_start(pointing(_G233,_G260)),throughout(direction(_G260)),throughout(instrument(_G226)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]],
			[turn_to(_G233,_G281,_G260),[[at_start(power_avail(_G233)),at_start(pointing(_G233,_G260)),throughout(direction(_G260)),throughout(direction(_G281)),throughout(satellite(_G233))]-[]]],
			[take_image(_G233,_G281,_G226,_G323),[[at_start(power_avail(_G233)),throughout(direction(_G281)),throughout(instrument(_G226)),throughout(mode(_G323)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]],
			[[turn_to(_G233,_G345,_G281),[[at_start(power_avail(_G233)),throughout(direction(_G281)),throughout(direction(_G345)),throughout(satellite(_G233))]-[]]],[take_image(_G233,_G345,_G226,_G323),[[at_start(power_avail(_G233)),throughout(direction(_G345)),throughout(instrument(_G226)),throughout(mode(_G323)),throughout(satellite(_G233)),throughout(on_board(_G226,_G233))]-[]]]]	],
	[have_image(_G409,_G323),have_image(_G345,_G323),have_image(_G473,_G515),have_image(_G281,_G323)]
)).

:-assert(activity_schema(
	%%% take_image_3(satellite0)
	take_image3,
	[_G305],
	[		[turn_to(_G305,_G312,_G319),[[at_start(power_avail(_G305)),at_start(pointing(_G305,_G319)),throughout(direction(_G312)),throughout(direction(_G319)),throughout(satellite(_G305))]-[]]],
			[switch_on(_G333,_G305),[[at_start(power_avail(_G305)),throughout(instrument(_G333)),throughout(satellite(_G305)),throughout(on_board(_G333,_G305))]-[]]],
			[calibrate(_G305,_G333,_G312),[[at_start(power_avail(_G305)),throughout(direction(_G312)),throughout(instrument(_G333)),throughout(satellite(_G305)),throughout(on_board(_G333,_G305))]-[]]],
			[[turn_to(_G305,_G388,_G312),[[at_start(power_avail(_G305)),throughout(direction(_G312)),throughout(direction(_G388)),throughout(satellite(_G305))]-[]]],[take_image(_G305,_G388,_G333,_G430),[[at_start(power_avail(_G305)),throughout(direction(_G388)),throughout(instrument(_G333)),throughout(mode(_G430)),throughout(satellite(_G305)),throughout(on_board(_G333,_G305))]-[]]]],
			[switch_off(_G333,_G305),[[at_start(power_avail(_G305)),throughout(instrument(_G333)),throughout(satellite(_G305)),throughout(on_board(_G333,_G305))]-[]]],
			[switch_on(_G593,_G305),[[at_start(power_avail(_G305)),throughout(instrument(_G593)),throughout(satellite(_G305)),throughout(on_board(_G593,_G305))]-[]]],
			[calibrate(_G305,_G593,_G516),[[at_start(power_avail(_G305)),throughout(direction(_G516)),throughout(instrument(_G593)),throughout(satellite(_G305)),throughout(on_board(_G593,_G305))]-[]]],
			[[turn_to(_G305,_G648,_G516),[[at_start(power_avail(_G305)),throughout(direction(_G516)),throughout(direction(_G648)),throughout(satellite(_G305))]-[]]],[take_image(_G305,_G648,_G593,_G690),[[at_start(power_avail(_G305)),throughout(direction(_G648)),throughout(instrument(_G593)),throughout(mode(_G690)),throughout(satellite(_G305)),throughout(on_board(_G593,_G305))]-[]]]]	],
	[have_image(_G648,_G690),have_image(_G712,_G754),have_image(_G776,_G754),have_image(_G452,_G430),have_image(_G388,_G430),have_image(_G516,_G430)]
)).

:-assert(activity_schema(
	%%% take_image_4(satellite0)
	take_image4,
	[_G308],
	[		[switch_on(_G301,_G308),[[at_start(power_avail(_G308)),throughout(instrument(_G301)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[calibrate(_G308,_G301,_G335),[[at_start(power_avail(_G308)),at_start(pointing(_G308,_G335)),throughout(direction(_G335)),throughout(instrument(_G301)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[turn_to(_G308,_G356,_G335),[[at_start(power_avail(_G308)),at_start(pointing(_G308,_G335)),throughout(direction(_G335)),throughout(direction(_G356)),throughout(satellite(_G308))]-[]]],
			[take_image(_G308,_G356,_G301,_G398),[[at_start(power_avail(_G308)),throughout(direction(_G356)),throughout(instrument(_G301)),throughout(mode(_G398)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[[turn_to(_G308,_G420,_G356),[[at_start(power_avail(_G308)),throughout(direction(_G356)),throughout(direction(_G420)),throughout(satellite(_G308))]-[]]],[take_image(_G308,_G420,_G301,_G398),[[at_start(power_avail(_G308)),throughout(direction(_G420)),throughout(instrument(_G301)),throughout(mode(_G398)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]]],
			[switch_off(_G301,_G308),[[at_start(power_avail(_G308)),throughout(instrument(_G301)),throughout(satellite(_G308)),throughout(on_board(_G301,_G308))]-[]]],
			[switch_on(_G561,_G308),[[at_start(power_avail(_G308)),throughout(instrument(_G561)),throughout(satellite(_G308)),throughout(on_board(_G561,_G308))]-[]]],
			[calibrate(_G308,_G561,_G484),[[at_start(power_avail(_G308)),throughout(direction(_G484)),throughout(instrument(_G561)),throughout(satellite(_G308)),throughout(on_board(_G561,_G308))]-[]]],
			[[turn_to(_G308,_G616,_G484),[[at_start(power_avail(_G308)),throughout(direction(_G484)),throughout(direction(_G616)),throughout(satellite(_G308))]-[]]],[take_image(_G308,_G616,_G561,_G658),[[at_start(power_avail(_G308)),throughout(direction(_G616)),throughout(instrument(_G561)),throughout(mode(_G658)),throughout(satellite(_G308)),throughout(on_board(_G561,_G308))]-[]]]]	],
	[have_image(_G616,_G658),have_image(_G680,_G722),have_image(_G744,_G722),have_image(_G420,_G398),have_image(_G356,_G398),have_image(_G484,_G398)]
)).

%% :-assert(activity_schema(
%% 	%%% take_image(instrument0)
%% 	take_image,
%% 	[_G300],
%% 	[		[switch_on(_G300,_G307),[[at_start(power_avail(_G307)),throughout(instrument(_G300)),throughout(satellite(_G307)),throughout(on_board(_G300,_G307))]-[]]],
%% 			[turn_to(_G307,_G327,_G334),[[at_start(power_avail(_G307)),throughout(direction(_G327)),throughout(direction(_G334)),throughout(satellite(_G307)),throughout(calibration_target(_G300,_G327)),throughout(on_board(_G300,_G307))]-[]]],
%% 			[calibrate(_G307,_G300,_G327),[[at_start(power_avail(_G307)),throughout(direction(_G327)),throughout(instrument(_G300)),throughout(satellite(_G307)),throughout(calibration_target(_G300,_G327)),throughout(on_board(_G300,_G307))]-[]]],
%% 			[turn_to(_G307,_G334,_G327),[[at_start(power_avail(_G307)),throughout(direction(_G327)),throughout(direction(_G334)),throughout(satellite(_G307)),throughout(calibration_target(_G300,_G327)),throughout(on_board(_G300,_G307))]-[]]],
%% 			[take_image(_G307,_G334,_G300,_G425),[[at_start(power_avail(_G307)),throughout(direction(_G334)),throughout(instrument(_G300)),throughout(mode(_G425)),throughout(satellite(_G307)),throughout(on_board(_G300,_G307)),throughout(supports(_G300,_G425))]-[]]],
%% 			[[turn_to(_G307,_G447,_G334),[[at_start(power_avail(_G307)),throughout(direction(_G334)),throughout(direction(_G447)),throughout(satellite(_G307)),throughout(on_board(_G300,_G307))]-[]]],[take_image(_G307,_G447,_G300,_G425),[[at_start(power_avail(_G307)),throughout(direction(_G447)),throughout(instrument(_G300)),throughout(mode(_G425)),throughout(satellite(_G307)),throughout(on_board(_G300,_G307)),throughout(supports(_G300,_G425))]-[]]]]	],
%% 	[have_image(_G575,_G617),have_image(_G334,_G425),have_image(_G511,_G425),have_image(_G447,_G425)]
%% )).

%% :-assert(activity_schema(
%%         %%% take_image(instrument0)
%%         take_image,
%%         [_G195],
%%         [               [switch_on(_G195),[[]-[]]],
%%                         [calibrate(_G195,_G222),[[throughout(calibration_target(_G195,_G222))]-[]]],
%%                         [[take_image(_G278,_G195,_G320),[[throughout(supports(_G195,_G320))]-[]]]]      ],
%%         [have_image(_G470,_G512),have_image(_G278,_G320),have_image(_G406,_G320),have_image(_G342,_G320)]
%% )).
