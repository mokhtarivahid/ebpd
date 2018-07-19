%
%
%           Taxonomy of Assembly Entities -- Specification of Relations
%
%           (C) L. Seabra Lopes, FCT/UNL, Monte da Caparica
%               December 1992 [last updated January 3, 1996]
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


%% Some Relations:
%% %% %% %% %% %% %% %%

:- new_relation(cell_resources,intransitive,none,resource_cell), 
   new_relation(resource_cell,intransitive,none,cell_resources).

:- new_relation(prod_model,transitive,all,product_modelled), 
   new_relation(product_modelled,intransitive,none,prod_model).

:- new_relation(operators,intransitive,
       inclusion([isa,op_execute]),performed_by), 
   new_relation(performed_by,intransitive,none,operators).

:- new_relation(sensors,intransitive,none,in_resource), 
   new_relation(in_resource,intransitive,none,sensors).

:- new_relation(in_tool_place,intransitive,none,for_tool),
   new_relation(for_tool,intransitive,none,in_tool_place).

:- new_relation(places,intransitive,none,in_magazine),
   new_relation(in_magazine,intransitive,none,places).

:- new_relation(operator,transitive,
                inclusion([performed_by,op_method,isa]),nil).

:- new_relation(next_operation,intransitive,none,previous_operation),
   new_relation(previous_operation,intransitive,none,next_operation).

:- new_relation(next_level,intransitive,none,previous_level),
   new_relation(previous_level,intransitive,none,next_level).

:- new_relation(part_source,intransitive,none,feeder_part),
   new_relation(feeder_part,intransitive,none,part_source).

:- new_relation(in_product,intransitive,none,components),
   new_relation(components,intransitive,none,in_product).

:- new_relation(component,intransitive,
                 inclusion([ prod_appr_pos, product_location,
                             prod_grasp_pos,prod_depart_pos]), nil).
:- new_relation(next_mates,intransitive,none,previous_mates),
   new_relation(previous_mates,intransitive,none,next_mates).

:- new_relation(current_tool,intransitive,
                 inclusion([ tcp_location,tool_place,tool_status,
                             current_part,stroke_per_finger]), in_robot),
   new_relation(in_robot,intransitive,none,current_tool).

:- new_relation(in_plan,intransitive,none,plan_operations), 
   new_relation(plan_operations,intransitive,none,in_plan).

:- new_relation(in_operation,intransitive,none,traces),
   new_relation(traces,intransitive,none,in_operation).

:- new_relation(in_pallet_system,intransitive,none,pallets),
   new_relation(pallets,intransitive,none,in_pallet_system).

:- new_relation(current_part,intransitive,none,nil).

