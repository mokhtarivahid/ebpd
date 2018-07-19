%
%
%           Taxonomy of Assembly Entities -- Assembly Resources
%
%           (C) L. Seabra Lopes, FCT/UNL, Monte da Caparica
%               December 1992 [last updated January 3, 1996]
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%%
%%  Assembly Entity Concept:
%%

%:- new_frame(assembly_entity).

%%
%%  Physical Assembly Entities:

%%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %% 
%%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %% 


       
:- new_frame(physical_entity),
   new_slot(physical_entity,isa,assembly_entity),
   new_slot(physical_entity,entity_name),
   new_slot(physical_entity,entity_made_by),
   new_slot(physical_entity,entity_dimensions),
   new_slot(physical_entity,entity_loc_in_world).

%%  Assembly Cells:

:- new_frame(assembly_cell),
   new_slot(assembly_cell,isa,physical_entity).

%%  Assembly Resources:

:- new_frame(assembly_resource),
   new_slot(assembly_resource,isa,physical_entity),
   new_slot(assembly_resource,resource_cell),
   new_slot(assembly_resource,resource_location).

%%  Assembly Operational Resources:

:- new_frame(operational_resource),
   new_slot(operational_resource,isa,assembly_resource),
   new_slot(operational_resource,operators),
   new_slot(operational_resource,operation_status),
   new_slot(operational_resource,failure_status),
   new_slot(operational_resource,sensors),
   new_slot(operational_resource,resource_control).

:- new_frame(robot),
   new_slot(robot,isa,operational_resource),
   new_slot(robot,robot_type),
   new_slot(robot,degrees_of_freedom),
   new_slot(robot,workspace_dimensions),
   new_slot(robot,velocity),
   new_slot(robot,current_hand),
   new_slot(robot,current_arm_pos),
   new_slot(robot,current_tool).
   % failure_status --> operational, arm_breakdown
   % operation_status --> tool_attached, no_tool_attached

:- new_frame(robot_tool),
   new_slot(robot_tool,isa,operational_resource),
   new_slot(robot_tool,tcp_location),
   new_slot(robot_tool,tool_status),
   new_slot(robot_tool,in_tool_place),
   new_slot(robot_tool,in_robot),
   new_slot(robot_tool,current_part).
   % failure_status --> operational, tool_breakdown
   % operation_status --> stored, free, handling

:- new_frame(gripper),
   new_slot(gripper,isa,robot_tool),
   new_slot(gripper,stroke_per_finger).

:- new_frame(screw_driver),
   new_slot(screw_driver,isa,robot_tool).

:- new_frame(materials_handling_resource),
   new_slot(materials_handling_resource,isa,operational_resource).

:- new_frame(jig),
   new_slot(jig,isa,materials_handling_resource).

:- new_frame(assembly_fixture),
   new_slot(assembly_fixture,isa,materials_handling_resource),
   new_slot(assembly_fixture,current_force).
   % failure_status --> operational, fixture_breakdown
   % operation_status --> available, with_product

:- new_frame(feeder),
   new_slot(feeder,isa,materials_handling_resource),
   % failure_status --> operational, stock_empty, jammed
   % operation_status --> part_available, no_part_available
   new_slot(feeder,fd_approach),
   new_slot(feeder,fd_part_location),
   new_slot(feeder,fd_depart).

:- new_frame(pallet_system),
   new_slot(pallet_system,isa,materials_handling_resource),
   new_slot(pallet_system,current_pallet).
   % failure_status --> operational, breakdown
   % operation_status --> pallet_available, no_pallet_available

:- new_frame(pallet),
   new_slot(pallet,isa,materials_handling_resource),
   new_slot(pallet,in_pallet_system).
   % failure_status --> operational, jammed
   % operation_status --> available, not_available

:- new_frame(buffer),
   new_slot(buffer,isa,materials_handling_resource),
   new_slot(buffer,buffer_size).

:- new_frame(remover),
   new_slot(remover,isa,materials_handling_resource).

:- new_frame(resource_storage),
   new_slot(resource_storage,isa,operational_resource),
   new_slot(resource_storage,storage_capacity).

:- new_frame(sensor_holder),
   new_slot(sensor_holder,isa,resource_storage).

:- new_frame(jigs_storage),
   new_slot(jigs_storage,isa,resource_storage).

:- new_frame(magazine),
   new_slot(magazine,isa,resource_storage),
   new_slot(magazine,places).

:- new_frame(toolplace),
   new_slot(toolplace,isa,resource_storage),
   new_slot(toolplace,in_magazine),
   new_slot(toolplace,for_tool),
   new_slot(toolplace,tp_approach),
   new_slot(toolplace,tp_tool_loc),
   new_slot(toolplace,tp_depart).
   % failure_status --> operational, toolplace_breakdown
   % operation_status --> empty, with_tool

%%  Assembly Sensors:

:- new_frame(sensorial_resource),
   new_slot(sensorial_resource,isa,assembly_resource),
   new_slot(sensorial_resource,in_resource).

%%
%%  Logical Assembly Entities:

%%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%
%%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%  %%

:- new_frame(logical_entity),
   new_slot(logical_entity,isa,assembly_entity).

