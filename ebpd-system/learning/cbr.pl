% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%
%     Kerberos Planner -- CBR utilities
%     (c) L. Seabra Lopes, 02/1996, cont. 10/96
%
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% ?- freabstract(1,[Op_g,Diag_g,[_,Step|_]],Info_g,FS_g,GS_g),
%    get_episode_entities(Op_g,Diag_g,FS_g,Info_g,EpEnts),
%    extract_step_features(Step,EpEnts,FS_g,Info_g,GS_g,Step_f).

%%
%% Episode skeletons (or failure recovery schemas):
%%

tfeat :- freabstract(1,[Op_g,Diag_g,[_,Step|_]],Info_g,FS_g,GS_g),
   get_episode_entities(Op_g,Diag_g,FS_g,Info_g,EpEnts),
   assert(altura(Op_g,Diag_g,Step,Info_g,FS_g,GS_g,EpEnts)).

tplanf :- freabstract(1,[Op_g,Diag_g,Plan_a],Info_g,FS_g,GS_g),
   get_episode_entities(Op_g,Diag_g,FS_g,Info_g,EpEnts),
   assert(planf(Op_g,Diag_g,Plan_a,Info_g,FS_g,GS_g,EpEnts)).

freabstract(Id,FRE_a,INFO_g,FS_g,GS_g)
:- time( (
     failure_episode(Id,FRE_c),
     explain_general_fr_episode(FRE_c,_,_,_,_,FRE_g,INFO_g,_,FS_g,GS_g),
     criticize_over_generalization(FRE_c,FRE_g),
     abstract_episode(FRE_g,FRE_a) ) ).


% Third version (developed for RACE)
% -- explanation and generalization in a single step (as in second version), and
% -- addresses any robot activities, instead of just failure recovery activities

conceptualize_ra_experience(RA_ex,_RA_schema)
:- explain_general_ra_experience(RA_ex,_,_,_,_,RA_g,_INFO_g,_,_FS_g,_GS_g,_Map),
%  criticize_over_generalization(FRE_c,FRE_g),
   abstract_episode(RA_g,_RA_a),
   true.
   %feature_construction(_RA_a,_FS_g,_INFO_g,_GS_g,RA_f),
   %define_plan_clusters(FRE_f,FRE_sk).


% Segunda versao (explicacao e generalizacao num so passo) :

learn_from_episode(FRE_c) %% learns and asserts a failure recovery schema
:- define_fr_schema(FRE_c,[FailedOpTempl,FailDiagTempl,Plan_sk]),
   assert(fr_schema(FailedOpTempl,FailDiagTempl,Plan_sk)).

define_fr_schema(FRE_c,FRE_sk)
:- explain_general_fr_episode(FRE_c,_,_,_,_,FRE_g,INFO_g,_,FS_g,GS_g),
   criticize_over_generalization(FRE_c,FRE_g),
   abstract_episode(FRE_g,FRE_a),!,
   feature_construction(FRE_a,FS_g,INFO_g,GS_g,FRE_f),
write(FRE_f),nl,
   define_plan_clusters(FRE_f,FRE_sk).

%derive_failure_state(INFO_g,IS_g,FRE_g,FS_g)
%:- 

% Na primeira versao (explicacao e generalizacao em dois
% passos separados):

epskeleton(Id,Episode_sk)
:- time( ( failure_episode(Id,Episode), 
           define_episode_skeleton(Episode,Episode_sk)) ).

define_episode_skeleton(Episode,Episode_sk)
:- generalize_episode(Episode,FS_g,Info_g,GS_g,Episode_g),
   criticize_over_generalization(Episode,Episode_g),
   abstract_episode(Episode_g,Episode_a),
   feature_construction(Episode_a,FS_g,Info_g,GS_g,Episode_f),!,
   define_plan_clusters(Episode_f,Episode_sk).

%
%  Episode generalization:
%

