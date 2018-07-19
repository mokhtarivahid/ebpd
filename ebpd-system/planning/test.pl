:-[sbp].
%:-nb_setval(alpha,3).

%:-solve_sbp_files('test/stacking_blocks11/domain.pddl','test/stacking_blocks11/p20.ebpd.pddl').

%:-solve_sbp_files('test/blocks/domain-blocks.pddl','test/blocks/blocks-03-0.pddl').

%:-solve_sbp('test/race/domain.pddl','test/race/race-problem01.pddl').
%:-solve_sbp('test/race/domain.pddl','test/race/race-serve-table1.pddl').
%:-solve_sbp('test/race/domain.pddl','test/race/race-clear-table1.pddl').

%:-solve_sbp('test/race/domain.pddl','test/race/problems/problem_20150116_123559.pddl').

%% clear table
%:-solve_sbp('test/race/domain-new_v3.pddl','test/race/problem-new_v4_2.pddl').

%% clear table (loop)
%:-solve_sbp('test/race/domain-new_v3.pddl','test/race/problem-new_v4_2_loop.pddl').

%% serve coffee
%:-solve_sbp('test/race/domain-new_v3.pddl','test/race/problem-new_v3_2.pddl').

%% serve coffee (loop)
%:-solve_sbp('test/race/domain-new_v3.pddl','test/race/problem-new_v3_2_loop.pddl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Car Door Assembly (August 30, 2016)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%:-[schemata/assembly_activity_schemata].
%:-solve_sbp('test/assembly/domain_test.pddl','test/assembly/problem.pddl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dock Worker Robot (November 8, 2016)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%:-[schemata/dwr_activity_schemata].
%:-nb_setval(alpha,2).
%:-solve_sbp('test/dwr/domain.pddl','test/dwr/p00.pddl.ebpd').
%:-solve_sbp('test/dwr/domain.pddl','test/dwr/p01.pddl.ebpd').
%:-solve_sbp('test/dwr/domain.pddl','test/dwr/p02.pddl.ebpd').
%% stripped_tower

%:-['schemata/woloop/blocks_activity_schemata'].
%:-nb_setval(alpha,2).
%:-solve_sbp('test/stripped_tower/domain.ebpd','test/stripped_tower/p10.pddl.ebpd').
%:-solve_sbp('test/stripped_tower/domain.ebpd','test/stripped_tower/p08.pddl.ebpd').
%:-solve_sbp('test/stripped_tower/domain.ebpd','test/stripped_tower/p10.pddl.ebpd').
%:-solve_sbp('test/stripped_tower/domain.ebpd','test/stripped_tower/p20.pddl.ebpd').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Robotic Arm domain (August 30, 2016)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%:-[schemata/robotic_arm_activity_schemata].
%:-nb_setval(alpha,3.1).
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p001.pddl.ebpd').
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p002.pddl.ebpd').
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p003.pddl.ebpd').
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p004.pddl.ebpd').
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p005.pddl.ebpd').
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p006.pddl.ebpd').
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p007.pddl.ebpd').
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p008.pddl.ebpd').
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p009.pddl.ebpd').
%:-solve_sbp('test/jaco/domain.ebpd','test/jaco/p010.pddl.ebpd').

%% running on abstract domain
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p001.pddl.ebpd').
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p002.pddl.ebpd').
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p003.pddl.ebpd').
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p004.pddl.ebpd').
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p005.pddl.ebpd').
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p006.pddl.ebpd').
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p007.pddl.ebpd').
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p008.pddl.ebpd').
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p009.pddl.ebpd').
%:-solve_sbp('test/jaco/domain-abs.ebpd','test/jaco/p010.pddl.ebpd').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rover domain (April 07, 2016)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%:-[schemata/rover_activity_schemata].
%:-nb_setval(alpha,2).
%:-solve_sbp('test/rover/rover_domain.ebpd','test/rover/p02/p2.pddl.ebpd').
%:-solve_sbp('test/rover/rover_domain.ebpd','test/rover/p06/p6.pddl.ebpd').
%:-solve_sbp('test/rover/rover_domain.ebpd','test/rover/p20/p20.pddl.ebpd').
%:-solve_sbp('test/rover/rover_domain.ebpd','test/rover/p01.pddl.ebpd').
%:-solve_sbp('test/rover/rover_domain.ebpd','test/rover/p00.ebpd').
%:-solve_sbp('test/rover/rover_domain.ebpd','test/rover/p01.ebpd').
%:-solve_sbp('test/rover/rover_domain.ebpd','test/rover/p04.ebpd').
%:-solve_sbp('test/rover/rover_domain.ebpd','test/rover/p05.ebpd').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% for JINT2015 paper (October 22, 2015)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%:-['test/race/jint2015/race_activity_schemata_jint2015.pl'].
%% serve_coffee_to_guest_jint01 Guest Counter
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/srv_G_C/problem-serve01.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/srv_G_C/problem-serve02.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/srv_G_C/problem-serve03.pddl').

%% serve_coffee_to_guest_jint02 Mug Guest
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/srv_M_G/problem-serve01.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/srv_M_G/problem-serve02.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/srv_M_G/problem-serve03.pddl').

%% serve_coffee_to_guest_jint03 Mug Guest Counter
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/srv_M_G_C/problem-serve01.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/srv_M_G_C/problem-serve02.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/srv_M_G_C/problem-serve03.pddl').

%% clear_table_jint01 Table
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/clr_T/problem-clear01.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/clr_T/problem-clear02.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/clr_T/problem-clear03.pddl').

%% clear_table_jint02 Table Counter
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/clr_T_C/problem-clear01.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/clr_T_C/problem-clear02.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/clr_T_C/problem-clear03.pddl').

%% clear_table_jint03 Mug Table Counter
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/clr_M_T_C/problem-clear01.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/clr_M_T_C/problem-clear02.pddl').
%:-solve_sbp('test/race/jint2015/domain-new_v3.pddl','test/race/jint2015/clr_M_T_C/problem-clear03.pddl').
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

