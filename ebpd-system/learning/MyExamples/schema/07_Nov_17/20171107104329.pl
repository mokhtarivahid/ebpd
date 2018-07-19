:-assert(activity_schema(
	%%% take_image(instrument0)
	take_image,
	[_G195],
	[		[switch_on(_G195),[[]-[]]],
			[calibrate(_G195,_G222),[[throughout(calibration_target(_G195,_G222))]-[]]],
			[take_image(_G278,_G195,_G320),[[throughout(supports(_G195,_G320))]-[]]],
			[take_image(_G342,_G195,_G320),[[throughout(supports(_G195,_G320))]-[]]],
			[take_image(_G406,_G195,_G320),[[throughout(supports(_G195,_G320))]-[]]],
			[take_image(_G470,_G195,_G512),[[throughout(supports(_G195,_G512))]-[]]]	],
	[have_image(_G470,_G512),have_image(_G278,_G320),have_image(_G406,_G320),have_image(_G342,_G320)]
)).