generalize_episode(Episode,FS_g,Info_g,GS_g,Episode_g)
:- determine_state_before_episode(Episode,IS,Info),
   [Op,Diag,Plan] = Episode,
   variabilize_episode(Op,Op_g,Diag,Diag_g,IS,IS_g,Info,Info_g,Plan,Plan_g),
   initialize_generalization_context,
   prove_episode_effects(Op,Op_g,Diag,Diag_g,IS,IS_g,Info,Info_g,FS,FS_g),
   prove_plan(Plan,Plan_g,Info,Info_g,FS,FS_g,_,GS_g),
   cleanup_generalization_context,
   Episode_g = [Op_g,Diag_g,Plan_g].

determine_state_before_episode([Op,Diag,Plan],IS,Info)
:- instanciate_world_information(Op,[],LI),
   operator_conditions_for_proof(Op,LI,LK,LD,_),
   append_no_bt(LK,LD,PC),
   update_initial_state(PC,[],CS_1,[],IS_1),
   failure_description(Diag,Op,DiagLD,DiagLA),
   update_initial_state(DiagLD,CS_1,CS_2,IS_1,IS_2),
   delete_conditions(CS_2,DiagLD,CS_3),
   add_conditions(CS_3,DiagLA,CS_4),
   determine_initial_state(Plan,CS_4,_,IS_2,IS,LI,Info).

%

variabilize_episode(Op,Op_g,Diag,Diag_g,IS,IS_g,Info,Info_g,Plan,Plan_g)
:- variabilize_term(Op,Op_g),
   variabilize_term(Diag,Diag_g),
   variabilize_list_of_terms(IS,IS_g),
   variabilize_list_of_terms(Info,Info_g),
   variabilize_list_of_terms(Plan,Plan_g).


prove_episode_effects(Op,Op_g,Diag,Diag_g,IS,IS_g,Info,Info_g,FS,FS_g)
:- operator_functionality(Op,LI,LK,LD,_),
   operator_functionality(Op_g,LI_g,LK_g,LD_g,_),
   CS = IS, CS_g = IS_g,
   prove_information_g(CS,Info,LI,CS_g,Info_g,LI_g),
   append_no_bt(LK,LD,LPC),
   append_no_bt(LK_g,LD_g,LPC_g),
   prove_preconditions_g(CS,LPC,CS_g,LPC_g),
   failure_description(Diag,Op,DiagLD,DiagLA),
   failure_description(Diag_g,Op_g,DiagLD_g,DiagLA_g),
   prove_preconditions_g(CS,DiagLD,CS_g,DiagLD_g),
   delete_conditions_g(CS,DiagLD,CS1,CS_g,DiagLD_g,CS1_g),
   add_conditions_g(CS1,DiagLA,FS,CS1_g,DiagLA_g,FS_g).


%%
%% Criticism of over-generalization:
%%

criticize_over_generalization(Episode,Episode_g)
:- collect_symbolic_variables(Episode,Episode_g,VTable),
   criticize_recovery_plan(Episode,Episode_g,VTable).

collect_symbolic_variables(Episode,Episode_g,VTable)
:- Episode = [Diag,Op,_], Episode_g = [Diag_g,Op_g,_],
   Diag =.. [_|DiagArgs], Diag_g =.. [_|DiagArgs_g],
   Op =.. [_|OpArgs], Op_g =.. [_|OpArgs_g],
   append_no_bt(DiagArgs,OpArgs,Args),
   append_no_bt(DiagArgs_g,OpArgs_g,Args_g),
   collect_symbolic_variables(Args,Args_g,[],VTable).

collect_symbolic_variables([],[],VTable,VTable).

collect_symbolic_variables([Arg|Args],[_|Args_g],VTable_1,VTable_2)
:- number(Arg),!,
   collect_symbolic_variables(Args,Args_g,VTable_1,VTable_2).

collect_symbolic_variables([Arg|Args],[Arg_g|Args_g],VTable_1,VTable_2)
:- member_bt([Arg,Arg_g],VTable_1),!,
   collect_symbolic_variables(Args,Args_g,VTable_1,VTable_2).

collect_symbolic_variables([Arg|Args],[Arg_g|Args_g],VTable_1,VTable_2)
:- collect_symbolic_variables(Args,Args_g,[[Arg,Arg_g]|VTable_1],VTable_2).

criticize_recovery_plan([_,_,Plan],[_,_,Plan_g],VTable)
:- criticize_recovery_plan_1(Plan,Plan_g,VTable).

