% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%
%      cranfield_mth.pro -- Predicates related to the Cranfield
%        benchmark and to the necessary initialization of the cell
%      (C) Luis Seabra Lopes, FCT/UNL, Monte da Caparica, 5.02.1996
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% 
% Initialize the Cell:
%

set_pi  % extract planning info
:- ini_cell_model,
   generate_initial_state.

ini_cell_model
:- initialize_the_cell,
   initialize_cranfield_assembly_parts,
   initialize_cranfield_components.
   

initialize_the_cell
:- new_value(pal_1,failure_status,operational),
   new_value(pal_1,operation_status,not_available),
   new_value(pal_2,failure_status,operational),
   new_value(pal_2,operation_status,not_available),
   new_value(pal_sys,failure_status,operational),
   new_value(pal_sys,operation_status,no_pallet_available),
   new_value(feeder_sp,failure_status,operational),
   new_value(feeder_sp,operation_status,no_part_available),
   new_value(feeder_cb,failure_status,operational),
   new_value(feeder_cb,operation_status,no_part_available),
   new_value(toolp_1,failure_status,operational),
   new_value(toolp_1,operation_status,with_tool),
   new_value(toolp_2,failure_status,operational),
   new_value(toolp_2,operation_status,with_tool),
   new_value(toolp_3,failure_status,operational),
   new_value(toolp_3,operation_status,with_tool),
   new_value(gp_1,failure_status,operational),
   new_value(gp_1,operation_status,stored),
   new_value(gp_1,in_tool_place,toolp_1),
   new_value(gp_2,failure_status,operational),
   new_value(gp_2,operation_status,stored),
   new_value(gp_2,in_tool_place,toolp_2),
   new_value(gp_3,failure_status,operational),
   new_value(gp_3,operation_status,stored),
   new_value(gp_3,in_tool_place,toolp_3),
   new_value(sony_scara,failure_status,operational),
   new_value(sony_scara,operation_status,no_tool_attached),
   new_value(fix_1,failure_status,operational),
   new_value(fix_1,operation_status,available).


%
%  Initialize Cranfield Assembly Parts:
%

initialize_cranfield_assembly_parts
:- new_value(sft_o1,artifact_status,in_source),
   new_value(sft_o2,artifact_status,in_source), % added 2005
   new_value(lv_o1,artifact_status,in_source),
   new_value(peg_o1,artifact_status,in_source),
   new_value(peg_o2,artifact_status,in_source),
   new_value(peg_o3,artifact_status,in_source),
   new_value(peg_o4,artifact_status,in_source),
   new_value(peg_o5,artifact_status,in_source),
   new_value(p_o1,artifact_status,in_source),
   new_value(p_o2,artifact_status,in_source),
   new_value(p_o3,artifact_status,in_source),
   new_value(p_o4,artifact_status,in_source),
   new_value(p_o5,artifact_status,in_source),
   new_value(p_o6,artifact_status,in_source),
   new_value(p_o7,artifact_status,in_source),
   new_value(p_o8,artifact_status,in_source),
   new_value(p_o9,artifact_status,in_source),
   new_value(sft_o1,part_quality,good),
   new_value(sft_o2,part_quality,good),  % added 2005
   new_value(lv_o1,part_quality,good),
   new_value(peg_o1,part_quality,good),
   new_value(peg_o2,part_quality,good),
   new_value(peg_o3,part_quality,good),
   new_value(peg_o4,part_quality,good),
   new_value(peg_o5,part_quality,good),
   new_value(p_o1,part_quality,good),
   new_value(p_o2,part_quality,good),
   new_value(p_o3,part_quality,good),
   new_value(p_o4,part_quality,good),
   new_value(p_o5,part_quality,good),
   new_value(p_o6,part_quality,good),
   new_value(p_o7,part_quality,good),
   new_value(p_o8,part_quality,good),
   new_value(p_o9,part_quality,good).


%
%  Initialize Cranfield Components:
%

initialize_cranfield_components
:- get_values(cranfield_benchmark,components,LComp),
   declare_components_not_assembled(LComp).

declare_components_not_assembled([])
:- !.

declare_components_not_assembled([C|LC])
:- new_value(C,comp_status,not_assembled),
   declare_components_not_assembled(LC).



%
%  Extract System Status and Information:
%


del_pi
:- retractall(planning_info(_)).

generate_initial_state
:- extract_system_status(cranfield_benchmark,Status),
   assert(initial_state(Status)).

