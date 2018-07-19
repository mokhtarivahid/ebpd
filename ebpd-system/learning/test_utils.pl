

learn(EpisodeId,FR_SCHEMA)
:- robot_activity_experience(EpisodeId,_,RAEX_c),
   define_ra_schema(RAEX_c,FR_SCHEMA).    % not yet implemented

test_ebl(EpisodeId,RAEX_g,INFO_g,FS_g,GS_g)
:- robot_activity_experience(EpisodeId,_,RAEX_c),
   explain_general_ra_experience(RAEX_c,_,_,_,_,RAEX_g,INFO_g,_,FS_g,GS_g,Map),
   %criticize_over_generalization(FRE_c,FRE_g),
        [_Task_g,_KeyProps_g,_FO_g,_FD_g,_Plan_g] = RAEX_g,
        %print('Task:'), writeln(_Task_g),
        %print('KP:  '), writeln(_KeyProps_g), 
        %print('FO:  '), writeln(_FO_g), 
        %print('FD:  '), writeln(_FD_g), 
        %print('Plan:'), writeln(_Plan_g), 
        %print('Info:'), writeln(INFO_g), 
        %print('FS:  '), writeln(FS_g), 
        %print('GS:  '), writeln(GS_g),
        %length(Map,Len), writeln(map-Len),
        print('\nMap: '), writeln(Map).



test_abstraction(EpisodeId,RAEX_g,INFO_g,FS_g,GS_g,RAEX_ag)
:- test_ebl(EpisodeId,RAEX_g,INFO_g,FS_g,GS_g),
   abstract_episode(RAEX_g,RAEX_a),
   goal_extraction(RAEX_a,RAEX_ag),
   true.

   %    RAEX_a = [_,_,_,_,Plan_a],
   %    print('Plan_a: '), writeln(Plan_a).

   %[Task_g,KeyProps_g,_,_,Plan_g,Goal_g] = RAEX_ag,
       %writeln('Task_g'-Task_g),
       %writeln('KeyProps_g'-KeyProps_g), 
       %writeln('Plan_g'-Plan_g), 
       %writeln('Goal_g'-Goal_g).

%%-----------------------------------------------------------------------------
%% print information for existing experience episodes 
show_episodes_serve_coffee:-
    findall(E, (robot_activity_experience(E,T,_), sub_string(T,_,_,_,'serve')), Episodes),
    ansi_format([bold,fg(green)], '~nserve_coffee experiences: ~w', [Episodes]).

show_episodes_clear_table:-
    findall(E, (robot_activity_experience(E,T,_), sub_string(T,_,_,_,'clear_table')), Episodes),
    ansi_format([bold,fg(green)], '~nclear_table experiences: ~w', [Episodes]).

show_episodes:-
    findall([E-T], (robot_activity_experience(E,T,_)), Episodes),
    ansi_format([bold,fg(green)], '~nall experiences: ~w', [Episodes]).
%%
conceptualize(EpisodeId):-
    test_feature_extraction(EpisodeId,_,_,_,_,_,_).
%%-----------------------------------------------------------------------------