criticize_recovery_plan_1([],[],_).

criticize_recovery_plan_1([Op|Plan],[Op_g|Plan_g],VTable)
:- Op =.. [_|Args], Op_g =.. [_|Args_g],
   criticize_operator_arguments(Args,Args_g,VTable),
   criticize_recovery_plan_1(Plan,Plan_g,VTable).

criticize_operator_arguments([],[],_).

criticize_operator_arguments([Arg|Args],[Arg_g|Args_g],VTable)
:- (number(Arg), !; member_bt([Arg,Arg_g],VTable), !; true),
   criticize_operator_arguments(Args,Args_g,VTable).
   

%%
%% Plan abstraction:
%%

% rule for general robot activity experiences
abstract_episode([Task_g,KeyProps_g,Op_g,Diag_g,Plan_g],[Task_g,KeyProps_g,Op_g,Diag_g,Plan_a])
:- %writeln('\nKeyProps_g'-KeyProps_g),nl,
   abstract_episode_plan(Plan_g,Plan_a).

% rule for failure recovery episodes
abstract_episode([Op_g,Diag_g,Plan_g],[Op_g,Diag_g,Plan_a])
:- abstract_episode_plan(Plan_g,Plan_a).

abstract_episode_plan([],[]).

abstract_episode_plan([Op|Plan],Plan_a_1)
:- %writeln(Op),
   abstract_operator_application(Op,Op_a),    % In: operators_mth.pro
   %writeln(Op_a),
   abstract_episode_plan(Plan,Plan_a),
   append_no_bt(Op_a,Plan_a,Plan_a_1).


%%
%% Feature extraction:
%%

%%%
rm_at_goal_from_throughout(KeyProps_g,NKeyProps_g):-
   bagof(at_start(X), member(at_start(X),KeyProps_g),LAS),
   bagof(throughout(X), member(throughout(X),KeyProps_g),LTO),
   bagof(at_goal(X), member(at_goal(X),KeyProps_g),LAG), !,
      %writeln('LAS'-LAS),
      %writeln('LTO'-LTO),
      %writeln('LAG'-LAG),
   bagof(throughout(X), (member(throughout(X),LTO), \+member(at_goal(X),LAG)), NLTO),
      %writeln('NLTO'-NLTO),
   append(LAS,NLTO,L1),
   append(L1,LAG,NKeyProps_g).

% if no LAG is find
rm_at_goal_from_throughout(KeyProps_g,KeyProps_g).

%%%

rm_throughout_from_at_goal(KeyProps_g,NKeyProps_g):-
   bagof(at_start(X), member(at_start(X),KeyProps_g),LAS),
   bagof(throughout(X), member(throughout(X),KeyProps_g),LTO),
   bagof(at_goal(X), member(at_goal(X),KeyProps_g),LAG), !,
      %writeln('LAS'-LAS),
      %writeln('LTO'-LTO),
      %writeln('LAG'-LAG),
   bagof(at_goal(X), (member(at_goal(X),LAG), \+member(throughout(X),LTO)), NLAG),
      %writeln('NLAG'-NLAG),
   append(LAS,LTO,L1),
   append(L1,NLAG,NKeyProps_g).

% if no LAG is find
rm_throughout_from_at_goal(KeyProps_g,KeyProps_g).
   
%%%

