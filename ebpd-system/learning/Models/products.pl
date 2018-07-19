%
%
%           Taxonomy of Assembly Entities -- Products
%
%           (C) L. Seabra Lopes, FCT/UNL, Monte da Caparica
%               December 1992 [last updated January 3, 1996]
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


:- new_frame(artifact),
   new_slot(artifact,isa,physical_entity),
   new_slot(artifact,description),
   new_slot(artifact,make_or_buy),
   new_slot(artifact,artifact_status).

:- new_frame(assembled_product),
   new_slot(assembled_product,isa,artifact),
   new_slot(assembled_product,prod_fixture).
   % artifact_status --> not_assembled, being_assembled, assembled
   % components --> inverse of assembly_component.in_product

:- new_frame(assembly_part),
   new_slot(assembly_part,isa,artifact),
   new_slot(assembly_part,part_tool),
   new_slot(assembly_part,geometrical_model),
   % artifact_status --> in_source, on_table, 
   %              in_robot, assembled,in_bad_position
   new_slot(assembly_part,part_quality),     % good, defective
   new_slot(assembly_part,part_source_type), % pallet, feeder
   new_slot(assembly_part,part_source),
   new_slot(assembly_part,location_in_source),
   new_slot(assembly_part,approach_source),
   new_slot(assembly_part,depart_source).

:- new_frame(unknown_object),
   new_slot(unknown_object,isa,artifact),
   new_slot(unknown_object,object_size),
   new_slot(unknown_object,object_weight).
   % artifact_status --> on_table, in_robot, in_bad_position

:- new_frame(assembly_component),
   new_slot(assembly_component,isa,logical_entity),
   new_slot(assembly_component,part),
   new_slot(assembly_component,in_product),
   new_slot(assembly_component,mate_appr_pos),
   new_slot(assembly_component,mate_pos),
   new_slot(assembly_component,mate_depart_pos),
   new_slot(assembly_component,mate_tool),
   new_slot(assembly_component,mate_type),
   new_slot(assembly_component,contacts),
   new_slot(assembly_component,comp_status),  % assembled, not_assembled
   new_slot(assembly_component,represented_by),
   new_slot(assembly_component,previous_mates).



