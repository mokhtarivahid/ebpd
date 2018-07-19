%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > feature extraction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > compute cost of operators
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute_cost(+AbstractPlan,+ActionDefinition,-G_Cost,-RestAbstractPlan,-GroundAbsOp)


%%%%%%%%%%%%%%%%
%% if action 'AD' belongs to nil class
%% if the curent absop is ground, the cost is 1 for only nil actions 
%% whoes their effects produce the preconditions of the current action 
%% belonging to absop; otherwise they are discarded to develop
%%compute_cost(AO,A,1,AO,nil):-
%%    get_parent(A,nil), !,
%%    AO=[[A,_]|_],
%%    get_action(ADef, _),
%%    get_parent(ADef,A),
%%    get_positive_effect(A,NilEff),
%%    get_precondition(ADef,ADefPre),
%%    mysubset(NilEff,ADefPre), !.

%% if the curent absop is not ground, the cost is 1 for all nil actions 
compute_cost(AO,A,1,AO,nil):-
    get_parent(A,nil), 
    get_action_def(A,AP), nl,write(AP),
    !.

%%%%%%%%%%%%%%%%

% if action 'A' belongs to abstract class in schema
% if there is no features in schema cost is real cost
compute_cost([[AO,[[]-[]]]|RestAO],A,1,RestAO,[AO,[[]-[]]]):-
    % if action 'A' belongs to abstract operator 'AO'
    get_parent(A,AP), nl,write(AP),
    AP=AO,!.

compute_cost([[AO,[F1-[]]]|RestAO],A,C,RestAO,[AO,[F-[]]]):-
    % if action 'A' belongs to abstract operator 'AO'
    get_parent(A,AP), nl,write(AP),
    AP=AO,!,
    %% feature extraction
    get_parent_target_args(A,Args),
    nb_getval(problem_entities,Ents),
    nb_getval(key_propositions,KP),
    union(Args,Ents,AllEnts),
    refine_keypropos(AllEnts,KP,NKP),
    extract_arglist_features(Args,Ents,NKP,_,_,_,Features1-_),
    copy_term(F1,CF1),
    findall(CF1-V11, (verify_direct_features(CF1,Features1,V11), V11 > 0), LF1),
    forall_member(F-V1,LF1),
    length(F1,N),
    cost(N,V1,C),
        format(' features1(~g/~g) ',[V1,N]).

% if action 'A' belongs neither to abstract class in schema nor nil
compute_cost(AO,A,C,AO,nil):-
    penalty_cost(C).

%%%%%%%

%verify_direct_features(+Features_Schema,+Features_Problem,-Count)
verify_direct_features([],_,0).
verify_direct_features([F|R],FP,V):-
  member(F,FP),!,
  verify_direct_features(R,FP,C),
  V is C + 1.
verify_direct_features([_|R],FP,V):-
  verify_direct_features(R,FP,V).

%%%%%%%

%verify_indirect_features(+Features_Schema,+Features_Problem,-Count)
verify_indirect_features([],_,0):-!.
verify_indirect_features(_,[],0):-!.
verify_indirect_features([F|R],FP,V):-
  verify_indirect_feature(F,FP,NFP),!,
  verify_indirect_features(R,NFP,C),
  V is C + 1.
verify_indirect_features([_|R],FP,V):-
  verify_indirect_features(R,FP,V).
%%
verify_indirect_feature([F1,F2],[[FP1,FP2]|FP],FP):-
    (F1=FP1, F2=FP2, !;
     F1=FP2, F2=FP1, !).
verify_indirect_feature([F1,F2],[[FP1,FP2]|FP],[[FP1,FP2]|NFP]):-
    verify_indirect_feature([F1,F2],FP,NFP).

%%%%%%%

forall_member(X,[]):- X=[]-0, !.
forall_member(X,L):- member(X,L).

%%%%%%%