% This rule is for general robot activities
% -- developed for RACE:
feature_construction(RA_a,FS_g,Info_g,GS_g,RA_f)
:- RA_a = [Task_g,KeyProps_g,Op_g,Diag_g,Plan_a,Goal_g],
   get_episode_entities(Task_g,Op_g,Diag_g,EpEnts),
       assert(before_fe(RA_a,EpEnts,Info_g,FS_g,GS_g)),
         %writeln('Goal_g:'-Goal_g),nl,
   get_goal_entities(Goal_g,GoalEnts),
   %rm_repeatitions(GoalEnts,NGoalEnts),
         writeln('GoalEnts:'-GoalEnts),nl,
   strict_reunion(EpEnts,GoalEnts,AllEnts),
         writeln('AllEntsN:'-AllEnts),nl,
   % get_episode_entities in: 
   % -- RACE domain: Models/race_feature_extraction.pl
      %vahid
      % remove coincident 'at_goal' properties from 'throughout' in KeyProps_g
      %rm_at_goal_from_throughout(KeyProps_g,NKeyProps_g),
         %writeln('KeyProps_g'-KeyProps_g),
      %rm_throughout_from_at_goal(KeyProps_g,NKeyProps_g),
         %writeln('NKeyProps_g'-NKeyProps_g),
         writeln('Plan_a'-Plan_a),nl,
   %extract_features(Plan_a,AllEnts,NKeyProps_g,FS_g,Info_g,GS_g,Plan_f),
   extract_features(Plan_a,EpEnts,KeyProps_g,FS_g,Info_g,GS_g,Plan_f),
      %writeln('\nAllEnts'-AllEnts),nl,
      %writeln('\nPlan_f'-Plan_f),nl,
   RA_f = [Task_g,KeyProps_g,Op_g,Diag_g,Plan_f,Goal_g].
   %%vahid
   %union_features(Plan_f,Plan_f2),
   %RA_f = [Task_g,KeyProps_g,Op_g,Diag_g,[Plan_a,Plan_f2]].
%%----------------------------------------------------------
feature_construction_without_goal_entities(RA_a,FS_g,Info_g,GS_g,RA_f)
:- RA_a = [Task_g,KeyProps_g,Op_g,Diag_g,Plan_a,Goal_g],
   get_episode_entities(Task_g,Op_g,Diag_g,EpEnts),
       assert(before_fe(RA_a,EpEnts,Info_g,FS_g,GS_g)),
   get_goal_entities(Goal_g,GoalEnts),
   %rm_repeatitions(GoalEnts,NGoalEnts),
      writeln('GoalEnts:'-GoalEnts),nl,
   strict_reunion(EpEnts,GoalEnts,AllEnts),
      writeln('AllEntsN:'-AllEnts),nl,
   % get_episode_entities in: 
   % -- RACE domain: Models/race_feature_extraction.pl
      %vahid
      % remove coincident 'at_goal' properties from 'throughout' in KeyProps_g
      %rm_at_goal_from_throughout(KeyProps_g,NKeyProps_g),
      %rm_throughout_from_at_goal(KeyProps_g,NKeyProps_g),
         %writeln('KeyProps_g'-KeyProps_g),
         %writeln('NKeyProps_g'-NKeyProps_g),
   %extract_features(Plan_a,AllEnts,NKeyProps_g,FS_g,Info_g,GS_g,Plan_f),
   extract_features(Plan_a,EpEnts,KeyProps_g,FS_g,Info_g,GS_g,Plan_f),
      %writeln('\nAllEnts'-AllEnts),nl,
      %writeln('\nPlan_f'-Plan_f),nl,
   RA_f = [Task_g,KeyProps_g,Op_g,Diag_g,Plan_f,Goal_g].
   %%vahid
   %union_features(Plan_f,Plan_f2),
   %RA_f = [Task_g,KeyProps_g,Op_g,Diag_g,[Plan_a,Plan_f2]].
%%----------------------------------------------------------
% This rule is for failure recovery activities
% using the old assembly domain
%%%%%%%%%% feature_construction(Episode_a,FS_g,Info_g,GS_g,Episode_f)
%%%%%%%%%% :- Episode_a = [Op_g,Diag_g,Plan_a],
%%%%%%%%%%    get_episode_entities(Op_g,Diag_g,FS_g,Info_g,EpEnts),
%%%%%%%%%%    % get_episode_entities in: 
%%%%%%%%%%    % -- assembly domain: Models/feature_extraction.pl
%%%%%%%%%%    %write('Episode entities: '),write(EpEnts),nl,
%%%%%%%%%%    assert(episode_entities(Plan_a,EpEnts,FS_g,Info_g)),  % acho que isto nao serve para nada
%%%%%%%%%%    extract_features(Plan_a,EpEnts,_,FS_g,Info_g,GS_g,Plan_f),
%%%%%%%%%%    Episode_f = [Op_g,Diag_g,Plan_f].


% Extracting features for each abstract plan step:

extract_features([],_,_,_,_,_,[]) :- !.