extract_system_status(Prod,Status)
:- get_value(Prod,prod_fixture,Fix),
   assert(planning_info(product_fixture(Prod,Fix))),
   extract_all_parts_status(          []  , PtS ),
   extract_all_components_status(Prod,PtS , CpS ),
   extract_all_unknown_objects_status(CpS , UObS),
   extract_feeder_status(feeder_sp,   UObS, FspS),
   extract_feeder_status(feeder_cb,   FspS, FcbS),
   extract_toolplace_status(toolp_1,  FcbS, TP1S),
   extract_toolplace_status(toolp_2,  TP1S, TP2S),
   extract_toolplace_status(toolp_3,  TP2S, TP3S),
   extract_gripper_status(gp_1,       TP3S, Gp1S),
   extract_gripper_status(gp_2,       Gp1S, Gp2S),
   extract_gripper_status(gp_3,       Gp2S, Gp3S),
   extract_robot_status(sony_scara,   Gp3S, RbS ),
   extract_fixture_status(fix_1,      RbS , FxS ),
   extract_pallet_status(pal_1,       FxS , Pl1S),
   extract_pallet_status(pal_2,       Pl1S, Pl2S),
   extract_pal_sys_status(pal_sys,    Pl2S, Status).

%
   
extract_all_parts_status(In,Out)
:- get_values(assembly_part,subtypes,PartTypes),
   declare_part_tools(PartTypes),
   obtain_part_instances(PartTypes,Parts),
   extract_all_parts_status(Parts,In,Out).

obtain_part_instances([],[])
:- !.

obtain_part_instances([PT|LPT],Parts)
:- ( get_values(PT,subtypes,LP1); LP1 = [] ),
   obtain_part_instances(LPT,LP2),
   append_no_bt(LP1,LP2,Parts),!.

declare_part_tools([])
:- !.

declare_part_tools([PT|PartTypes])
:- get_value(PT,part_tool,Tool),
   assert(planning_info(part_tool(PT,Tool))),
   declare_part_tools(PartTypes),!.


extract_all_parts_status([],In,In)
:- !.

extract_all_parts_status([Part|Parts],In,Out)
:- get_value(Part,artifact_status,Status),
   get_value(Part,part_source_type,SourceType),
   get_value(Part,part_source,Source),
   ( SourceType == pallet,
     get_value(Part,approach_source,App),
     get_value(Part,location_in_source,Loc),
     get_value(Part,depart_source,Dep),
     assert(planning_info(location_in_pallet(Part,Source,App,Loc,Dep)));
     true
   ),
   consider_part_status(Part,Status,SourceType,Source,In,Aux1),
   get_value(Part,part_quality,Quality),
   ( Quality == defective, Aux2 = [defective(Part)|Aux1]; Aux2 = Aux1 ),
   get_value(Part,isa,ObjType),
   assert(planning_info(object_type(Part,ObjType))),
   extract_all_parts_status(Parts,Aux2,Out),!.

consider_part_status(Part,in_source,SourceType,Source,In,[F|In])
:- ( SourceType == feeder, F = part_available_in_feeder(Part,Source);
     SourceType == pallet, F = part_in_pallet(Part,Source)
   ),!.

consider_part_status(Part,on_table,_,_,In,[object_on_table(Part)|In])
:- !.

consider_part_status(_,in_robot,_,_,In,[object_in_robot(_,sony_scara)|In])
:- !.

consider_part_status(_,assembled,_,_,In,In)
:- !.

%

extract_all_components_status(Prod,In,Out)
:- get_values(Prod,components,LComp),
   extract_all_components_status(Prod,LComp,In,Out).

extract_all_components_status(_,[],In,In)
:- !.

extract_all_components_status(Prod,[C|LC],In,Out)
:- get_value(C,comp_status,Status),
   ( Status == assembled, 
     get_value(Prod,prod_fixture,Fix),
     get_value(C,represented_by,Obj),
     Aux = [component_assembled(C,Prod,Fix),represented_by(C,Obj)|In];
     Aux = In
   ),
   get_value(C,contacts,LComp),
   assert(planning_info(component_contacts(C,LComp))),
   ( get_values(C,previous_mates,LPrevM); LPrevM = [] ),
   ( get_values(C,next_mates,LNextM); LNextM = [] ),
   get_value(C,mate_appr_pos,App),
   get_value(C,mate_pos,M),
   get_value(C,mate_depart_pos,Dep),
   get_value(C,part,Part),
   assert(planning_info(part_mate(Prod,C,Part,App,M,Dep,LPrevM,LNextM))),!,
   extract_all_components_status(Prod,LC,Aux,Out).