%%
test_feature_extraction(EpisodeId,RAEX_g,INFO_g,FS_g,GS_g,RAEX_a,RAEX_f)
:- test_abstraction(EpisodeId,RAEX_g,INFO_g,FS_g,GS_g,RAEX_a),
   assert(before_fe(RAEX_g,INFO_g,FS_g,GS_g,RAEX_a)),
   feature_construction(RAEX_a,FS_g,INFO_g,GS_g,RAEX_f),
        [Task_g,_KeyProps_g,_FO_g,_FD_g,Plan_f,Goal_g] = RAEX_f,
        %[Task_g,_KeyProps_g,_FO_g,_FD_g,[Plan_g,Features]] = RAEX_f,
        %print('------------------------\nTask:'), writeln(Task_g), 
        %print('------------------------\nFO:  '), writeln(_FO_g), 
        %print('------------------------\nFD:  '), writeln(_FD_g), 
        %print('------------------------\nInfo:'), writeln(INFO_g), 
        %print('------------------------\nFS:  '), writeln(FS_g), 
        %print('------------------------\nGS:  '), writeln(GS_g),
        %print('------------------------\nKP:  '), writeln(_KeyProps_g), 
        %print('------------------------\nPlan_f:'), writeln(Plan_f),
        %print('------------------------\nPlan_g:'), writeln(Plan_g),
        %print('------------------------\nGoal_g:'), writeln(Goal_g),

        print('------------------------\n'), 
        ansi_format([bold,fg(blue)], '~nTask:~w~n', [Task_g]),
        print('------------------------\n'), 
        ansi_format([bold,fg(yellow)], '~nGoal:~w~n', [Goal_g]),
        print('------------------------\n'), 

        % working directory should be either 'race_activity_schema' or 'prolog'
        %write_list_to_file('MyExamples/activity_schemata',[Task_g,Plan_f]).
        %vahid
        %split(Plan_f,Plan,Features),
        %append(Features,AFeatures),
        %union_features(Features,UnionFeatures),
        %write_list_to_file('MyExamples/activity_schemata',Task_g,Plan_f),
        %write_list_to_file('MyExamples/activity_schemata2',Task_g,Plan,AFeatures),

        %%---- loop detection starts
        order_features(Plan_f, OPlan_f),
        create_map(OPlan_f, MapPlan_f), 
        ansi_format([bold,fg(yellow)], '~n~w', [OPlan_f]),
        %ansi_format([bold,fg(yellow)], '~n~w', [MapPlan_f]), 

        ActionsSymbols=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'],
        FeatursSymbols=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'],
        ActionsMap=[],
        FeaturesMap=[],
        %ansi_format([bold,fg(red)], '~n~w', [ActionsSymbols]),
        %ansi_format([bold,fg(red)], '~n~w', [FeatursSymbols]),

        create_actions_map(MapPlan_f, ActionsSymbols, ActionsMap, FeatursSymbols, FeaturesMap, NMapPlan_f),
        ansi_format([bold,fg(red)], '~n~w', [NMapPlan_f]),

        extract_actions_sequence(NMapPlan_f, Seq),
        ansi_format([bold,fg(red)], '~n~w', [Seq]),

        string_concat('python suffix.py ', Seq, Cmd),
        shell(Cmd,_Stat),
        %ansi_format([bold,fg(red)], '~n~w', [_Stat]),

        retractall(nlcs(_)),
        consult('/tmp/nlcs'),
        nlcs(NLCS),
        ansi_format([bold,fg(blue)], '~n~w', [NLCS]),

        create_looping_plan(OPlan_f, NLCS, Plan_l),
        ansi_format([bold,fg(blue)], '~n~w', [Plan_l]),
        %%---- loop detection ends

        !,

        %% record activity schema into "MyExamples/schema/MONTH" directory
        robot_activity_experience(EpisodeId,_,RAEX_c),
        RAEX_c = [Task_c,_,_,_,_],
        (exists_directory('MyExamples/schema/'),!;make_directory('MyExamples/schema/')),
        get_time(Stamp),
        stamp_date_time(Stamp, _DateTime, local),
        format_time(atom(T), "%d_%b_%y", Stamp),
        format_time(atom(F), "%Y%m%d%H%M%S", Stamp),
        string_concat('MyExamples/schema/',T,D),
        (exists_directory(D),!;make_directory(D)),
        string_concat(D,'/',Dir),
        string_concat(Dir,F,File),
        %%%%%%%% write in pl
        string_concat(File,'.pl',Filename),
        write_activity_schema(Filename,Task_c,Task_g,OPlan_f,Goal_g),
        ansi_format([bold,fg(green)], '~n~w was created', [Filename]),
        %%%%%%%% write in loop.pl
        string_concat(File,'.loop.pl',Filename_loop),
        write_activity_schema(Filename_loop,Task_c,Task_g,Plan_l,Goal_g),
        ansi_format([bold,fg(green)], '~n~w was created', [Filename_loop]),
        %%%%%%%% write in pddl
        string_concat(File,'.pddl',Filename_pddl),
        write_activity_schema_pddl(Filename_pddl,Task_c,Task_g,OPlan_f,Goal_g),
        ansi_format([bold,fg(green)], '~n~w was created', [Filename_pddl]),
        %%%%%%%% write in loop.pddl
        string_concat(File,'.loop.pddl',Filename_pddl_loop),
        write_activity_schema_pddl(Filename_pddl_loop,Task_c,Task_g,Plan_l,Goal_g),
        ansi_format([bold,fg(green)], '~n~w was created', [Filename_pddl_loop]).
        %write_activity_schema('MyExamples/race_activity_schemata.pl',Task_c,Task_g,OPlan_f,Goal_g).

        %[Task_g,[],OPlan_f] = RAEX_p,
        %define_plan_clusters(RAEX_p,RAEX_l),
        %writeln('RAEX_l'-RAEX_l).



