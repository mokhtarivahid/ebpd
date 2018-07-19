
% Learning episode 2: assemble of SP2 failed
% % % % % % % % % % % % % % % % % % % % % % % % %

:- assert(
failure_situation(2,  %% one of the pegs is defective and must be replaced

   cranfield,

   defective_assembly(peg_o3,cranf_peg2,cranfield_benchmark,fix_1),

   assemble_component(sony_scara,gp_1,'obj_#44',cranf_sp2,side_plate,
        cranfield_benchmark,fix_1)
)).

  %
  %                      SP1
  %                 * *   *  *  *
  %             *   *      *   *    * 
  %         *     *        *     *      *
  %      *       *         *        *       *
  %    peg1    peg2       shaft    peg3       peg4
  %      *     *           *        *          *
  %       *  *             *        *         *
  %        CB            lever      *        *
  %           *            *       *       *
  %             *         *      *       *
  %                *     *    *      *
  %                  *  *   *  *
% % %                  SP2
 %%%
  %

% *********************************************************************
% Plan that assembles all parts before the failed 
% operation (assembly of second side plate):

:- assert(
plan_before_failure(2,

  cranfield,

  [
    set_fixture_for_product(fix_1,cranfield_benchmark),
    get_tool(sony_scara,gp_1,toolp_1),

    feed_part(feeder_sp,'obj_#2',side_plate),
    pick_part_from_feeder(sony_scara,gp_1,'obj_#2',side_plate,feeder_sp),
    assemble_component(sony_scara,gp_1,'obj_#2',cranf_sp1,side_plate,
         cranfield_benchmark,fix_1),

    store_tool(sony_scara,gp_1,toolp_1),
    get_tool(sony_scara,gp_3,toolp_3),

    feed_pallet(pal_2,pal_sys),
    pick_part_from_pallet(sony_scara,gp_3,peg_o1,spacer_peg,pal_2,pal_sys),
    assemble_component(sony_scara,gp_3,peg_o1,cranf_peg4,spacer_peg,
         cranfield_benchmark,fix_1),

    pick_part_from_pallet(sony_scara,gp_3,peg_o2,spacer_peg,pal_2,pal_sys),
    assemble_component(sony_scara,gp_3,peg_o2,cranf_peg3,spacer_peg,
         cranfield_benchmark,fix_1),

    pick_part_from_pallet(sony_scara,gp_3,peg_o3,spacer_peg,pal_2,pal_sys),
    assemble_component(sony_scara,gp_3,peg_o3,cranf_peg2,spacer_peg,
         cranfield_benchmark,fix_1),

    pick_part_from_pallet(sony_scara,gp_3,peg_o4,spacer_peg,pal_2,pal_sys),
    assemble_component(sony_scara,gp_3,peg_o4,cranf_peg1,spacer_peg,
         cranfield_benchmark,fix_1),

    store_tool(sony_scara,gp_3,toolp_3),
    get_tool(sony_scara,gp_2,toolp_2),

    feed_part(feeder_cb,'obj_#16',cross_bar),
    pick_part_from_feeder(sony_scara,gp_2,'obj_#16',cross_bar,feeder_cb),
    assemble_component(sony_scara,gp_2,'obj_#16',cranf_cb1,cross_bar,
         cranfield_benchmark,fix_1),

    putaway_pallet(pal_2,pal_sys),
    feed_pallet(pal_1,pal_sys),
    pick_part_from_pallet(sony_scara,gp_2,sft_o1,shaft,pal_1,pal_sys),
    assemble_component(sony_scara,gp_2,sft_o1,cranf_sft1,shaft,
         cranfield_benchmark,fix_1),

    pick_part_from_pallet(sony_scara,gp_2,lv_o1,lever,pal_1,pal_sys),
    assemble_component(sony_scara,gp_2,lv_o1,cranf_lv1,lever,
         cranfield_benchmark,fix_1),

    store_tool(sony_scara,gp_2,toolp_2),
    get_tool(sony_scara,gp_1,toolp_1),

    feed_part(feeder_sp,'obj_#44',side_plate),
    pick_part_from_feeder(sony_scara,gp_1,'obj_#44',side_plate,feeder_sp)

%    assemble_component(sony_scara,gp_1,'obj_#44',cranf_sp2,side_plate,
%         cranfield_benchmark,fix_1)  % exta he a operacao que vai falhar

])).


