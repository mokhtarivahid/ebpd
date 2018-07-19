%
%
%           Taxonomy of Assembly Entities -- Operators
%
%           (C) L. Seabra Lopes, FCT/UNL, Monte da Caparica, December 1992
%               New version: January, 1996
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%% Assembly Operators:

:- new_frame(assembly_operator),
   new_slot(assembly_operator,isa,logical_entity).

:- new_frame(resource_operator),
   new_slot(resource_operator,isa,assembly_operator),
   new_slot(resource_operator,op_cost),
   new_slot(resource_operator,performed_by),
   new_slot(resource_operator,op_implementation).

:- new_frame(tasklevel_operator),
   new_slot(tasklevel_operator,isa,assembly_operator),
   new_slot(tasklevel_operator,op_functionality),
   new_slot(tasklevel_operator,op_cost),
   new_slot(tasklevel_operator,get_op_expansion),
   new_slot(tasklevel_operator,nicknames).

:- new_frame(macro_operator),
   new_slot(macro_operator,isa,assembly_operator).

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%       Specification of functionalities of operators for planning
%       (C) Luis Seabra Lopes, UNL, Caparica, November 1994
%       New version: September 1995
%       New version: January 1996
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%              o  Operator Definition:
%                       <Operator Template>,
%                       <Needed Information>
%                       <Keep Pre-Conditions>,
%                       <Delete Pre-Conditions>,
%                       <Add-Conditions>
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%

:- new_frame(feed_pallet),
   new_slot(feed_pallet,isa,tasklevel_operator),
   new_value(feed_pallet,op_functionality,
     [
       feed_pallet(Pal,PalSys),

       [ %Info:
         ],
       [ %Keep:
         pallet_in_system(Pal,PalSys),
         not(pallet_system_breakdown(PalSys)) ],
       [ %Delete:
         no_pallet_available(PalSys) ],
       [ %Add:
         pallet_available(Pal,PalSys) ] ]),
   new_value(feed_pallet,get_op_expansion,get_fdpl_expansion_mth),
   new_value(feed_pallet,nicknames,[feedpal,fdp]),
   new_value(feed_pallet,op_cost,1).

%

:- new_frame(putaway_pallet),
   new_slot(putaway_pallet,isa,tasklevel_operator),
   new_value(putaway_pallet,op_functionality,
     [
       putaway_pallet(Pal,PalSys),
       [ %Info:
         ],
       [ %Keep:
         pallet_in_system(Pal,PalSys),
         not(pallet_system_breakdown(PalSys)) ],
       [ %Delete:
         pallet_available(Pal,PalSys) ],
       [ %Add:
         no_pallet_available(PalSys) ] ]),
   new_value(putaway_pallet,get_op_expansion,get_awpl_expansion_mth),
   new_value(putaway_pallet,nicknames,[awaypal,awp]),
   new_value(putaway_pallet,op_cost,1).

%

:- new_frame(get_tool),
   new_slot(get_tool,isa,tasklevel_operator),
   new_value(get_tool,op_functionality,
     [
       get_tool(R,T,TP),
       [ %Info:
         magazine_toolplace(TP,_,_,_) ],
       [ %Keep:
         not(robot_arm_breakdown(R)) ],
       [ %Delete:
         no_tool_attached(R),
         tool_in_magazine(T,TP) ],
       [ %Add:
         toolplace_empty(TP),
         current_tool(R,T) ] ]),
   new_value(get_tool,get_op_expansion,get_gtool_expansion_mth),
   new_value(get_tool,nicknames,[get,g]),
   new_value(get_tool,op_cost,1).

%

:- new_frame(store_tool),
   new_slot(store_tool,isa,tasklevel_operator),
   new_value(store_tool,op_functionality,
     [
       store_tool(R,T,TP),
       [ %Info:
         magazine_toolplace(TP,_,_,_) ],
       [ %Keep:
         not(robot_arm_breakdown(R)),
         robot_free(R) ],
       [ %Delete:
         current_tool(R,T),
         toolplace_empty(TP) ],
       [ %Add:
         no_tool_attached(R),
         tool_in_magazine(T,TP) ] ]),
   new_value(store_tool,get_op_expansion,get_stool_expansion_mth),
   new_value(store_tool,nicknames,[store,s]),
   new_value(store_tool,op_cost,1).

%

:- new_frame(pick_part_from_pallet),
   new_slot(pick_part_from_pallet,isa,tasklevel_operator),
   new_value(pick_part_from_pallet,op_functionality,
     [
       pick_part_from_pallet(R,T,Obj,Part,Pal,PalSys),
       [ %Info:
         object_type(Obj,Part),
         part_tool(Part,T) ],
       [ %Keep:
         not(robot_arm_breakdown(R)),
         not(tool_breakdown(T)),
         pallet_available(Pal,PalSys),
         current_tool(R,T) ],
       [ %Delete:
         part_in_pallet(Obj,Pal),
         robot_free(R) ],
       [ %Add:
         object_in_robot(Obj,R) ] ]),
   new_value(pick_part_from_pallet,get_op_expansion,get_pickpl_expansion_mth),
   new_value(pick_part_from_pallet,nicknames,[pickpl,ppl]),
   new_value(pick_part_from_pallet,op_cost,1).

