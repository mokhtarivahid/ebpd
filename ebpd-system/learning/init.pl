%% to avoid the abbreviate outputs (prints)
%:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true)]).
:- set_prolog_flag(answer_write_options, [quoted(true),portray(true),spacing(next_argument)]).

golog
:- writeln('utilities ...'),
   [ utilities,
     frame_engine
   ],
   writeln('... done').

models
:- cd('Models'),
   writeln('Loading domain models ...'),
   [ top_concepts,
     %physical_cell,
     relations,
     resources,
     the_cell,
     products,
     cranfield_mth,
     cranfield,
     operators_mth,
     %abstract_operators,
     %feature_extraction,
     operators,
     %race_domain,
     %rover_domain,
     %dwr_domain,
     stripped_tower_domain,
     %robotic_arm,
     %robotic_arm2,
     %robotic_arm3,
     %gripper,
     %bin,
     %cafe,
     %logistic_domain,
     %satellite_domain,
     %zeno_travel_domain,
     race_feature_extraction
   ],
   set_pi,  % extract planning info
   cd('..'),
   writeln('... done').

program
:- writeln('Loading program ...'),
   [ planeador,
     simulate_plan,
     generalizer,
     recovery,
     explainer_g,
     cbr,
     test_utils,
     write_file,
     infer_goal
   ],
   writeln('... done').

examples
:- cd('MyExamples'),
   writeln('Loading examples ...'),
   [ failure_types,
     fail_crossbar,
     fail_sp2,
     fail_sp2_2,
     fail_lv,
     fail_lv2,
     %experiences/race_activity_experiences,
     %experiences/rover_activity_experiences,
     %experiences/dwr_activity_experiences,
     %experiences/stripped_tower_experiences2,
     %experiences/stripped_tower_experiences3,
     %experiences/stripped_tower_experiences4,
     %experiences/stripped_tower_s_experiences2,
     %experiences/stripped_tower_s_experiences3,
     %experiences/robotic_arm_activity_experiences,
     %experiences/robotic_arm2_activity_experiences,
     %experiences/robotic_arm3_activity_experiences,
     %experiences/gripper_experiences,
     %experiences/bin_experiences,
     %experiences/cafe_experiences,
     %experiences/logistic_experiences,
     %experiences/satellite_experiences,
     %experiences/zeno_travel_experiences,
     %experiences/satellite_experiences_icaps2018,
     %experiences/stacking_blocks/1/stacking_blocks_experiences,
     %experiences/stacking_blocks/2/stacking_blocks_experiences,
     %experiences/stacking_blocks/3/stacking_blocks_experiences,
     %experiences/stacking_blocks/4/stacking_blocks_experiences,
     %experiences/stacking_blocks/5/stacking_blocks_experiences,
     %experiences/stacking_blocks/6/stacking_blocks_experiences,

     %experiences/stacking_blocks__/1/stacking_blocks_experiences,
     %experiences/stacking_blocks__/3/stacking_blocks_experiences,
     %experiences/stacking_blocks__/4/stacking_blocks_experiences,
     experiences/stacking_blocks__/5/stacking_blocks_experiences,
     cleanup,
     'cranfield.ppr',
     'cranfield.sol',
     imperfect_plan
   ],
   cd('..'),
   writeln('... done').


:- golog,
   models,
   program,
   examples.

%% to avoid the abbreviate outputs (prints)
:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true)]).