% *********************************************
%
%  ?- get_state_before_failure(2,GS).
%
%    GS = [ pallet_in_system(pal_2,pal_sys),
%           pallet_in_system(pal_1,pal_sys),
%           part_in_pallet(p_o9,pal_2),
%           part_in_pallet(p_o8,pal_2),
%           part_in_pallet(p_o7,pal_2),
%           part_in_pallet(p_o6,pal_2),
%           part_in_pallet(p_o5,pal_2),
%           part_in_pallet(p_o4,pal_2),
%           part_in_pallet(p_o3,pal_2),
%           part_in_pallet(p_o2,pal_2),
%           part_in_pallet(p_o1,pal_2),
%           fixture_with_product(fix_1,cranfield_benchmark),
%           object_type(obj_#2,side_plate),
%           component_assembled(cranf_sp1,cranfield_benchmark,fix_1),
%           represented_by(cranf_sp1,obj_#2),
%           component_assembled(cranf_peg4,cranfield_benchmark,fix_1),
%           represented_by(cranf_peg4,peg_o1),
%           component_assembled(cranf_peg3,cranfield_benchmark,fix_1),
%           represented_by(cranf_peg3,peg_o2),
%           component_assembled(cranf_peg2,cranfield_benchmark,fix_1),
%           represented_by(cranf_peg2,peg_o3),
%           component_assembled(cranf_peg1,cranfield_benchmark,fix_1),
%           represented_by(cranf_peg1,peg_o4),
%           tool_in_magazine(gp_3,toolp_3),
%           object_type(obj_#16,cross_bar),
%           no_part_available_in_feeder(feeder_cb),
%           component_assembled(cranf_cb1,cranfield_benchmark,fix_1),
%           represented_by(cranf_cb1,obj_#16),
%           pallet_available(pal_1,pal_sys),
%           component_assembled(cranf_sft1,cranfield_benchmark,fix_1),
%           represented_by(cranf_sft1,sft_o1),
%           component_assembled(cranf_lv1,cranfield_benchmark,fix_1),
%           represented_by(cranf_lv1,lv_o1),
%           tool_in_magazine(gp_2,toolp_2),
%           toolplace_empty(toolp_1),
%           current_tool(sony_scara,gp_1),
%           object_type(obj_#44,side_plate),
%           no_part_available_in_feeder(feeder_sp),
%           object_in_robot(obj_#44,sony_scara)
%  ]
%  Yes 



/*

%% After preparing for abstract planning:



Abstract failure state:

[available(p_o9), available(p_o8), available(p_o7), available(p_o6), available(p_o5), available(p_o4), available(p_o3), available(p_o2), available(p_o1), available(peg_o5), object_type(obj_#2, side_plate), assembled(cranf_sp1), reby(cranf_sp1, obj_#2), assembled(cranf_peg4), reby(cranf_peg4, peg_o1), assembled(cranf_peg3), reby(cranf_peg3, peg_o2), assembled(cranf_peg2), reby(cranf_peg2, peg_o3), assembled(cranf_peg1), reby(cranf_peg1, peg_o4), object_type(obj_#16, cross_bar), assembled(cranf_cb1), reby(cranf_cb1, obj_#16), assembled(cranf_sft1), reby(cranf_sft1, sft_o1), assembled(cranf_lv1), reby(cranf_lv1, lv_o1), object_type(obj_#44, side_plate), holding(obj_#44), defective(peg_o3)], 

Abstract list of goals:

[assembled(cranf_sp1), assembled(cranf_peg4), assembled(cranf_peg3), assembled(cranf_peg2), assembled(cranf_peg1), assembled(cranf_cb1), assembled(cranf_sft1), assembled(cranf_lv1), assembled(cranf_sp2)], 

Abstract plan skeleton:

[
   [place(obj_#44), []],
   [[disassemble(_G501, _G502), place(_G501)], 
          [ assemble_after(_G502, cranf_peg2),
            assemble_before(_G502, cranf_sp2),
            initially_assembled(_G502) ]], 
   [disassemble(peg_o3, cranf_peg2), []],
   [place(peg_o3), []], 
   [pick(_G558), 
          [ same_type_as(_G558, peg_o3)]],
   [assemble(_G558, cranf_peg2),
          [ same_type_as(_G558, peg_o3)]],
   [[pick(_G501), assemble(_G501, _G502)],
          [ assemble_after(_G502, cranf_peg2),
            assemble_before(_G502, cranf_sp2),
            initially_assembled(_G502)]], 
   [pick(obj_#44), []], 
   [assemble(obj_#44, cranf_sp2), []]]]

Abstract plan:

[
   [place(obj_#44), nil], 
   [disassemble(obj_#16, cranf_cb1), nil], 
   [place(obj_#16), nil], 
   [disassemble(peg_o3, cranf_peg2), nil], 
   [place(peg_o3), nil], 
   [pick(peg_o5), nil], 
   [assemble(peg_o5, cranf_peg2), nil], 
   [pick(obj_#16), nil], 
   [assemble(obj_#16, cranf_cb1), nil], 
   [pick(obj_#44), nil], 
   [assemble(obj_#44, cranf_sp2), nil]
]




Test operations:

?- skeletize(1).
?- prepabstplan(2,AFS,ALG,Plan_sk), assert(p(AFS,ALG,Plan_sk)).
?- p(AFS,ALG,Plan_sk), writeln([ AFS, ALG, Plan_sk]).
?- p(AFS,ALG,Plan_sk), build_abstract_plan(AFS,ALG,Plan_sk, APlan_num),
   writeln(APlan_num), assert(q(APlan_num)).
?- p(AFS,_,_), apply_abstract_operation(AFS,place('obj_#44'),S2), assert(s2(S2)).
?- q(APlan_num), 

*/
