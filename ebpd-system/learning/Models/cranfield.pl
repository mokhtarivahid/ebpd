% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%  The Cranfield Benchmark -- Specification in Golog 2.0
%
%  (C) L. Seabra Lopes, FCT/UNL, Monte da Caparica, January 7, 1996
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%%
%% The product 'Cranfield Benchmark'
%%

:- new_frame(cranfield_benchmark),
   new_slot(cranfield_benchmark,isa,assembled_product),
   new_value(cranfield_benchmark,prod_fixture,fix_1),
   new_value(cranfield_benchmark,make_or_buy,make).

%%
%% The parts of the 'Cranfield Benchmark'
%%

%   not in use
%
%:- new_frame(cranfield_part),
%   new_slot(cranfield_part,isa,assembly_part),
%   new_value(cranfield_part,make_or_buy,buy),
%   new_value(cranfield_part,entity_made_by,cranfield_university).

%% Side plates:

:- new_frame(side_plate),
   new_slot(side_plate,isa,assembly_part),
   new_value(side_plate,part_tool,gp_1),
   new_value(side_plate,part_source_type,feeder),
   new_value(side_plate,part_source,feeder_sp),
   new_value(side_plate,approach_source,[500,10,-115,0]),
   new_value(side_plate,location_in_source,[500,10,-115,0]),
   new_value(side_plate,depart_source,[500,10,-115,0]).

%% Cross bars:

:- new_frame(cross_bar),
   new_slot(cross_bar,isa,assembly_part),
   new_value(cross_bar,part_tool,gp_2),
   new_value(cross_bar,part_source_type,feeder),
   new_value(cross_bar,part_source,feeder_cb),
   new_value(cross_bar,approach_source,[400,100,0,0]),
   new_value(cross_bar,location_in_source,[400,100,-135,0]),
   new_value(cross_bar,depart_source,[400,100,0,0]).

%% Shafts:

:- new_frame(shaft),
   new_slot(shaft,isa,assembly_part),
   new_value(shaft,part_tool,gp_2),
   new_value(shaft,part_source_type,pallet).

:- new_frame(sft_o1),
   new_slot(sft_o1,isa,shaft),
   new_value(sft_o1,part_source,pal_1),
   new_value(sft_o1,approach_source,[-300,200,0,0]),
   new_value(sft_o1,location_in_source,[-300,200,-115,0]),
   new_value(sft_o1,depart_source,[-300,200,0,0]).

:- new_frame(sft_o2),  %% Added 2005
   new_slot(sft_o2,isa,shaft),
   new_value(sft_o2,part_source,pal_1),
   new_value(sft_o2,approach_source,[-300,300,0,0]),
   new_value(sft_o2,location_in_source,[-300,300,-115,0]),
   new_value(sft_o2,depart_source,[-300,300,0,0]).

%% Levers:

:- new_frame(lever),
   new_slot(lever,isa,assembly_part),
   new_value(lever,part_tool,gp_2),
   new_value(lever,part_source_type,pallet).

:- new_frame(lv_o1),
   new_slot(lv_o1,isa,lever),
   new_value(lv_o1,part_source,pal_1),
   new_value(lv_o1,approach_source,[-310,200,0,0]),
   new_value(lv_o1,location_in_source,[-310,200,-115,0]),
   new_value(lv_o1,depart_source,[-310,200,0,0]).

%% Spacer pegs:

:- new_frame(spacer_peg),
   new_slot(spacer_peg,isa,assembly_part),
   new_value(spacer_peg,part_tool,gp_3),
   new_value(spacer_peg,part_source_type,pallet).

:- new_frame(peg_o1),
   new_slot(peg_o1,isa,spacer_peg),
   new_value(peg_o1,part_source,pal_2),
   new_value(peg_o1,approach_source,[-330,210,0,0]),
   new_value(peg_o1,location_in_source,[-330,210,-115,0]),
   new_value(peg_o1,depart_source,[-330,210,0,0]).

:- new_frame(peg_o2),
   new_slot(peg_o2,isa,spacer_peg),
   new_value(peg_o2,part_source,pal_2),
   new_value(peg_o2,approach_source,[-330,220,0,0]),
   new_value(peg_o2,location_in_source,[-330,220,-115,0]),
   new_value(peg_o2,depart_source,[-330,220,0,0]).

:- new_frame(peg_o3),
   new_slot(peg_o3,isa,spacer_peg),
   new_value(peg_o3,part_source,pal_2),
   new_value(peg_o3,approach_source,[-330,230,0,0]),
   new_value(peg_o3,location_in_source,[-330,230,-115,0]),
   new_value(peg_o3,depart_source,[-330,230,0,0]).