%%vahid
%extract_features([Step|Plan_a],EpEnts,KeyProps_g,FS_g,Info_g,GS_g,[Step_f|Plan_f])
extract_features([Step|Plan_a],EpEnts,KeyProps_g,FS_g,Info_g,GS_g,[[Step,Step_f]|Plan_f])
:- %writeln(Step-EpEnts),
   extract_step_features(Step,EpEnts,KeyProps_g,FS_g,Info_g,GS_g,Step_f),!,
   % extract_step_features in:
   % -- assembly domain: Models/feature_extraction.pl
   % -- RACE domain: Models/race_feature_extraction.pl
%true.
   extract_features(Plan_a,EpEnts,KeyProps_g,FS_g,Info_g,GS_g,Plan_f).

%%
%% Define plan clusters:
%%

define_plan_clusters([Op_g,Diag_g,Plan_f],[Op_g,Diag_g,Plan_c])
:- get_all_episode_variables(Op_g,Diag_g,EpVars),
   find_patterns(Plan_f,EpVars,Plan_p),
   cluster_patterns(Plan_p,EpVars,Plan_c).

%

get_all_episode_variables(Op_g,Diag_g,EpVars)
:- Op_g =.. [_|OpVars],
   Diag_g =.. [_|DiagVars],
   strict_reunion(OpVars,DiagVars,EpVars).


%%
%% Find plan patterns:
%%

find_patterns(Plan,LV,Patterns)
:- list_length(Plan,N), 
   find_patterns(Plan,LV,N,Patterns).

%

find_patterns(Plan,_,N,Plan)
:- N < 4.

find_patterns(Plan,LV,N,Patterns)
:- find_patterns(Plan,LV,N,2,Pat1,Tail),
   find_patterns(Tail,LV,Pat2),
   append_no_bt(Pat1,Pat2,Patterns).

find_patterns([Step|Plan],LV,N,[Step|Patterns])
:- N1 is N-1,
   find_patterns(Plan,LV,N1,Patterns).

%

%find_patterns(Plan,LV,N,K,[[Pat1,Pat2|Pat3]],Tail3)
%:- get_1st_N_steps(Plan,K,Pat1,Tail1),
%   get_1st_N_steps(Tail1,K,Pat2,Tail2),
%   same_pattern(Pat1,Pat2,LV),
%   find_pattern_repeatitions(Pat1,LV,K,Tail2,Pat3,Tail3).

find_patterns(Plan,LV,_,K,[[PatR1_m,PatR2_m|LPatR_m]],Tail3)
:- get_1st_N_steps(Plan,K,PatR1,Tail1),
   get_1st_N_steps(Tail1,K,PatR2,Tail2),
   same_pattern(PatR1,PatR2,LV),
   merge_pattern_repetition(PatR1,PatR1_m),
   merge_pattern_repetition(PatR2,PatR2_m),
   find_pattern_repeatitions(PatR1,LV,K,Tail2,LPatR_m,Tail3).

find_patterns(Plan,LV,N,K,Pattern,Tail)
:- K1 is K+1, 2*K1 < N,
   find_patterns(Plan,LV,N,K1,Pattern,Tail).

%

find_pattern_repeatitions(PatternR,LV,N,Plan,[PatR_m|Patterns_m],Tail2)
:- get_1st_N_steps(Plan,N,PatR,Tail1),
   same_pattern(PatternR,PatR,LV),
   merge_pattern_repetition(PatR,PatR_m),
   find_pattern_repeatitions(PatternR,LV,N,Tail1,Patterns_m,Tail2).

find_pattern_repeatitions(_,_,_,Plan,[],Plan).

%

merge_pattern_repetition([[Op,LF]],[[Op],LF]).

merge_pattern_repetition([[Op,LF_1]|Pat],[[Op|LOp],LF_3])
:- merge_pattern_repetition(Pat,[LOp,LF_2]),
   strict_reunion(LF_1,LF_2,LF_3),!.

%

same_pattern(Pat1,Pat2,LV)
:- same_pattern(Pat1,[0,[]],Pat2,[0,[]],LV).