%%-----------------------------------------------------------------------------
%%-----------------------------------------------------------------------------
order_features([], []).
order_features([[A,[F1-F2]]|Plan_f], [[A,[OF1-OF2]]|OPlan_f]):-
        term_to_ord_term(F1, OF1),
        term_to_ord_term(F2, OF2),
        order_features(Plan_f, OPlan_f).

%%

%term_to_ord_term(+Term, -OrdTerm)
% Go throught the term and look for sets, return the same term
% with all sets become ordered.
term_to_ord_term(A, A):-var(A), !.
term_to_ord_term([], []):-!.
term_to_ord_term(A, A):-atomic(A), !.
term_to_ord_term([H|T], R):-
                term_to_ord_term(H, OH),
                term_to_ord_term(T, OT),
                 ord_add_element(OT, OH, R), !.
%               write(OH), write(OT), write('   '), write(R), nl.
term_to_ord_term(T, OT):-
                T =.. [F,P], !,
                term_to_ord_term(P, OP),
                OT =..[F,OP].
term_to_ord_term(T, OT):-
                T =.. [F,P|Ps],
                NT=.. [F|Ps],
                term_to_ord_term(P, OP),
                term_to_ord_term(NT, ONT),
                ONT =.. [_|OPs],
                OT =.. [F,OP|OPs], !.

%%-----------------------------------------------------------------------------
%%-----------------------------------------------------------------------------
%% loop detection
%%-----------------------------------------------------------------------------
%%-----------------------------------------------------------------------------
%% transform an abstract plan into a new representation 
%% [[Action,[F1-F2]], ...] --> [[Action, [F1], [ArgsIndices], [[ActionsArgs],[FeaturesArgs]]], ...]
%% e.g., 
%% [unstack(_G776,_G783,_G790),[[at_goal(in(_G776,_G1954)),at_goal(in(_G783,_G1954)),at_goal(top(_G776,_G1954)),at_start(in(_G776,_G790)),at_start(in(_G783,_G790)),at_start(top(_G776,_G790)),throughout(blue(_G776)),throughout(blue(_G783)),throughout(pile(_G790))]-[]]]
%% -->
%% [unstack,[at_goal(in),at_goal(in),at_goal(top),at_start(in),at_start(in),at_start(top),throughout(blue),throughout(blue),throughout(pile)],[1,3,4],[[_G776,_G783,_G790],[_G776,_G1954,_G783,_G790]]] 
%create_map(+Plan_f, -MapPlan_f):-
create_map([], []):- !.
create_map([Step|Plan_f], [Map|MapPlan_f]):-
        list_ordered_args(Step, Map), !,
        create_map(Plan_f, MapPlan_f).

%%%
%% creates a map for actions and features, 
%% ListOrderedArgs is a list of actions args and features args in the form: 
%% [ActionArguments, FeaturesArguments], with no repetition in each one
%list_ordered_args(+Step, -Map)
list_ordered_args([Action,[F-_]], Map):-
        Action=..[A|ArgsA],
        list_features_args_ordered(F,NF,ArgsF),
        create_index(ArgsA,ArgsF,ArgsIdx),
        Map=[A,NF,ArgsIdx,[ArgsA,ArgsF]].
%%
list_features_args_ordered([], [], []).
list_features_args_ordered([F|Features], [NF|NFeatures], NArgs):-
        list_features_args_ordered(Features, NFeatures, Args),
        list_feature_args_ordered(F, NF, A),
        strict_reunion_ordered(A,Args,NArgs).
%%
list_feature_args_ordered(F, NF, A):-
        F =..[T,P],
        P =..[H|A],
        NF=..[T,H].
        %ansi_format([bold,fg(yellow)], '~n~w~n~w~n~w~n~w~n', [T,H,A,NF]).
%%
%% reruen a list of indices of action args in features args
%create_index(+ArgsAction,+ArgsFeatures,-ArgsIndex),
create_index([],_,[]).
create_index([A|ArgsA],ArgsF,[I|ArgsIdx]):-
        strict_indexOf(ArgsF, A, I), !,
        create_index(ArgsA,ArgsF,ArgsIdx).

create_index([A|ArgsA],ArgsF,ArgsIdx):-
        ansi_format([bold,fg(red)], '~n>>Error: ~w does not exist in ~w (just skipped).', [A,ArgsF]), !,
        create_index(ArgsA,ArgsF,ArgsIdx).

