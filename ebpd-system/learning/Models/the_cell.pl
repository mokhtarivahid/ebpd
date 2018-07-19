% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%
%
%      The Cell (according to definitions in concepts.pro)
%      (C) Luis Seabra Lopes, FCT/UNL, Monte da Caparica
%          03.01.1993 & 23.03.1994. Revised on 06.01.1996.
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


%%
%%  Physical Assembly Entities:

%%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %% 
%%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %% 

:- new_frame(b_learn_cell),
   new_slot(b_learn_cell,isa,assembly_cell),
   new_value(b_learn_cell,entity_made_by,'GRI/UNL').

:- new_frame(sony_scara), 
   new_slot(sony_scara,isa,robot),
   new_value(sony_scara,entity_made_by,'SONY'),
   new_value(sony_scara,entity_name,'SRX-4CH'),
   new_value(sony_scara,robot_type,'SCARA'),
   new_value(sony_scara,degrees_of_freedom,4),
   new_value(sony_scara,resource_cell,b_learn_cell).
       
:- new_frame(gp_1),
   new_slot(gp_1,isa,gripper),
   new_value(gp_1,entity_made_by,'SHUNCK'),
   new_value(gp_1,entity_name,'RH-801'),
   new_value(gp_1,tcp_location,[0,0,-80,0]),
   new_value(gp_1,resource_cell,b_learn_cell).

:- new_frame(gp_2),
   new_slot(gp_2,isa,gripper),
   new_value(gp_2,entity_made_by,'SHUNCK'),
   new_value(gp_2,entity_name,'RH-905'),
   new_value(gp_2,tcp_location,[0,0,-70,0]),
   new_value(gp_2,resource_cell,b_learn_cell).

:- new_frame(gp_3),
   new_slot(gp_3,isa,gripper),
   new_value(gp_3,entity_made_by,'SHUNCK'),
   new_value(gp_3,entity_name,'RH-918'),
   new_value(gp_3,tcp_location,[0,0,-60,0]),
   new_value(gp_3,resource_cell,b_learn_cell).

:- new_frame(cranfield_base),
   new_slot(cranfield_base,isa,jig),
   new_value(cranfield_base,resource_cell,b_learn_cell).

:- new_frame(fix_1),
   new_slot(fix_1,isa,assembly_fixture),
   new_value(fix_1,entity_made_by,'HIDROMAC'),
   new_value(fix_1,resource_cell,b_learn_cell).

:- new_frame(feeder_sp),
   new_slot(feeder_sp,isa,feeder),
   new_value(feeder_sp,entity_made_by,'HIDROMAC'),
   new_value(feeder_sp,resource_cell,b_learn_cell).

:- new_frame(feeder_cb),
   new_slot(feeder_cb,isa,feeder),
   new_value(feeder_cb,entity_made_by,'HIDROMAC'),
   new_value(feeder_cb,resource_cell,b_learn_cell).

:- new_frame(pal_sys),
   new_slot(pal_sys,isa,pallet_system),
   new_value(pal_sys,entity_made_by,virtual_reality).

:- new_frame(pal_1),
   new_slot(pal_1,isa,pallet),
   new_value(pal_1,entity_made_by,virtual_reality),
   new_value(pal_1,in_pallet_system,pal_sys).

:- new_frame(pal_2),
   new_slot(pal_2,isa,pallet),
   new_value(pal_2,entity_made_by,virtual_reality),
   new_value(pal_2,in_pallet_system,pal_sys).

:- new_frame(magazine_1),
   new_slot(magazine_1,isa,magazine),
   new_value(magazine_1,entity_made_by,'SHUNCK').

:- new_frame(toolp_1),
   new_slot(toolp_1,isa,toolplace),
   new_value(toolp_1,entity_made_by,'SHUNCK'),
   new_value(toolp_1,in_magazine,magazine_1),
   new_value(toolp_1,tp_approach,[-210,-10,-5,0]),
   new_value(toolp_1,tp_tool_loc,[-210,-20,-5,0]),
   new_value(toolp_1,tp_depart,[-210,-10,-5,0]).

:- new_frame(toolp_2),
   new_slot(toolp_2,isa,toolplace),
   new_value(toolp_2,entity_made_by,'SHUNCK'),
   new_value(toolp_2,in_magazine,magazine_1),
   new_value(toolp_2,tp_approach,[-220,-10,-5,0]),
   new_value(toolp_2,tp_tool_loc,[-220,-20,-5,0]),
   new_value(toolp_2,tp_depart,[-220,-10,-5,0]).

:- new_frame(toolp_3),
   new_slot(toolp_3,isa,toolplace),
   new_value(toolp_3,entity_made_by,'SHUNCK'),
   new_value(toolp_3,in_magazine,magazine_1),
   new_value(toolp_3,tp_approach,[-230,-10,-5,0]),
   new_value(toolp_3,tp_tool_loc,[-230,-20,-5,0]),
   new_value(toolp_3,tp_depart,[-230,-10,-5,0]).



