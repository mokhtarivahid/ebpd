
% Learning episode 1: assembling CB failed

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
%                    SP2


:- assert(
failure_situation(1,

   cranfield,

   defective_assembly('obj_#2',cranf_sp1,cranfield_benchmark,fix_1),

   assemble_component(sony_scara,gp_2,'obj_#16',
      cranf_cb1,cross_bar,cranfield_benchmark,fix_1)

)).


:- assert(
plan_before_failure(1,

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

%   pick_part_from_pallet(sony_scara,gp_3,peg_o1,spacer_peg,pal_2,pal_sys),
%   assemble_component(sony_scara,gp_3,peg_o1,cranf_peg4,spacer_peg,
%        cranfield_benchmark,fix_1),
%
%   pick_part_from_pallet(sony_scara,gp_3,peg_o2,spacer_peg,pal_2,pal_sys),
%   assemble_component(sony_scara,gp_3,peg_o2,cranf_peg3,spacer_peg,
%        cranfield_benchmark,fix_1),
%
    pick_part_from_pallet(sony_scara,gp_3,peg_o3,spacer_peg,pal_2,pal_sys),
    assemble_component(sony_scara,gp_3,peg_o3,cranf_peg2,spacer_peg,
         cranfield_benchmark,fix_1),

    pick_part_from_pallet(sony_scara,gp_3,peg_o4,spacer_peg,pal_2,pal_sys),
    assemble_component(sony_scara,gp_3,peg_o4,cranf_peg1,spacer_peg,
         cranfield_benchmark,fix_1),

    store_tool(sony_scara,gp_3,toolp_3),
    get_tool(sony_scara,gp_2,toolp_2),

    feed_part(feeder_cb,'obj_#16',cross_bar),
    pick_part_from_feeder(sony_scara,gp_2,'obj_#16',cross_bar,feeder_cb)
%,


%   assemble_component(sony_scara,gp_2,'obj_#16',cranf_cb1,cross_bar,
%        cranfield_benchmark,fix_1),
%   putaway_pallet(pal_2,pal_sys),
%   feed_pallet(pal_1,pal_sys),
%   pick_part_from_pallet(sony_scara,gp_2,sft_o1,shaft,pal_1,pal_sys),
%   assemble_component(sony_scara,gp_2,sft_o1,cranf_sft1,shaft,
%        cranfield_benchmark,fix_1),

%   pick_part_from_pallet(sony_scara,gp_2,lv_o1,lever,pal_1,pal_sys),
%   assemble_component(sony_scara,gp_2,lv_o1,cranf_lv1,lever,
%        cranfield_benchmark,fix_1),

%   store_tool(sony_scara,gp_2,toolp_2),
%   get_tool(sony_scara,gp_1,toolp_1),

%   feed_part(feeder_sp,'obj_#44',side_plate),
%   pick_part_from_feeder(sony_scara,gp_1,'obj_#44',side_plate,feeder_sp)

%   assemble_component(sony_scara,gp_1,'obj_#44',cranf_sp2,side_plate,
%        cranfield_benchmark,fix_1)  % exta he a operacao que vai falhar

])).



% Failure recovery episode format:
%
%    failure_episode(
%        EpisodeId,
%        Problem,
%        [ FailedOp,
%          FailureDiag,
%          FailRecPlan
%        ]
%    ).
%



:- assert(
failure_episode(1, 


  cranfield,

  [

  assemble_component(sony_scara,gp_2,'obj_#76',
     cranf_cb1,cross_bar,cranfield_benchmark,fix_1),

  defective_assembly('obj_#66',cranf_sp1,cranfield_benchmark,fix_1),

  [ putdown_object(sony_scara,gp_2,'obj_#76'),
    store_tool(sony_scara,gp_2,toolp_2),
    get_tool(sony_scara,gp_3,toolp_3),
    disassemble_component(sony_scara,gp_3,peg_o1,cranf_peg1,
       spacer_peg,cranfield_benchmark,fix_1),
    putdown_object(sony_scara,gp_3,peg_o1),
    disassemble_component(sony_scara,gp_3,peg_o2,cranf_peg2,
       spacer_peg,cranfield_benchmark,fix_1),
    putdown_object(sony_scara,gp_3,peg_o2),
    store_tool(sony_scara,gp_3,toolp_3),
    get_tool(sony_scara,gp_1,toolp_1),
    disassemble_component(sony_scara,gp_1,'obj_#66',cranf_sp1,
       side_plate,cranfield_benchmark,fix_1),
    putdown_object(sony_scara,gp_1,'obj_#66'),
    feed_part(feeder_sp,'obj_#99',side_plate),
    pick_part_from_feeder(sony_scara,gp_1,'obj_#99',side_plate,feeder_sp),
    assemble_component(sony_scara,gp_1,'obj_#99',cranf_sp1,
       side_plate,cranfield_benchmark,fix_1),
    store_tool(sony_scara,gp_1,toolp_1),
    get_tool(sony_scara,gp_3,toolp_3),
    pickup_part(sony_scara,gp_3,peg_o1,spacer_peg),
    assemble_component(sony_scara,gp_3,peg_o1,cranf_peg1,
       spacer_peg,cranfield_benchmark,fix_1),
    pickup_part(sony_scara,gp_3,peg_o2,spacer_peg),
    assemble_component(sony_scara,gp_3,peg_o2,cranf_peg2,
       spacer_peg,cranfield_benchmark,fix_1),
    store_tool(sony_scara,gp_3,toolp_3),
    get_tool(sony_scara,gp_2,toolp_2),
    pickup_part(sony_scara,gp_2,'obj_#76',cross_bar),
    assemble_component(sony_scara,gp_2,'obj_#76',cranf_cb1,
       cross_bar,cranfield_benchmark,fix_1)
  ]
]
)).


% ********************
%
% ?- skeletize(1).
%  
%  7.430000000000000e+00
%  [ assemble_component(R,GP2,Obj76,CB1,CB,Cranf,Fx),
%  
%    defective_assembly(Obj66,SP1,Cranf,Fx),
%  
%    [ [place(Obj76),nil],
%      [[disassemble(_440,_442),place(_440)],
%         [assemble_after(_442,SP1),assemble_before(_442,CB1)]],
%      [disassemble(Obj66,SP1),nil],
%      [place(Obj66),nil],
%      [pick(_706),nil],
%      [assemble(_706,SP1),nil],
%      [[pick(_440),assemble(_440,_442)],
%         [assemble_after(_442,SP1),assemble_before(_442,CB1)]],
%      [pick(Obj76),nil],
%      [assemble(Obj76,CB1),nil]
%    ]
%  ]
%  Yes 
% 
%  ?- 
%