%%-----------------------------------------------------------------------------

%% creates a map for actions and features in which every action and every 
%% feature are assigned with a symbol (i.e., a unique character, cpaital for 
%% actions and small for features)

%%%%ORG%%%%create_actions_map(+Plan,+ActionsSymbols,+ActionsMap, +FeatursSymbols, +FeaturesMap,-PlanMap):-
%%%%ORG%%%create_actions_map([],_,_,_,_,[]).
%%%%ORG%%%create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
%%%%ORG%%%        Step=[Action,Features,ArgsIndices,Args],
%%%%ORG%%%        member_no_bt((Action,AS), ActionsMap),
%%%%ORG%%%        member_no_bt((Features,ArgsIndices,FS), FeaturesMap), !,
%%%%ORG%%%        StepMap=[(Action,AS),(Features,ArgsIndices,FS),ArgsIndices,Args],
%%%%ORG%%%        %writeln('StepMap'-StepMap),
%%%%ORG%%%        %writeln('ActionsMap'-ActionsMap),
%%%%ORG%%%        create_actions_map(Plan,ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,PlanMap).
%%%%ORG%%%
%%%%ORG%%%create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
%%%%ORG%%%        Step=[Action,Features,ArgsIndices,Args],
%%%%ORG%%%        \+ member_no_bt((Action,AS), ActionsMap), 
%%%%ORG%%%        member_no_bt((Features,ArgsIndices,FS), FeaturesMap), !,
%%%%ORG%%%        nextSymbol(ActionsSymbols, AS, NActionsSymbols),
%%%%ORG%%%        StepMap=[(Action,AS),(Features,ArgsIndices,FS),ArgsIndices,Args],
%%%%ORG%%%        append(ActionsMap, [(Action,AS)], NActionsMap),
%%%%ORG%%%        %writeln('StepMap2'-StepMap),
%%%%ORG%%%        %writeln('ActionsMap2'-NActionsMap),
%%%%ORG%%%        create_actions_map(Plan,NActionsSymbols,NActionsMap,FeatursSymbols,FeaturesMap,PlanMap).
%%%%ORG%%%
%%%%ORG%%%create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
%%%%ORG%%%        Step=[Action,Features,ArgsIndices,Args],
%%%%ORG%%%        member_no_bt((Action,AS), ActionsMap), 
%%%%ORG%%%        \+ member_no_bt((Features,ArgsIndices,FS), FeaturesMap), !,
%%%%ORG%%%        nextSymbol(FeatursSymbols, FS, NFeatursSymbols),
%%%%ORG%%%        StepMap=[(Action,AS),(Features,ArgsIndices,FS),ArgsIndices,Args],
%%%%ORG%%%        append(FeaturesMap, [(Features,ArgsIndices,FS)], NFeaturesMap),
%%%%ORG%%%        %writeln('StepMap2'-StepMap),
%%%%ORG%%%        %writeln('ActionsMap2'-NActionsMap),
%%%%ORG%%%        create_actions_map(Plan,ActionsSymbols,ActionsMap,NFeatursSymbols,NFeaturesMap,PlanMap).
%%%%ORG%%%
%%%%ORG%%%create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
%%%%ORG%%%        Step=[Action,Features,ArgsIndices,Args],
%%%%ORG%%%        nextSymbol(ActionsSymbols, AS, NActionsSymbols),
%%%%ORG%%%        nextSymbol(FeatursSymbols, FS, NFeatursSymbols),
%%%%ORG%%%        StepMap=[(Action,AS),(Features,ArgsIndices,FS),ArgsIndices,Args],
%%%%ORG%%%        append(ActionsMap, [(Action,AS)], NActionsMap),
%%%%ORG%%%        append(FeaturesMap, [(Features,ArgsIndices,FS)], NFeaturesMap),
%%%%ORG%%%        %writeln('StepMap2'-StepMap),
%%%%ORG%%%        %writeln('ActionsMap2'-NActionsMap),
%%%%ORG%%%        create_actions_map(Plan,NActionsSymbols,NActionsMap,NFeatursSymbols,NFeaturesMap,PlanMap).