same_pattern([],_,[],_,_).
same_pattern([[S1,_]|P1],VTab1,[[S2,_]|P2],VTab2,LV)
:- S1 =.. [X|LV1], S2 =.. [X|LV2], !,
   same_variables(LV1,VTab1,VTab1_ud,LV2,VTab2,VTab2_ud,LV),
   same_pattern(P1,VTab1_ud,P2,VTab2_ud,LV).

same_variables([],VTab1,VTab1,[],VTab2,VTab2,_)
:- !.

same_variables([V1|LV1],VTab1,VTab1_ud,[V2|LV2],VTab2,VTab2_ud,LV)
:- strict_member(V1,LV), !, 
   V2 == V1,
   same_variables(LV1,VTab1,VTab1_ud,LV2,VTab2,VTab2_ud,LV).

same_variables([_|_],_,_,[V2|_],_,_,LV)
:- strict_member(V2,LV), !, fail.

same_variables([V1|LV1],VTab1,VTab1_ud,[V2|LV2],VTab2,VTab2_ud,LV)
:- get_variable(V1,VTab1,N), !,
   get_variable(V2,VTab2,N),
   %write('variables exist ... '), write(V1), write(' '), write(V2), nl,
   same_variables(LV1,VTab1,VTab1_ud,LV2,VTab2,VTab2_ud,LV).

same_variables([_|_],_,_,[V2|_],VTab2,_,_)
:- get_variable(V2,VTab2,_), !, fail.

same_variables([V1|LV1],VTab1,VTab1_2,[V2|LV2],VTab2,VTab2_2,LV)
:- add_variable(V1,VTab1,VTab1_ud),
   add_variable(V2,VTab2,VTab2_ud), !,
   %write('adding ... '), write(V1), write(' '), write(V2), nl,
   same_variables(LV1,VTab1_ud,VTab1_2,LV2,VTab2_ud,VTab2_2,LV).

%same_variables([A,B,A,C,B,D,D],[0,[]],VTab1,[X,Y,X,Z,Y,T,T],[0,[]],VTab2,[]).
%same_variables([],[1,[[1,A]]],VTab1,[],[1,[[1,X]]],VTab2,[]).
%same_variables([A],[0,[]],VTab1,[X],[0,[]],VTab2,[]).

get_variable(V,[_,VTab],N)
:- get_variable_1(V,VTab,N), !.

get_variable_1(V1,[[N,V2]|_],N)
:- V1 == V2, !.

get_variable_1(V,[_|VTab],N)
:- get_variable_1(V,VTab,N). 

add_variable(V,[M,VTab],[N,[[N,V]|VTab]])
:- N is M+1.

%

get_1st_N_steps(Plan,0,[],Plan).

get_1st_N_steps([Step|Plan],N,[Step|Pattern],Tail)
:- K is N-1,
   get_1st_N_steps(Plan,K,Pattern,Tail).


%%
%% cluster patterns:
%%

%  cluster_patterns(Plan_p,EpVars,Plan_c).

cluster_patterns([],_,[]).

cluster_patterns([PatternRep|Plan_1],EpVars,[Cluster|Plan_2])
:- is_a_pattern_repitition(PatternRep), !,
   cluster_pattern_repitition(PatternRep,EpVars,Cluster),
   cluster_patterns(Plan_1,EpVars,Plan_2).

cluster_patterns([Step|Plan_1],EpVars,[Step|Plan_2])
:- cluster_patterns(Plan_1,EpVars,Plan_2).

%

is_a_pattern_repitition([[[_,_]|_]|_]).

%

cluster_pattern_repitition(PatR,_,Cluster)
:- uniformize_pattern_variables(PatR),
   build_starting_cluster(PatR,Cluster).

uniformize_pattern_variables([[LOp,_]|PatR])
:- uniformize_pattern_variables(LOp,PatR).

%

uniformize_pattern_variables(_,[]).

uniformize_pattern_variables(LOp,[[LOp,_]|PatR])
:- uniformize_pattern_variables(LOp,PatR).

%

build_starting_cluster([[LOp,LF]],[LOp,LF]).

build_starting_cluster([[LOp,LF_1]|PatR],[LOp,LF_3])
:- build_starting_cluster(PatR,[LOp,LF_2]),
   strict_intersection(LF_1,LF_2,LF_3).

%%
%%
%%