%

extract_all_unknown_objects_status(In,Out)
:- ( get_values(unknown_object,subtypes,_); LUK = [] ),
   extract_all_unknown_objects_status(LUK,In,Out).

extract_all_unknown_objects_status([],In,In)
:- !.

extract_all_unknown_objects_status([U|LU],In,Out)
:- get_value(U,artifact_status,Status),
   ( Status == on_table, F = object_on_table(U);
     Status == in_robot, F = object_in_robot(U,sony_scara)
   ),
   assert(planning_info(object_type(U,unknown_object))),
   extract_all_unknown_objects_status(LU,[F|In],Out),!.

%

extract_feeder_status(Feeder,In,Out)
:- get_value(Feeder,operation_status,Status),
   ( Status == part_available, Aux = In;
     Aux = [no_part_available_in_feeder(Feeder)|In]
   ),
   get_value(Feeder,failure_status,Fault),
   ( Fault == stock_empty, Out = [feeder_stock_empty(Feeder)|Aux];
     Fault == jammed, Out = [feeder_jammed(_)|Aux];
     Out = Aux
   ),
   get_value(Feeder,feeder_part,Part),
   get_value(Feeder,fd_approach,App),
   get_value(Feeder,fd_part_location,Loc),
   get_value(Feeder,fd_depart,Dep),
   assert(planning_info(part_feeder(Part,Feeder,App,Loc,Dep))),!.

%

extract_toolplace_status(TP,In,Out)
:- get_value(TP,operation_status,Status),
   ( Status == empty, Aux = [toolplace_empty(TP)|In];
     Aux = In
   ),
   get_value(TP,failure_status,Fault),
   ( Fault == toolplace_breakdown, Out = [toolplace_breakdown(TP)|Aux];
     Out = Aux
   ),
   get_value(TP,tp_approach,App),
   get_value(TP,tp_tool_loc,Loc),
   get_value(TP,tp_depart,Dep),
   assert(planning_info(magazine_toolplace(TP,App,Loc,Dep))),!.


%

extract_gripper_status(Gripper,In,Out)
:- get_value(Gripper,operation_status,Status),
   ( Status == stored, 
     get_value(Gripper,in_tool_place,TP), 
     Aux = [tool_in_magazine(Gripper,TP)|In];
     Status = free,
     Aux = [robot_free(sony_scara)|In];
     Aux = In
   ),
   get_value(Gripper,failure_status,Fault),
   ( Fault == tool_breakdown, Out = [tool_breakdown(Gripper)|Aux];
     Out = Aux
   ),!.


extract_robot_status(Robot,In,Out)
:- get_value(Robot,operation_status,Status),
   ( Status == no_tool_attached, 
     Aux = [robot_free(Robot), no_tool_attached(Robot)|In];
     get_value(Robot,current_tool,Tool), 
     Aux = [current_tool(Robot,Tool)|In]
   ),
   get_value(Robot,failure_status,Fault),
   ( Fault == arm_breakdown, Out = [robot_arm_breakdown(Robot)|Aux];
     Out = Aux
   ), !.

%

extract_fixture_status(Fix,In,Out)
:- get_value(Fix,operation_status,Status),
   ( Status == available, Aux = [fixture_available(Fix)|In];
     get_value(Fix,current_product,Prod),
     Aux = [fixture_with_product(Fix,Prod)|In]
   ),
   get_value(Fix,failure_status,Fault),
   ( Fault == breakdown, Out = [fixture_breakdown(Fix)|Aux];
     Out = Aux
   ),!.

%

extract_pallet_status(Pal,In,Out)
:- get_value(Pal,operation_status,Status),
   get_value(Pal,in_pallet_system,PalSys),
   ( Status == available, 
     Aux = [pallet_in_system(Pal,PalSys), pallet_available(Pal,PalSys)|In];
     Aux = [pallet_in_system(Pal,PalSys)|In]
   ),
   get_value(Pal,failure_status,Fault),
   ( Fault == jammed, Out = [pallet_jammed(Pal)|Aux];
     Out = Aux
   ),!.

%

extract_pal_sys_status(PalSys,In,Out)
:- get_value(PalSys,operation_status,Status),
   ( Status == no_pallet_available, Aux = [no_pallet_available(PalSys)|In];
     Aux = In
   ),
   get_value(PalSys,failure_status,Fault),
   ( Fault == breakdown, Out = [pallet_system_breakdown(PalSys)|Aux];
     Out = Aux
   ),!.

%