%%%%%%create_actions_map(+Plan,+ActionsSymbols,+ActionsMap, +FeatursSymbols, +FeaturesMap,-PlanMap):-
%%%%%create_actions_map([],_,_,_,_,[]).
%%%%%create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
%%%%%        Step=[Action,Features,ArgsIndices,[_,Args]],
%%%%%        member_no_bt((Action,AS), ActionsMap),
%%%%%        member_no_bt((Features,Args,FS), FeaturesMap), !,
%%%%%        StepMap=[(Action,AS),(Features,Args,FS),ArgsIndices,Args],
%%%%%        %writeln('StepMap'-StepMap),
%%%%%        %writeln('ActionsMap'-ActionsMap),
%%%%%        create_actions_map(Plan,ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,PlanMap).
%%%%%
%%%%%create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
%%%%%        Step=[Action,Features,ArgsIndices,[_,Args]],
%%%%%        \+ member_no_bt((Action,AS), ActionsMap), 
%%%%%        member_no_bt((Features,Args,FS), FeaturesMap), !,
%%%%%        nextSymbol(ActionsSymbols, AS, NActionsSymbols),
%%%%%        StepMap=[(Action,AS),(Features,Args,FS),ArgsIndices,Args],
%%%%%        append(ActionsMap, [(Action,AS)], NActionsMap),
%%%%%        %writeln('StepMap2'-StepMap),
%%%%%        %writeln('ActionsMap2'-NActionsMap),
%%%%%        create_actions_map(Plan,NActionsSymbols,NActionsMap,FeatursSymbols,FeaturesMap,PlanMap).
%%%%%
%%%%%create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
%%%%%        Step=[Action,Features,ArgsIndices,[_,Args]],
%%%%%        member_no_bt((Action,AS), ActionsMap), 
%%%%%        \+ member_no_bt((Features,Args,FS), FeaturesMap), !,
%%%%%        nextSymbol(FeatursSymbols, FS, NFeatursSymbols),
%%%%%        StepMap=[(Action,AS),(Features,Args,FS),ArgsIndices,Args],
%%%%%        append(FeaturesMap, [(Features,Args,FS)], NFeaturesMap),
%%%%%        %writeln('StepMap2'-StepMap),
%%%%%        %writeln('ActionsMap2'-NActionsMap),
%%%%%        create_actions_map(Plan,ActionsSymbols,ActionsMap,NFeatursSymbols,NFeaturesMap,PlanMap).
%%%%%
%%%%%create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
%%%%%        Step=[Action,Features,ArgsIndices,[_,Args]],
%%%%%        nextSymbol(ActionsSymbols, AS, NActionsSymbols),
%%%%%        nextSymbol(FeatursSymbols, FS, NFeatursSymbols),
%%%%%        StepMap=[(Action,AS),(Features,Args,FS),ArgsIndices,Args],
%%%%%        append(ActionsMap, [(Action,AS)], NActionsMap),
%%%%%        append(FeaturesMap, [(Features,Args,FS)], NFeaturesMap),
%%%%%        %writeln('StepMap2'-StepMap),
%%%%%        %writeln('ActionsMap2'-NActionsMap),
%%%%%        create_actions_map(Plan,NActionsSymbols,NActionsMap,NFeatursSymbols,NFeaturesMap,PlanMap).

%create_actions_map(+Plan,+ActionsSymbols,+ActionsMap, +FeatursSymbols, +FeaturesMap,-PlanMap):-
create_actions_map([],_,_,_,_,[]).
create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
        Step=[Action,Features,ArgsIndices,Args],
        member_no_bt((Action,AS), ActionsMap),
        member_no_bt((Features,_,FS), FeaturesMap), !,
        StepMap=[(Action,AS),(Features,_,FS),ArgsIndices,Args],
        %writeln('StepMap'-StepMap),
        %writeln('ActionsMap'-ActionsMap),
        create_actions_map(Plan,ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,PlanMap).

create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
        Step=[Action,Features,ArgsIndices,Args],
        \+ member_no_bt((Action,AS), ActionsMap), 
        member_no_bt((Features,_,FS), FeaturesMap), !,
        nextSymbol(ActionsSymbols, AS, NActionsSymbols),
        StepMap=[(Action,AS),(Features,_,FS),ArgsIndices,Args],
        append(ActionsMap, [(Action,AS)], NActionsMap),
        %writeln('StepMap2'-StepMap),
        %writeln('ActionsMap2'-NActionsMap),
        create_actions_map(Plan,NActionsSymbols,NActionsMap,FeatursSymbols,FeaturesMap,PlanMap).