%

:- new_frame(place_part_in_pallet),
   new_slot(place_part_in_pallet,isa,tasklevel_operator),
   new_value(place_part_in_pallet,op_functionality,
     [
       place_part_in_pallet(R,T,Obj,Part,Pal,PalSys),
       [ %Info:
         object_type(Obj,Part),
         part_tool(Part,T) ],
       [ %Keep:
         not(robot_arm_breakdown(R)),
         not(tool_breakdown(T)),
         not(defective(Obj)),
         pallet_available(Pal,PalSys),
         current_tool(R,T) ],
       [ %Delete:
         object_in_robot(Obj,R) ],
       [ %Add:
         part_in_pallet(Obj,Pal),
         robot_free(R) ] ]),
   new_value(place_part_in_pallet,get_op_expansion,get_placepl_expansion_mth),
   new_value(place_part_in_pallet,nicknames,[place,plc]),
   new_value(place_part_in_pallet,op_cost,1).

%

:- new_frame(pick_part_from_feeder),
   new_slot(pick_part_from_feeder,isa,tasklevel_operator),
   new_value(pick_part_from_feeder,op_functionality,
     [
       pick_part_from_feeder(R,T,Obj,Part,Fd),
       [ %Info:
         object_type(Obj,Part),
         part_tool(Part,T) ],
       [ %Keep:
         not(robot_arm_breakdown(R)),
         not(tool_breakdown(T)),
         not(defective(Obj)),
         current_tool(R,T) ],
       [ %Delete:
         part_available_in_feeder(Obj,Fd),
         robot_free(R) ],
       [ %Add:
         no_part_available_in_feeder(Fd),
         object_in_robot(Obj,R) ] ]),
   new_value(pick_part_from_feeder,get_op_expansion,get_pickfd_expansion_mth),
   new_value(pick_part_from_feeder,nicknames,[pickfd,pfd]),
   new_value(pick_part_from_feeder,op_cost,1).

%

:- new_frame(putdown_object),
   new_slot(putdown_object,isa,tasklevel_operator),
   new_value(putdown_object,op_functionality,
     [
       putdown_object(R,T,Obj),
       [ %Info:
         ],
       [ %Keep:
         not(robot_arm_breakdown(R)),
         not(tool_breakdown(T)),
         current_tool(R,T) ],
       [ %Delete:
         object_in_robot(Obj,R) ],
       [ %Add:
         object_on_table(Obj),
         robot_free(R) ] ]),
   new_value(putdown_object,get_op_expansion,get_down_expansion_mth),
   new_value(putdown_object,nicknames,[down,dw]),
   new_value(putdown_object,op_cost,1).

%

:- new_frame(pickup_object),
   new_slot(pickup_object,isa,tasklevel_operator),
   new_value(pickup_object,op_functionality,
     [
       pickup_object(R,T,Obj),
       [ %Info:
         object_tool(Obj,T) ],
       [ %Keep:
         not(robot_arm_breakdown(R)),
         not(tool_breakdown(T)),
         current_tool(R,T) ],
       [ %Delete:
         object_on_table(Obj),
         robot_free(R) ],
       [ %Add:
         object_in_robot(Obj,R) ] ]),
   new_value(pickup_object,get_op_expansion,get_pickup_expansion_mth),
   new_value(pickup_object,nicknames,[pickup,pup]),
   new_value(pickup_object,op_cost,1).

%

:- new_frame(pickup_part),
   new_slot(pickup_part,isa,tasklevel_operator),
   new_value(pickup_part,op_functionality,
     [
       pickup_part(R,T,Obj,Part),
       [ %Info:
         object_type(Obj,Part),
         part_tool(Part,T) ],
       [ %Keep:
         not(robot_arm_breakdown(R)),
         not(tool_breakdown(T)),
         current_tool(R,T) ],
       [ %Delete:
         object_on_table(Obj),
         robot_free(R) ],
       [ %Add:
         object_in_robot(Obj,R) ] ]),
   new_value(pickup_part,get_op_expansion,get_pickprt_expansion_mth),
   new_value(pickup_part,nicknames,[pickprt,pp]),
   new_value(pickup_part,op_cost,1).

%

