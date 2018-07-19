%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > remove timestamps from key propositions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% to use union predicate
:- use_module(library(lists)).

%% return goal propositions only
get_at_end_props([],[]).
get_at_end_props([K|R],[P|L]):-
    K=..[at_end,P],!,         % only collect at_end
    get_at_end_props(R,L).
get_at_end_props([_|R],L):-
    get_at_end_props(R,L).

%% remove and refine timestamps from key propositions
rm_rf_timestamps([],[]).
rm_rf_timestamps([K|R],L):-
    K=..[at_start|_],!,         % skip at_start
    rm_rf_timestamps(R,L).
rm_rf_timestamps([K|R],L):-
    K=..[_|[P]],
    P=..[instance|_],!,         % skip instance predicates
    rm_rf_timestamps(R,L).
rm_rf_timestamps([K|R],L):-
    K=..[_|[P]],
    P=..[new_constant|_],!,     % skip new_constant
    rm_rf_timestamps(R,L).
rm_rf_timestamps([K|R],[P|L]):-
    K=..[_|[P]],
    rm_rf_timestamps(R,L).

%member_of(+Variable,+VariableList)
member_of(_,[]):- fail, !.
member_of(V,[X|_]):- V==X, !.
member_of(V,[_|Y]):- member_of(V,Y).