:- new_frame(peg_o4),
   new_slot(peg_o4,isa,spacer_peg),
   new_value(peg_o4,part_source,pal_2),
   new_value(peg_o4,approach_source,[-330,240,0,0]),
   new_value(peg_o4,location_in_source,[-330,240,-115,0]),
   new_value(peg_o4,depart_source,[-330,240,0,0]).

:- new_frame(peg_o5),
   new_slot(peg_o5,isa,spacer_peg),
   new_value(peg_o5,part_source,pal_2),
   new_value(peg_o5,approach_source,[-330,240,0,0]),
   new_value(peg_o5,location_in_source,[-330,240,-115,0]),
   new_value(peg_o5,depart_source,[-330,240,0,0]).

%% Locking pins:

:- new_frame(lock_pin),
   new_slot(lock_pin,isa,assembly_part),
   new_value(lock_pin,part_tool,gp_3),
   new_value(lock_pin,part_source_type,pallet).

:- new_frame(p_o1),
   new_slot(p_o1,isa,lock_pin),
   new_value(p_o1,part_source,pal_2),
   new_value(p_o1,approach_source,[-310,210,0,0]),
   new_value(p_o1,location_in_source,[-310,210,-115,0]),
   new_value(p_o1,depart_source,[-310,210,0,0]).

:- new_frame(p_o2),
   new_slot(p_o2,isa,lock_pin),
   new_value(p_o2,part_source,pal_2),
   new_value(p_o2,approach_source,[-310,220,0,0]),
   new_value(p_o2,location_in_source,[-310,220,-115,0]),
   new_value(p_o2,depart_source,[-310,220,0,0]).

:- new_frame(p_o3),
   new_slot(p_o3,isa,lock_pin),
   new_value(p_o3,part_source,pal_2),
   new_value(p_o3,approach_source,[-310,230,0,0]),
   new_value(p_o3,location_in_source,[-310,230,-115,0]),
   new_value(p_o3,depart_source,[-310,230,0,0]).

:- new_frame(p_o4),
   new_slot(p_o4,isa,lock_pin),
   new_value(p_o4,part_source,pal_2),
   new_value(p_o4,approach_source,[-310,240,0,0]),
   new_value(p_o4,location_in_source,[-310,240,-115,0]),
   new_value(p_o4,depart_source,[-310,240,0,0]).

:- new_frame(p_o5),
   new_slot(p_o5,isa,lock_pin),
   new_value(p_o5,part_source,pal_2),
   new_value(p_o5,approach_source,[-310,250,0,0]),
   new_value(p_o5,location_in_source,[-310,250,-115,0]),
   new_value(p_o5,depart_source,[-310,250,0,0]).

:- new_frame(p_o6),
   new_slot(p_o6,isa,lock_pin),
   new_value(p_o6,part_source,pal_2),
   new_value(p_o6,approach_source,[-310,260,0,0]),
   new_value(p_o6,location_in_source,[-310,260,-115,0]),
   new_value(p_o6,depart_source,[-310,260,0,0]).

:- new_frame(p_o7),
   new_slot(p_o7,isa,lock_pin),
   new_value(p_o7,part_source,pal_2),
   new_value(p_o7,approach_source,[-310,270,0,0]),
   new_value(p_o7,location_in_source,[-310,270,-115,0]),
   new_value(p_o7,depart_source,[-310,270,0,0]).

:- new_frame(p_o8),
   new_slot(p_o8,isa,lock_pin),
   new_value(p_o8,part_source,pal_2),
   new_value(p_o8,approach_source,[-310,280,0,0]),
   new_value(p_o8,location_in_source,[-310,280,-115,0]),
   new_value(p_o8,depart_source,[-310,280,0,0]).

:- new_frame(p_o9),
   new_slot(p_o9,isa,lock_pin),
   new_value(p_o9,part_source,pal_2),
   new_value(p_o9,approach_source,[-310,290,0,0]),
   new_value(p_o9,location_in_source,[-310,290,-115,0]),
   new_value(p_o9,depart_source,[-310,290,0,0]).

%%
%% The components of the 'Cranfield Benchmark'
%%