create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
        Step=[Action,Features,ArgsIndices,Args],
        member_no_bt((Action,AS), ActionsMap), 
        \+ member_no_bt((Features,_,FS), FeaturesMap), !,
        nextSymbol(FeatursSymbols, FS, NFeatursSymbols),
        StepMap=[(Action,AS),(Features,_,FS),ArgsIndices,Args],
        append(FeaturesMap, [(Features,_,FS)], NFeaturesMap),
        %writeln('StepMap2'-StepMap),
        %writeln('ActionsMap2'-NActionsMap),
        create_actions_map(Plan,ActionsSymbols,ActionsMap,NFeatursSymbols,NFeaturesMap,PlanMap).

create_actions_map([Step|Plan],ActionsSymbols,ActionsMap,FeatursSymbols,FeaturesMap,[StepMap|PlanMap]):-
        Step=[Action,Features,ArgsIndices,Args],
        nextSymbol(ActionsSymbols, AS, NActionsSymbols),
        nextSymbol(FeatursSymbols, FS, NFeatursSymbols),
        StepMap=[(Action,AS),(Features,_,FS),ArgsIndices,Args],
        append(ActionsMap, [(Action,AS)], NActionsMap),
        append(FeaturesMap, [(Features,_,FS)], NFeaturesMap),
        %writeln('StepMap2'-StepMap),
        %writeln('ActionsMap2'-NActionsMap),
        create_actions_map(Plan,NActionsSymbols,NActionsMap,NFeatursSymbols,NFeaturesMap,PlanMap).

%%
nextSymbol([], _, []):-
        ansi_format([bold,fg(red)], '~n>>Error: no more symbols exists.', []), !.
nextSymbol([S|Symbols], S, Symbols).

%%-----------------------------------------------------------------------------
%extract_actions_sequence(+MapPlan, -Seq):-
extract_actions_sequence([], '').
extract_actions_sequence([StepMap|Plan], Seq):-
        extract_actions_sequence(Plan, LS),
        StepMap=[(_,AS),(_,_,FS),_,_],
        string_concat(AS,FS,S),
        string_concat(S,LS,Seq).

%%-----------------------------------------------------------------------------

%create_looping_plan(+Plan_f, +NLCS, -Plan_l)
create_looping_plan([], [], []).
create_looping_plan([Step|Plan_f], [N|NLCS], [Step|Plan_l]):-
        N=[keep, []], !,
        create_looping_plan(Plan_f, NLCS, Plan_l).
create_looping_plan([_|Plan_f], [N|NLCS], Plan_l):-
        N=[skip, []], !,
        create_looping_plan(Plan_f, NLCS, Plan_l).
create_looping_plan([Step|Plan_f], [N|NLCS], [[Step]|Plan_l]):-
        N=[loop, [open, close]], !,
        create_looping_plan(Plan_f, NLCS, Plan_l).
create_looping_plan(Plan_f, [N|NLCS], [Loop|Plan_l]):-
        N=[loop, [open]], !,
        create_long_loop(Plan_f, [N|NLCS], Loop, NPlan_f, NNLCS),
        create_looping_plan(NPlan_f, NNLCS, Plan_l).

create_long_loop([Step|Plan_f], [N|NLCS], [Step], Plan_f, NLCS):-
        N=[loop, [close]], 
        !.
create_long_loop([Step|Plan_f], [N|NLCS], [Step|Loop], NPlan_f, NNLCS):-
        N=[loop, [open]], !,
        create_long_loop(Plan_f, NLCS, Loop, NPlan_f, NNLCS).
create_long_loop([Step|Plan_f], [N|NLCS], [Step|Loop], NPlan_f, NNLCS):-
        N=[loop, []], !,
        create_long_loop(Plan_f, NLCS, Loop, NPlan_f, NNLCS).


%%-----------------------------------------------------------------------------
%%-----------------------------------------------------------------------------
%%-----------------------------------------------------------------------------
%%-----------------------------------------------------------------------------

%% without goal entities and without upgrading keyprops with at_goal
test_abstraction_without_goal_entities(EpisodeId,RAEX_g,INFO_g,FS_g,GS_g,RAEX_ag)
:- test_ebl(EpisodeId,RAEX_g,INFO_g,FS_g,GS_g),
   abstract_episode(RAEX_g,RAEX_a),
   goal_extraction_without_up_keyprops(RAEX_a,RAEX_ag),
   true.

   %    RAEX_a = [_,_,_,_,Plan_a],
   %    print('Plan_a: '), writeln(Plan_a).

   %[Task_g,KeyProps_g,_,_,Plan_g,Goal_g] = RAEX_ag,
       %writeln('Task_g'-Task_g),
       %writeln('KeyProps_g'-KeyProps_g), 
       %writeln('Plan_g'-Plan_g), 
       %writeln('Goal_g'-Goal_g).