%all_member_of(+List1,+List2)
% return true if all members of List1 are members of List2
all_member_of([],_):-!.
all_member_of([X|T],L):-
    strict_member(X,L), !,
    all_member_of(T,L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > infer goal predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%infer_goal(+KeyPropositions, +GivenArgument1, +GivenArgument2, -GoalPredicates)
infer_goal([],_,_,[]):-!.
infer_goal(K,GA1,GA2,G):-
    infer_unary_goal(K,GA1,GA2,G),
    G\=[],!.    %% if there is unary goal, binary goals are not neccessary 
        %writeln('infer_unary_goal'-G).
infer_goal(K,GA1,GA2,G):-
        %writeln('K'-K),nl,
        %writeln('GA1'-GA1),nl,
        %writeln('GA2'-GA2),nl,
    infer_binary_goal(K,GA1,GA2, G).
        %writeln('infer_binary_goal'-G).

% return only one predicate that has two given arguments as its own arguments
infer_unary_goal([],_,_,[]):-!.
infer_unary_goal([K|R],GA1,GA2,[K|R2]):-
    K=..[_|Args],
    L=[GA1,GA2],
    all_member_of(Args,L), !,
    infer_unary_goal(R,GA1,GA2,R2).
infer_unary_goal([_|R],GA1,GA2,K):-
    infer_unary_goal(R,GA1,GA2,K).

% return predicates containing given argument as their own arguments
%get_root_goals(+KeyPropositions, +GivenArgument, -GoalPredicates, -RestOfKeyPropositions)
get_root_goals([],_,[],[]):-!.
get_root_goals([K|R],GA,[K|L],RK):-
    K=..[_|[A1,A2]],
    (A1==GA; A2==GA), !,
    get_root_goals(R,GA,L,RK).
get_root_goals([K|R],GA,L,[K|RK]):-
    get_root_goals(R,GA,L,RK).

% return goal predicates
infer_binary_goal([],_,_,[]):-!.
infer_binary_goal(K,Arg1,Arg2,G):-
    get_root_goals(K,Arg1,NG,R),
        %writeln('NG'-NG),
    member(X,NG),
    %NG=[X|_],
        %writeln('X'-X),
    get_intermediate_arg(X,Arg1,InArg),
    extract_goals(R,InArg,Arg2,[X],G).

%get_intermediate_arg(+Predicate,+Arg1,-Arg2)
get_intermediate_arg(P,Arg1,Arg2):-
    P=..[_|[A1,A2]],!,
    (A1==Arg1,A2=Arg2,!; A2==Arg1,A1=Arg2).

%extract_goals(+KeyPropositions,+IntermediateArg,+GoalArgument,+ListOfGoalPredicates,-NewListOfGoalPredicates)
extract_goals(_,_,_,[],[]):-!.
extract_goals([],_,_,_,[]):-!.
extract_goals(K,A,_,_,[]):- %% to return empty list if there is no goal
    get_root_goals(K,A,L,_),
    \+ member(_,L),!.
extract_goals(K,A,GA,G,NG):-
    get_root_goals(K,A,L,_),
    member(X,L),
    get_intermediate_arg(X,A,NA),
    NA==GA, !,
    append(G,[X],NG).
extract_goals(K,A,GA,G,FG):-
    get_root_goals(K,A,L,R),
    member(X,L),
    append(G,[X],NG),
    get_intermediate_arg(X,A,NA),
    extract_goals(R,NA,GA,NG,FG).

get_shortest_goal([],[]):-!.
get_shortest_goal([H],H):-!.
get_shortest_goal([H,K|T],M) :-
    H=[],K=[],!,
    get_shortest_goal(T,M).
get_shortest_goal([H,K|T],M) :-
    H=[],!,
    get_shortest_goal([K|T],M).
get_shortest_goal([H,K|T],M) :-
    K=[],!,
    get_shortest_goal([H|T],M).
get_shortest_goal([H,K|T],M) :-
    length(H,L1),
    length(K,L2),
    L1 =< L2,!,
    get_shortest_goal([H|T],M).
get_shortest_goal([H,K|T],M) :-
    length(H,L1),
    length(K,L2),
    L1 > L2,
    get_shortest_goal([K|T],M).

%%----------------
% remove paths that do not have 'at_end' timestamps in their paths
%refine_goals(+Goal,-NGoal)
refine_goals([],[]):-!.
refine_goals([H|G],[H|NG]):-
    has_at_end(H),!,
    refine_goals(G,NG).
refine_goals([_|G],NG):-
    refine_goals(G,NG).

% return true if given goal path has at least one 'at_end' timestamps
%has_at_end(+ListOfGoalPredicates)
has_at_end([]):-fail.
has_at_end([H|_]):-
    H=..[at_end|_],!.
has_at_end([_|T]):-
    has_at_end(T).
%%----------------


%infer_goals(+KeyPropositions, +GivenArgumentsList, -GoalPredicates)
infer_goals(_,[],[]):-!.
infer_goals(_,[_],[]):-!.
infer_goals(KP,[X|T],G):-
    infer_goals(KP,X,T,G1),
    infer_goals(KP,T,G2),
    strict_reunion(G1,G2,G).
        %writeln('X'-X),
        %writeln('T'-T),
        %writeln('KP'-KP),
        %writeln('G'-G).

%infer_goals(+KeyPropositions, +GivenArgument, +GivenArgumentsList, -GoalPredicates)
infer_goals(_,_,[],[]):-!.
infer_goals(KP,X,[H|T],G):-
        %writeln('KP'-KP),
    %(bagof(K, (infer_goal(KP,X,H,K),K\=[]), Goal); Goal=[]),
    bagof(K, (infer_goal(KP,X,H,K),K\=[]), Goal), !,
    %findall(K, (infer_goal(KP,X,H,K),K\=[]), Goal),
        %writeln('X'-X), writeln('H'-H),
        %writeln('Goal'-Goal),
    %refine_goals(Goal,NGoal),
        %writeln('NGoal'-NGoal),
    get_shortest_goal(Goal,G1),
        %writeln('G1'-G1),
    infer_goals(KP,X,T,G2),
        %writeln('G2'-G2),
    strict_reunion(G1,G2,G).
        %writeln('FGoal'-Goal).
% if bagof failed
infer_goals(KP,X,[_|T],G):-
    infer_goals(KP,X,T,G2),
    strict_reunion([],G2,G).

%get_goal_entities(+GoalPredicates,-ListOfGoalEntities)
get_goal_entities(Goal,Ents):-
    get_all_goal_entities(Goal,AEnts),
    rm_repeatitions(AEnts,Ents).

get_all_goal_entities([],[]):-!.
get_all_goal_entities([X|T],A):-
    get_goal_entities(T,R),
    X=..[_|Args],
    strict_reunion(Args,R,A).

%%% get_all_goal_entities([],[]):-!.
%%% get_all_goal_entities([X|T],[A1,A2|R]):-
%%%     X=..[_|[A1,A2]],
%%%     get_goal_entities(T,R).

rm_repeatitions([],[]):-!.
rm_repeatitions([X|T],R):-
    strict_member(X,T),!,
    rm_repeatitions(T,R).
rm_repeatitions([X|T],[X|R]):-
    rm_repeatitions(T,R).

%%------------------
%% 11-12-2015
%% extract possible goals between two given lists
%% i.e., first list is the task arguments and second list is the arguments of operators
%infer_goals_ext(+KeyPropositions, +TaskArgumentsList, +AbsOpArgsList, -GoalPredicates)
infer_goals_ext(_,[],_,[]):-!.
infer_goals_ext(_,_,[],[]):-!.
infer_goals_ext([],_,_,[]):-!.
infer_goals_ext(KP,[X|T],F,G):-
    infer_goals(KP,X,F,G1),
        writeln('\n[X-F]'-[X,F]),
        writeln('\nNGoal'-G1),
    infer_goals_ext(KP,T,F,G2),
    strict_reunion(G1,G2,G).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% goal extraction for rover in (race_conceptualizer_v7)
goal_extraction(RAEX_g,RAEX):-
    [Task_g,KeyProps_g,FOp_g,FDg_g,Plan_g] = RAEX_g,

        %writeln('Task_g: '-Task_g),
        %writeln('KeyProps_g: '-KeyProps_g),
        %writeln('Plan_g: '-Plan_g),nl,

    get_at_end_props(KeyProps_g, Goal),
        writeln('\nGoal_g'-Goal),nl,
        %writeln('KeyProps_g: '-KeyProps_g),
    upgrade_key_properties(KeyProps_g,Goal,NKeyProps_g),
        %writeln('KeyProps_g: '-KeyProps_g),
        %writeln('NKeyProps_g: '-NKeyProps_g),

    RAEX = [Task_g,NKeyProps_g,FOp_g,FDg_g,Plan_g,Goal], !.

% goal extraction for race
goal_extraction(RAEX_g,RAEX):-
    [Task_g,KeyProps_g,FOp_g,FDg_g,Plan_g] = RAEX_g,

        %writeln('Task_g: '-Task_g),
        %writeln('KeyProps_g: '-KeyProps_g),
        %writeln('Plan_g: '-Plan_g),nl,
    Task_g=..[_|Args],
    rm_rf_timestamps(KeyProps_g,KP),
        %writeln('KeyProps_g: '-KeyProps_g),
        %writeln('KP: '-KP),nl,
        %writeln('Args: '-Args),nl,

    %%%~the idea was to add arguments of actoins to 'AbsOpArgsList'
    %%%~extract_actions_args(Plan_g,AbsOpArgsList),
        %%%~writeln('AbsOpArgsList: '-AbsOpArgsList),
    %%%~strict_reunion(Args,AbsOpArgsList,AllArgs),
    %%%~infer_goals(KP,AllArgs,Goal),
    %%%~infer_goals_ext(KP,Args,AbsOpArgsList,NGoal),
        %%%~writeln('\nNGoal'-NGoal),
    infer_goals(KP,Args,Goal),
        writeln('\nGoal_g'-Goal),nl,
        %writeln('KeyProps_g: '-KeyProps_g),
    upgrade_key_properties(KeyProps_g,Goal,NKeyProps_g),
        %writeln('KeyProps_g: '-KeyProps_g),
        %writeln('NKeyProps_g: '-NKeyProps_g),

    RAEX = [Task_g,NKeyProps_g,FOp_g,FDg_g,Plan_g,Goal].

%% goal extraction without upgrading key propos with at_goal 
goal_extraction_without_up_keyprops(RAEX_g,RAEX):-
    [Task_g,KeyProps_g,FOp_g,FDg_g,Plan_g] = RAEX_g,

        %writeln('Task_g: '-Task_g),
        %writeln('KeyProps_g: '-KeyProps_g),
        %writeln('Plan_g: '-Plan_g),
    %extract_actions_args(Plan_g,ArgsList),
        %writeln('ArgsList: '-ArgsList),
    Task_g=..[_|Args],
    rm_rf_timestamps(KeyProps_g,KP),
        %writeln('KeyProps_g: '-KeyProps_g),
        %writeln('KP: '-KP),
        %writeln('Args: '-Args),
    %strict_reunion(Args,ArgsList,AllArgs),
    %infer_goals(KP,AllArgs,Goal),
    infer_goals(KP,Args,Goal),
        %writeln('\nGoal_g'-Goal),
        %writeln('KeyProps_g: '-KeyProps_g),
    %upgrade_key_properties(KeyProps_g,Goal,NKeyProps_g),
    upgrade_key_properties(KeyProps_g,[],NKeyProps_g),
        %writeln('KeyProps_g: '-KeyProps_g),
        writeln('NKeyProps_g: '-NKeyProps_g),

    RAEX = [Task_g,NKeyProps_g,FOp_g,FDg_g,Plan_g,Goal].

%%%
%%%

% upgrade KeyProps by replacing 'at_end' with 'at_goal'
upgrade_key_properties(KP_g,Goal,UKP_g):-
    upgrade_key_properties(KP_g,NKP_g),
    upgrade_goal_properties(Goal,UGoal),
    append(NKP_g,UGoal,UKP_g).

% skip 'at_end' properties
upgrade_key_properties([],[]).
upgrade_key_properties([K|KP_g],[K|KP_c_aux]):-
    (K=..[at_start|_];K=..[throughout|_]),!,
    upgrade_key_properties(KP_g,KP_c_aux).
upgrade_key_properties([_|KP_g],KP_c_aux):-
    upgrade_key_properties(KP_g,KP_c_aux).

% upgrade 'at_goal' properties
upgrade_goal_properties([],[]):-!.
upgrade_goal_properties([G|Goal],[NG|NGoal]):-
    NG=..[at_goal|[G]],
    upgrade_goal_properties(Goal,NGoal).

%%%
%%%

extract_actions_args([],[]).
extract_actions_args([Step|Plan],ArgsList):-
    extract_actions_args(Plan,Args),
    Step=..[_|A],
    strict_reunion(A,Args,ArgsList).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for test
test:-
    retractall(robot_activity_experience(_,_,_)),
    ['MyExamples/race_activity_experiences'],
    robot_activity_experience(2453,_,[T,KP,_,_,_]),
    T=..[N|A],
    writeln('Task'-N),
    writeln('Args'-A),
    rm_rf_timestamps(KP,NKP),
    writeln('KP'-NKP),
    %test_infer_goals(NKP,A,G),!,
        B = ['mug1','guest1','premanipulationareasouthtable1','manipulationareasouthtable1','placingareawestrighttable1'],
        test_infer_goals(NKP,B,G),!,
        writeln('ArgsList'-B),
    writeln('Goal'-G).

%test_infer_goals(+KeyPropositions, +GivenArgumentsList, -GoalPredicates)
test_infer_goals(_,[],[]):-!.
test_infer_goals(_,[_],[]):-!.
test_infer_goals(KP,[X|T],G):-
    test_infer_goals(KP,X,T,G1),
    test_infer_goals(KP,T,G2),
    union(G1,G2,G).

%test_infer_goals(+KeyPropositions, +GivenArgument, +GivenArgumentsList, -GoalPredicates)
test_infer_goals(_,_,[],[]):-!.
test_infer_goals(KP,X,[H|T],G):-
        %writeln('KP'-KP),
    (bagof(K, (infer_goal(KP,X,H,K),K\=[]), Goal); Goal=[]),
        writeln('X'-X), writeln('H'-H),
        writeln('Goal'-Goal),
        length(Goal,L),
        writeln('L'-L),
    get_shortest_goal(Goal,G1),
        writeln('G1'-G1),
    test_infer_goals(KP,X,T,G2),
        %writeln('G2'-G2),
    union(G1,G2,G).
        %writeln('Goal'-Goal).

%%------------------
%% 06-12-2015
%% extend goal extraction in a way that all possible goal predicates between 
%% the task arguments and the entities in the final state are extracted
%% e.g., between [guest1] and [rightgripper1,gripperopeningposture8,rightarm1,
%% armunnamedposture59,mug1,placingareawestrighttable1,trixi1,manipulationareasouthtable1,
%% torso1,torsoupposture6,leftarm1,armcarryposture47]

%test_infer_goals_ext(+KeyPropositions, +GivenArgumentsList, +GivenFinalStateObjectsList, -GoalPredicates)
test_infer_goals_ext([],_,_,[]):-!.
test_infer_goals_ext(_,[],_,[]):-!.
test_infer_goals_ext(_,_,[],[]):-!.
test_infer_goals_ext(KP,[X|T],F,G):-
    test_infer_goals(KP,X,F,G1),
    test_infer_goals_ext(KP,T,F,G2),
    union(G1,G2,G).

test_ext:-
    retractall(robot_activity_experience(_,_,_)),
    ['MyExamples/race_activity_experiences'],
    robot_activity_experience(2453,_,[T,KP,_,_,_]),
    T=..[N|A],
    writeln('Task'-N),
    writeln('Args'-A),
    rm_rf_timestamps(KP,NKP),
    writeln('KP'-NKP),
    F = ['rightgripper1','gripperopeningposture8','rightarm1','armunnamedposture59','mug1','placingareawestrighttable1','trixi1','manipulationareasouthtable1','torso1','torsoupposture6','leftarm1','armcarryposture47'],
    test_infer_goals_ext(NKP,A,F,G),!,
    writeln('ArgsList'-F),
    writeln('Goal'-G).