:- new_frame(cranf_sp1),
   new_slot(cranf_sp1,isa,assembly_component),
   new_value(cranf_sp1,in_product,cranfield_benchmark),
   new_value(cranf_sp1,part,side_plate),
   new_value(cranf_sp1,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_sp1,mate_pos,[25,405,-115,0]),
   new_value(cranf_sp1,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_sp1,contacts,
     [ cranf_peg1,cranf_peg2,cranf_peg3,cranf_peg4,cranf_sft1,
       cranf_cb1,cranf_lv1,cranf_p1,cranf_p2,cranf_p7,cranf_p8 ]).

:- new_frame(cranf_peg1),
   new_slot(cranf_peg1,isa,assembly_component),
   new_value(cranf_peg1,in_product,cranfield_benchmark),
   new_value(cranf_peg1,part,spacer_peg),
   new_value(cranf_peg1,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_peg1,mate_pos,[25,405,-105,0]),
   new_value(cranf_peg1,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_peg1,contacts,
     [ cranf_sp1,cranf_p1,cranf_cb1,cranf_p3,cranf_sp2 ]),
   new_values(cranf_peg1,previous_mates,[cranf_sp1]).

:- new_frame(cranf_peg2),
   new_slot(cranf_peg2,isa,assembly_component),
   new_value(cranf_peg2,in_product,cranfield_benchmark),
   new_value(cranf_peg2,part,spacer_peg),
   new_value(cranf_peg2,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_peg2,mate_pos,[25,405,-105,0]),
   new_value(cranf_peg2,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_peg2,contacts,
     [ cranf_sp1,cranf_p2,cranf_cb1,cranf_p4,cranf_sp2 ]),
   new_values(cranf_peg2,previous_mates,[ cranf_sp1 ]).

:- new_frame(cranf_peg3),
   new_slot(cranf_peg3,isa,assembly_component),
   new_value(cranf_peg3,in_product,cranfield_benchmark),
   new_value(cranf_peg3,part,spacer_peg),
   new_value(cranf_peg3,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_peg3,mate_pos,[25,405,-105,0]),
   new_value(cranf_peg3,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_peg3,contacts,[ cranf_sp1,cranf_sp2,cranf_p5,cranf_p7 ]),
   new_values(cranf_peg3,previous_mates,[ cranf_sp1 ]).

:- new_frame(cranf_peg4),
   new_slot(cranf_peg4,isa,assembly_component),
   new_value(cranf_peg4,in_product,cranfield_benchmark),
   new_value(cranf_peg4,part,spacer_peg),
   new_value(cranf_peg4,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_peg4,mate_pos,[25,405,-105,0]),
   new_value(cranf_peg4,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_peg4,contacts,[ cranf_sp1,cranf_sp2,cranf_p6,cranf_p8 ]),
   new_values(cranf_peg4,previous_mates,[ cranf_sp1 ]).

:- new_frame(cranf_sft1),
   new_slot(cranf_sft1,isa,assembly_component),
   new_value(cranf_sft1,in_product,cranfield_benchmark),
   new_value(cranf_sft1,part,shaft),
   new_value(cranf_sft1,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_sft1,mate_pos,[25,405,-115,0]),
   new_value(cranf_sft1,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_sft1,contacts,[ cranf_sp1,cranf_lv1,cranf_sp2 ]),
   new_values(cranf_sft1,previous_mates,[ cranf_sp1 ]).

:- new_frame(cranf_cb1),
   new_slot(cranf_cb1,isa,assembly_component),
   new_value(cranf_cb1,in_product,cranfield_benchmark),
   new_value(cranf_cb1,part,cross_bar),
   new_value(cranf_cb1,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_cb1,mate_pos,[25,405,-115,0]),
   new_value(cranf_cb1,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_cb1,contacts,[ cranf_sp1,cranf_peg1,cranf_peg2,cranf_sp2 ]),
   new_values(cranf_cb1,previous_mates,[ cranf_peg1,cranf_peg2 ]).

:- new_frame(cranf_lv1),
   new_slot(cranf_lv1,isa,assembly_component),
   new_value(cranf_lv1,in_product,cranfield_benchmark),
   new_value(cranf_lv1,part,lever),
   new_value(cranf_lv1,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_lv1,mate_pos,[25,405,-105,0]),
   new_value(cranf_lv1,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_lv1,contacts,[ cranf_sp1,cranf_sft1,cranf_sp2 ]),
   new_values(cranf_lv1,previous_mates,[ cranf_sft1 ]).

