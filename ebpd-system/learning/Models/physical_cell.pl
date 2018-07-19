

:- extern_load([robot_set_speed,move_horizontal,robot_open_gripper,
      robot_set_right_arm, robot_set_left_arm, 
      robot_close_gripper,robot_attach_tool,robot_release_tool,
      init_cell,feeder_feed_part,mon_define_condition,mon_define_profile,
      mon_start_evaluation,mon_stop_evaluation,mon_consult_sensors,
      mon_get_action_trace,mon_trace_next_action,mon_profile_monitoring],

      [ '~lsl/Supervisor/Infrastructure/physical_cell.o',
        '~lsl/Supervisor/Infrastructure/Robot/useTP.o',
        '~lsl/Supervisor/Infrastructure/Robot/useTP_xdr.o',
        '~lsl/Supervisor/Infrastructure/Robot/useTP_clnt.o',
        '~lsl/Supervisor/Infrastructure/Robot/errors.o',
        '~lsl/Supervisor/Infrastructure/rmtwrite/rmtcom_clnt.o',
        '~lsl/Supervisor/Infrastructure/rmtwrite/rmtcom_xdr.o',
        '~lsl/Supervisor/Infrastructure/rmtwrite/use_rmtcom.o',
        '~lsl/Supervisor/Infrastructure/RS232/serial.o',
        '~lsl/Supervisor/Infrastructure/RS232/message.o'
      ]).

:- extern_predicate(init_cell(integer:r)).

:- extern_predicate(robot_set_speed(integer:r,real:i)).

:- extern_predicate(robot_set_right_arm(integer:r)).
 
:- extern_predicate(robot_set_left_arm(integer:r)). 

:- extern_predicate(move_horizontal(integer:r,real:i,real:i)).

:- extern_predicate(robot_open_gripper(integer:r)).

:- extern_predicate(robot_close_gripper(integer:r)).

:- extern_predicate(robot_attach_tool(integer:r)).

:- extern_predicate(robot_release_tool(integer:r)).

:- extern_predicate(feeder_feed_part(integer:r,integer:i)).

:- extern_predicate(mon_define_condition(integer:r,string:i,integer:array:m)).

:- extern_predicate(mon_define_profile(integer:r,string:i,integer:array:m)).

:- extern_predicate(mon_start_evaluation(integer:r,integer:i)).

:- extern_predicate(mon_stop_evaluation(integer:r,integer:i)).

:- extern_predicate(mon_consult_sensors(integer:r,string:m)).

:- extern_predicate(mon_get_action_trace(integer:r,string:m)).

:- extern_predicate(mon_profile_monitoring(integer:r,integer:i)).

:- extern_predicate(mon_trace_next_action(integer:r)).




copy_to_foreign_string(Str,ForStr)
:- asciilist(Str,L), list_length(L,N), M is N+1,        
   extern_allocate(ForStr,array(M,char)),
   make_copy_to_foreign_string(L,ForStr,0).

make_copy_to_foreign_string([],ForStr,M)
:- extern_set(ForStr^M,0),!.

make_copy_to_foreign_string([C|Str],ForStr,M)
:- extern_set(ForStr^M,C), N is M+1,
   make_copy_to_foreign_string(Str,ForStr,N),!.