%% without goal entities and without upgrading keyprops with at_goal
test_feature_extraction_without_goal_entities(EpisodeId,RAEX_g,INFO_g,FS_g,GS_g,RAEX_a,RAEX_f)
:- test_abstraction_without_goal_entities(EpisodeId,RAEX_g,INFO_g,FS_g,GS_g,RAEX_a),
   assert(before_fe(RAEX_g,INFO_g,FS_g,GS_g,RAEX_a)),
   feature_construction_without_goal_entities(RAEX_a,FS_g,INFO_g,GS_g,RAEX_f),
        [Task_g,_KeyProps_g,_FO_g,_FD_g,Plan_f,Goal_g] = RAEX_f,
        %[Task_g,_KeyProps_g,_FO_g,_FD_g,[Plan_g,Features]] = RAEX_f,
        print('------------------------\nTask:'), writeln(Task_g), 
        %print('------------------------\nFO:  '), writeln(_FO_g), 
        %print('------------------------\nFD:  '), writeln(_FD_g), 
        %print('------------------------\nInfo:'), writeln(INFO_g), 
        %print('------------------------\nFS:  '), writeln(FS_g), 
        %print('------------------------\nGS:  '), writeln(GS_g),
        %print('------------------------\nKP:  '), writeln(_KeyProps_g), 
        %print('------------------------\nPlan_f:'), writeln(Plan_f),
        %print('------------------------\nPlan_g:'), writeln(Plan_g),
        print('------------------------\nGoal_g:'), writeln(Goal_g),
        % working directory should be either 'race_activity_schema' or 'prolog'
        %write_list_to_file('MyExamples/activity_schemata',[Task_g,Plan_f]).
        %vahid
        %split(Plan_f,Plan,Features),
        %append(Features,AFeatures),
        %union_features(Features,UnionFeatures),
        %write_list_to_file('MyExamples/activity_schemata',Task_g,Plan_f),
        %write_list_to_file('MyExamples/activity_schemata2',Task_g,Plan,AFeatures),

        %% record activity schema into "MyExamples/schema/MONTH" directory
        robot_activity_experience(EpisodeId,_,RAEX_c),
        RAEX_c = [Task_c,_,_,_,_],
        (exists_directory('MyExamples/schema/'),!;make_directory('MyExamples/schema/')),
        get_time(Stamp),
        stamp_date_time(Stamp, _DateTime, local),
        format_time(atom(T), "%d_%b_%y", Stamp),
        format_time(atom(F), "%Y%m%d%H%M%S", Stamp),
        string_concat('MyExamples/schema/',T,D),
        (exists_directory(D),!;make_directory(D)),
        string_concat(D,'/',Dir),
        string_concat(Dir,F,File),
        string_concat(File,'.pl',Filename),
        write_activity_schema(Filename,Task_c,Task_g,Plan_f,Goal_g).
        %write_activity_schema('MyExamples/race_activity_schemata.pl',Task_c,Task_g,Plan_f,Goal_g).

        %[Task_g,[],Plan_f] = RAEX_p,
        %define_plan_clusters(RAEX_p,RAEX_l),
        %writeln('RAEX_l'-RAEX_l).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Old utilities:

learn(EpisodeId)
:- failure_episode(EpisodeId,_,FRE_c),
   learn_from_episode(FRE_c).

get_state_before_failure(EpisodeId,SBF)
:- initial_state(IS),
   plan_before_failure(EpisodeId,_,Plan),
   simulate_plan(Plan,IS,SBF).

gather_info(EpisodeId, Problem, FailedOp, FailureDiag, SBF)
:- get_state_before_failure(EpisodeId,SBF),
   failure_situation(EpisodeId, Problem, FailureDiag, FailedOp).

failrecplan(EpisodeId,Plan)
:- gather_info(EpisodeId, Problem, FailedOp, FailureDiag, SBF),
   failure_recovery_planning(Problem, FailedOp, FailureDiag, SBF, Plan).

prepabstplan(EpisodeId,AFS,ALG,Plan_sk)
:- gather_info(EpisodeId, Prob, Op, Diag, SBF),
   prepare_abstract_planning(Prob,Op,Diag,SBF, _FS,_LG,AFS,ALG,Plan_sk).