:- new_frame(cranf_sp2),
   new_slot(cranf_sp2,isa,assembly_component),
   new_value(cranf_sp2,in_product,cranfield_benchmark),
   new_value(cranf_sp2,part,side_plate),
   new_value(cranf_sp2,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_sp2,mate_pos,[25,405,-105,0]),
   new_value(cranf_sp2,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_sp2,contacts,
     [ cranf_peg1,cranf_cb1,cranf_peg2,cranf_sft1,
       cranf_lv1,cranf_peg3,cranf_peg4,cranf_p3,cranf_p4,cranf_p5,cranf_p6 ]),
   new_values(cranf_sp2,previous_mates,
     [ cranf_cb1,cranf_lv1,cranf_peg3,cranf_peg4 ]).

:- new_frame(cranf_p1),
   new_slot(cranf_p1,isa,assembly_component),
   new_value(cranf_p1,in_product,cranfield_benchmark),
   new_value(cranf_p1,part,lock_pin),
   new_value(cranf_p1,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_p1,mate_pos,[25,405,-105,0]),
   new_value(cranf_p1,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_p1,contacts,[ cranf_peg1,cranf_sp1 ]),
   new_values(cranf_p1,previous_mates,[ cranf_peg1 ]).

:- new_frame(cranf_p2),
   new_slot(cranf_p2,isa,assembly_component),
   new_value(cranf_p2,in_product,cranfield_benchmark),
   new_value(cranf_p2,part,lock_pin),
   new_value(cranf_p2,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_p2,mate_pos,[25,405,-105,0]),
   new_value(cranf_p2,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_p2,contacts,[ cranf_peg2,cranf_sp1 ]),
   new_values(cranf_p2,previous_mates,[ cranf_peg2 ]).

:- new_frame(cranf_p3),
   new_slot(cranf_p3,isa,assembly_component),
   new_value(cranf_p3,in_product,cranfield_benchmark),
   new_value(cranf_p3,part,lock_pin),
   new_value(cranf_p3,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_p3,mate_pos,[25,405,-105,0]),
   new_value(cranf_p3,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_p3,contacts,[ cranf_peg1,cranf_sp2 ]),
   new_values(cranf_p3,previous_mates,[ cranf_sp2 ]).

:- new_frame(cranf_p4),
   new_slot(cranf_p4,isa,assembly_component),
   new_value(cranf_p4,in_product,cranfield_benchmark),
   new_value(cranf_p4,part,lock_pin),
   new_value(cranf_p4,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_p4,mate_pos,[25,405,-105,0]),
   new_value(cranf_p4,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_p4,contacts,[ cranf_peg2,cranf_sp2 ]),
   new_values(cranf_p4,previous_mates,[ cranf_sp2 ]).

:- new_frame(cranf_p5),
   new_slot(cranf_p5,isa,assembly_component),
   new_value(cranf_p5,in_product,cranfield_benchmark),
   new_value(cranf_p5,part,lock_pin),
   new_value(cranf_p5,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_p5,mate_pos,[25,405,-105,0]),
   new_value(cranf_p5,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_p5,contacts,[ cranf_peg3,cranf_sp2 ]),
   new_values(cranf_p5,previous_mates,[ cranf_sp2 ]).

:- new_frame(cranf_p6),
   new_slot(cranf_p6,isa,assembly_component),
   new_value(cranf_p6,in_product,cranfield_benchmark),
   new_value(cranf_p6,part,lock_pin),
   new_value(cranf_p6,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_p6,mate_pos,[25,405,-105,0]),
   new_value(cranf_p6,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_p6,contacts,[ cranf_peg4,cranf_sp2 ]),
   new_values(cranf_p6,previous_mates,[ cranf_sp2 ]).

:- new_frame(cranf_p7),
   new_slot(cranf_p7,isa,assembly_component),
   new_value(cranf_p7,in_product,cranfield_benchmark),
   new_value(cranf_p7,part,lock_pin),
   new_value(cranf_p7,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_p7,mate_pos,[25,405,-105,0]),
   new_value(cranf_p7,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_p7,contacts,[ cranf_peg3,cranf_sp1 ]),
   new_values(cranf_p7,previous_mates,[ cranf_peg3 ]).

:- new_frame(cranf_p8),
   new_slot(cranf_p8,isa,assembly_component),
   new_value(cranf_p8,in_product,cranfield_benchmark),
   new_value(cranf_p8,part,lock_pin),
   new_value(cranf_p8,mate_appr_pos,[25,405,0,0]),
   new_value(cranf_p8,mate_pos,[25,405,-105,0]),
   new_value(cranf_p8,mate_depart_pos,[25,405,0,0]),
   new_value(cranf_p8,contacts,[ cranf_peg4,cranf_sp1 ]),
   new_values(cranf_p8,previous_mates,[ cranf_peg4 ]).