:- new_frame(set_fixture_for_product),
   new_slot(set_fixture_for_product,isa,tasklevel_operator),
   new_value(set_fixture_for_product,op_functionality,
     [
       set_fixture_for_product(Fix,Prod),
       [ %Info:
         product_fixture(Prod,Fix) ],
       [ %Keep:
         not(fixture_breakdown(Fix)) ],
       [ %Delete:
         fixture_available(Fix) ],
       [ %Add:
         fixture_with_product(Fix,Prod) ] ]),
   new_value(set_fixture_for_product,get_op_expansion,get_setfix_expansion_mth),
   new_value(set_fixture_for_product,nicknames,[setfix,sfx]),
   new_value(set_fixture_for_product,op_cost,1).

%

:- new_frame(assemble_component),
   new_slot(assemble_component,isa,tasklevel_operator),
   new_value(assemble_component,op_functionality,
     [
       assemble_component(R,T,Obj,Comp,Part,Prod,Fix),
       [ %Info:
         object_type(Obj,Part),
         part_tool(Part,T),
         component_contacts(Comp,LCont),
         part_mate(Prod,Comp,Part,_,_,_,LPrevM,_) ],
       [ %Keep:
         current_tool(R,T),
         fixture_with_product(Fix,Prod),
         not(robot_arm_breakdown(R)),
         not(tool_breakdown(T)),
         not(defective(Obj)),
         not(component_assembled(Comp,Prod,Fix)),
         all(M,LPrevM,[ component_assembled(M,Prod,Fix)]),
         all(C,LCont,([ component_assembled(C,Prod,Fix), represented_by(C,X) ]
                        -> not(defective(X)) ))
         ],
       [ %Delete:
         object_in_robot(Obj,R) ],
       [ %Add:
         component_assembled(Comp,Prod,Fix),
         represented_by(Comp,Obj),
         robot_free(R) ] ]),
   new_value(assemble_component,get_op_expansion,get_assemb_expansion_mth),
   new_value(assemble_component,nicknames,[assemble,asb]),
   new_value(assemble_component,op_cost,1).

%

:- new_frame(disassemble_component),
   new_slot(disassemble_component,isa,tasklevel_operator),
   new_value(disassemble_component,op_functionality,
     [
       disassemble_component(R,T,Obj,Comp,Part,Prod,Fix),
       [ %Info:
         object_type(Obj,Part),
         part_tool(Part,T),
         part_mate(Prod,Comp,Part,_,_,_,_,LNextM) ],
       [ %Keep:
         not(robot_arm_breakdown(R)),
         not(tool_breakdown(T)),
         fixture_with_product(Fix,Prod),
         all(X,LNextM,[ not(component_assembled(X,Prod,Fix)) ]),
         current_tool(R,T) ],
       [ %Delete:
         component_assembled(Comp,Prod,Fix),
         represented_by(Comp,Obj),
         robot_free(R) ],
       [ %Add:
         object_in_robot(Obj,R) ] ]),
   new_value(disassemble_component,get_op_expansion,get_dassemb_expansion_mth),
   new_value(disassemble_component,nicknames,[disassemble,da]),
   new_value(disassemble_component,op_cost,1).


%

:- new_frame(feed_part),
   new_slot(feed_part,isa,tasklevel_operator),
   %new_demon(feed_part,op_functionality,
   %  fdpt_functionality_dem,if_read,after,alter_value),
   new_value(feed_part,get_op_expansion,get_fdpt_expansion_mth),
   new_value(feed_part,nicknames,[feedpt,fdpt]),
   new_value(feed_part,op_cost,1).

%fdpt_functionality_dem(Feed_part,_,_,FUNC)
%:- ( clause(in_generalization_context,true); generate_atom('obj_#',Obj) ),
%   FUNC = [
%       feed_part(Fd,Obj,Part),
%       [ %Info:
%         part_feeder(Part,Fd,_,_,_) ],
%       [ %Keep:
%         not(feeder_jammed(Fd)),
%         not(defective(Obj)),
%         not(feeder_stock_empty(Fd)) ],
%       [ %Delete:
%         no_part_available_in_feeder(Fd) ],
%       [ %Add:
%         object_type(Obj,Part),
%         part_available_in_feeder(Obj,Fd) ] ].

%


%% Assembly domain operators (commented out for RACE):
%% 
% operator_functionality( 
%     feed_part(Fd,Obj,Part), 
%     [ %Info: 
%       part_feeder(Part,Fd,_,_,_) ], 
%     [ %Keep: 
%       not(feeder_jammed(Fd)), 
%       not(defective(Obj)), 
%       not(feeder_stock_empty(Fd)) ],
%     [ %Delete: 
%       no_part_available_in_feeder(Fd) ],
%     [ %Add: 
%       object_type(Obj,Part), 
%       part_available_in_feeder(Obj,Fd) ] 
% ):- ( clause(in_generalization_context,true), !;
%       generate_atom('obj_#',Obj)
%     ).
% 
% operator_functionality(Op,Info,Keep,Add,Del)
% :- clause(tasklevel_operator(value_,subtypes,Operator),true),
%    Operator \== feed_part,
%    get_value(Operator,op_functionality,[Op,Info,Keep,Add,Del]).