abstplan(EpisodeId,AFS,ALG,APlan)
:- gather_info(EpisodeId, Prob, Op, Diag, SBF),
   prepare_abstract_planning(Prob,Op,Diag,SBF, _FS,_LG,AFS,ALG,Plan_sk),
   abstract_planning(AFS,ALG,Plan_sk,APlan).


%% For detailed_planning step-by-step:
%%

prepdetailplan(EpisodeId, AFS,ALG,APlan)
:- planning_gc,
   gather_info(EpisodeId, Prob, Op, Diag, SBF),
   prepare_abstract_planning(Prob,Op,Diag,SBF, FS,LG,AFS,ALG,Plan_sk),
   abstract_planning(AFS,ALG,Plan_sk,APlan),
   initialize_detailed_planning(Prob,FS,APlan,LG).

pli(Id,LF)
:- find_best_abo(Id,_,_,_,_), !,
   planning_iteration(Id),
   lista_filhos(Id,LF).

%%%%%

clean_test
:- retract_all(plan_before_failure(_,_,_)),
   retract_all(failure_situation(_,_,_,_)),
   retract_all(failure_episode(_,_,_,_,_)).



print_list2([])
:- nl.

print_list2([H|T])
:- writeln(H),
   print_list2(T).



generate_end_state(Prob,Plan,EndState)
:- initial_state(IS),
   simulate_plan_bd(Prob,Plan,IS,EndState).

%% 




%% for statistics:

search_stat
:- findall(Id,no(_,Id,_,_,_,_),L6), length(L6,NN6),
   write('Number of no/6 = '), writeln(NN6),
   findall(Id,no(closed,Id,_,_,_,_),L6c), length(L6c,NN6c),
   write('Number of no/6 closed = '), writeln(NN6c),
   findall(Id,nod(_,Id),L2), length(L2,NN2),
   write('Number of nod/2 = '), writeln(NN2),
   findall(Id,nod(closed,Id),L2c), length(L2c,NN2c),
   write('Number of nod/2 closed = '), writeln(NN2c).


%%%%%%%%%%%%%


%%

draw_search_tree(Tol)
:- mark_nodes2draw(Tol),
   draw_search_tree(0,2).

draw_search_tree([],_)
:- !.

draw_search_tree([F|LF],Indent)
:- !, draw_search_tree(F,Indent),
   draw_search_tree(LF,Indent).

draw_search_tree(Id,Indent)
:- clause(node2draw(Id),true), !,
   espacos(Indent),
   no(OC,Id,_,Op,G,H),
   write([Id/OC]), write(' '), writeln(Op : G + H),
   NewIndent is Indent+1,
   lista_filhos(Id,LFilhos),
   draw_search_tree(LFilhos,NewIndent).

draw_search_tree(_,_).



%%%
%%% Print the part of the search tree with leaf nodes having
%%% G+H costs lower than the minimum cost + a tolerance
%%%

mark_nodes2draw(Tol)
:- no(open,Id,_,_,G,H), F is G+H,
   \+ ( no(open,X,_,_,A,B), X \= Id, C is A+B, C<F ), !,
   retractall(node2draw(_)),
   mark_nodes2draw(0,F,Tol,_).


mark_nodes2draw([],_,_,nodraw)
:- !.

mark_nodes2draw([F|LF],MinF,Tol,Draw)
:- mark_nodes2draw(F,MinF,Tol,Draw1),
   mark_nodes2draw(LF,MinF,Tol,Draw2), !,
   ( Draw1 = draw, Draw = draw;
     Draw2 = draw, Draw = draw;
     Draw = nodraw ).


mark_nodes2draw(Id,MinF,Tol,Draw)
:- no(open,Id,_,_,G,H),
   ( G+H < MinF+Tol, !, Draw = draw, assert(node2draw(Id));
     Draw = nodraw ).

mark_nodes2draw(Id,MinF,Tol,Draw)
:- no(closed,Id,_,_,_,_),
   lista_filhos(Id,LFilhos),
   mark_nodes2draw(LFilhos,MinF,Tol,Draw), !,
   ( Draw = draw, !, assert(node2draw(Id)); true ).


%%%%  New utilities for RACE:

simulate_applied_plan(EndState)
:- initial_state(IS),
   applied_plan(P),
   initial_to_goal_state(P,IS,EndState).

