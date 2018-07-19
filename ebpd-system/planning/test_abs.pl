%% :-[sbpabs_h_diff].
:-[sbpabs_h_add].
%% :-[sbpabs_h_max].
%% :-[sbpabs_h_add_back].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% stacking-blocks domain (July 4, 2018)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% stacking-blocks
:-[schemata/stacking_blocks_schemata11].
:-solve_sbpabs('test/stacking_blocks11/p20.pddl.ebpd').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% robotic_arm domain (December 18, 2017)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% robotic_arm
%:-[schemata/robotic_arm_schemata].
%:-solve_sbpabs('test/robotic_arm/p04.pddl.ebpd').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% gripper domain (December 18, 2017)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% gripper
%:-[schemata/gripper_schemata].
%:-solve_sbpabs('test/gripper/p4.pddl.ebpd').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% logistic domain (October 19, 2017)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% logistic
%%:-[schemata/logistic_schemata].
%%:-solve_sbpabs('test/logistic/log2_2.pddl.ebpd').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% satellite domain (October 19, 2017)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% satellite
%% :-[schemata/satellite_schemata].
%:-solve_sbpabs('test/satellite/instance-10.pddl.ebpd').
%% :-solve_sbpabs('test/satellite/exp1/p12.pddl.ebpd').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% bin domain (December 14, 2016)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% bin
%:-[schemata/bin_schemata].
%:-solve_sbpabs('test/bin/p20.pddl.ebpd').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% stripped tower domain (December 10, 2016)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% stripped_tower_unstack_stack
%:-[schemata/stripped_tower_activity_schemata_loop].
%:-solve_sbpabs('test/stripped_tower/p06.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower/p08.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower/p10.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower/p10_2.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower/p12.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower/p14.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower/p20.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower/p42.pddl.ebpd').

%% stripped_tower_stack
%:-[schemata/stripped_tower_s_schemata].
%:-solve_sbpabs('test/stripped_tower_s/p08.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower_s/p10.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower_s/p12.pddl.ebpd').
%:-solve_sbpabs('test/stripped_tower_s/p14.pddl.ebpd').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Robotic Arm domain (December 10, 2016)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%:-[schemata/robotic_arm_schemata].
%:-solve_sbpabs('test/jaco/p01.pddl.ebpd').
%:-solve_sbpabs('test/jaco/p02.pddl.ebpd').
%:-solve_sbpabs('test/jaco/p03.pddl.ebpd').
%:-solve_sbpabs('test/jaco/p04.pddl.ebpd').
%:-solve_sbpabs('test/jaco/p05.pddl.ebpd').
%:-solve_sbpabs('test/jaco/p06.pddl.ebpd').
%:-solve_sbpabs('test/jaco/p07.pddl.ebpd').
%:-solve_sbpabs('test/jaco/p08.pddl.ebpd').
%:-solve_sbpabs('test/jaco/p09.pddl.ebpd').
%:-solve_sbpabs('test/jaco/p10.pddl.ebpd').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% for cafe domain (20 June, 2017)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%:-[schemata/cafe_schemata].
%:-solve_sbpabs('test/cafe/problem1.pddl.ebpd').


