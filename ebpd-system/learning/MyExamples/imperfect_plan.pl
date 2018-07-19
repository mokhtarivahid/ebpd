

imperfect_plan(
[
set_fixture_for_product(fix_1, cranfield_benchmark),
get_tool(sony_scara, gp_1, toolp_1),
feed_part(feeder_sp, 'obj_#2', side_plate),
pick_part_from_feeder(sony_scara, gp_1, 'obj_#2', side_plate, feeder_sp),
assemble_component(sony_scara, gp_1, 'obj_#2', cranf_sp1, side_plate,
        cranfield_benchmark, fix_1),

feed_pallet(pal_2, pal_sys),
store_tool(sony_scara, gp_1, toolp_1),
get_tool(sony_scara, gp_3, toolp_3),
pick_part_from_pallet(sony_scara, gp_3, peg_o1, spacer_peg, pal_2, 
        pal_sys),
assemble_component(sony_scara, gp_3, peg_o1, cranf_peg3, spacer_peg,
         cranfield_benchmark, fix_1),
pick_part_from_pallet(sony_scara, gp_3, p_o1, lock_pin, pal_2, pal_sys),
assemble_component(sony_scara, gp_3, p_o1, cranf_p7,lock_pin,
         cranfield_benchmark, fix_1),

feed_part(feeder_cb, 'obj_#70', cross_bar),
feed_part(feeder_sp, 'obj_#71', side_plate),
pick_part_from_pallet(sony_scara, gp_3, peg_o2, spacer_peg, pal_2,
         pal_sys),
assemble_component(sony_scara, gp_3, peg_o2, cranf_peg1, spacer_peg,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_3, peg_o3, spacer_peg, pal_2,
         pal_sys),
assemble_component(sony_scara, gp_3, peg_o3, cranf_peg2, spacer_peg,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_3, p_o2, lock_pin, pal_2, pal_sys),
assemble_component(sony_scara, gp_3, p_o2, cranf_p1, lock_pin,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_3, peg_o4, spacer_peg, pal_2,
         pal_sys),
putdown_object(sony_scara, gp_3, peg_o4),
disassemble_component(sony_scara, gp_3, p_o1, cranf_p7, lock_pin,
         cranfield_benchmark, fix_1),
assemble_component(sony_scara, gp_3, p_o1, cranf_p2, lock_pin,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_3, peg_o5, spacer_peg, pal_2, pal_sys),
assemble_component(sony_scara, gp_3, peg_o5, cranf_peg4, spacer_peg,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_3, p_o3, lock_pin, pal_2, pal_sys),
assemble_component(sony_scara, gp_3, p_o3, cranf_p7, lock_pin,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_3, p_o4, lock_pin, pal_2, pal_sys),
assemble_component(sony_scara, gp_3, p_o4, cranf_p8, lock_pin,
         cranfield_benchmark, fix_1),

store_tool(sony_scara, gp_3, toolp_3),
get_tool(sony_scara, gp_2, toolp_2),
pick_part_from_feeder(sony_scara, gp_2, 'obj_#70', cross_bar, feeder_cb),
putaway_pallet(pal_2, pal_sys),
feed_pallet(pal_1, pal_sys),
place_part_in_pallet(sony_scara, gp_2, 'obj_#70', cross_bar, pal_1, pal_sys),
pick_part_from_pallet(sony_scara, gp_2, sft_o1, shaft, pal_1, pal_sys),
assemble_component(sony_scara, gp_2, sft_o1, cranf_sft1, shaft,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_2, lv_o1, lever, pal_1, pal_sys),
assemble_component(sony_scara, gp_2, lv_o1, cranf_lv1, lever,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_2, 'obj_#70', cross_bar, pal_1,
         pal_sys),
assemble_component(sony_scara, gp_2, 'obj_#70', cranf_cb1, cross_bar,
         cranfield_benchmark, fix_1),

store_tool(sony_scara, gp_2, toolp_2),
get_tool(sony_scara, gp_1, toolp_1),
pick_part_from_feeder(sony_scara, gp_1, 'obj_#71', side_plate, feeder_sp),
assemble_component(sony_scara, gp_1, 'obj_#71', cranf_sp2, side_plate,
         cranfield_benchmark, fix_1),

store_tool(sony_scara, gp_1, toolp_1),
get_tool(sony_scara, gp_3, toolp_3),
putaway_pallet(pal_1, pal_sys),
feed_pallet(pal_2, pal_sys),
pick_part_from_pallet(sony_scara, gp_3, p_o5, lock_pin, pal_2, pal_sys),
assemble_component(sony_scara, gp_3, p_o5, cranf_p6, lock_pin,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_3, p_o6, lock_pin, pal_2, pal_sys),
assemble_component(sony_scara, gp_3, p_o6, cranf_p4, lock_pin,
         cranfield_benchmark, fix_1),

pick_part_from_pallet(sony_scara, gp_3, p_o7, lock_pin, pal_2, pal_sys),
assemble_component(sony_scara, gp_3, p_o7, cranf_p3, lock_pin,
         cranfield_benchmark, fix_1),

feed_part(feeder_cb, 'obj_#1087', cross_bar),
pick_part_from_pallet(sony_scara, gp_3, p_o8, lock_pin, pal_2, pal_sys),
assemble_component(sony_scara, gp_3, p_o8, cranf_p5, lock_pin,
         cranfield_benchmark, fix_1),

putaway_pallet(pal_2, pal_sys),
feed_pallet(pal_1, pal_sys),
store_tool(sony_scara, gp_3, toolp_3)

]
).
