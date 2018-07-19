
get_episode_entities(Task,Op,Diag,EpEnts)
:- Task =.. [_|TaskArgs],
   Op   =.. [_|OpArgs],
   Diag =.. [_|DiagArgs],
   strict_reunion(TaskArgs,OpArgs,U_aux),
   strict_reunion(U_aux,DiagArgs,AllEnts),
   % discard some non interesting entities (postures, etc.) ??
   % (for this we need the key props)
writeln('\nAllEnts:'-AllEnts),
   EpEnts = AllEnts.


%%%
% it removes indirect features that are already in direct features
% e.g. DirectFeatures      = [F1, F2, F3]
%      InDirectFeatures    = [[F1,F2], [F1,F3], [F2,F4], [F3,F5]]
%      NewInDirectFeatures = [[F2,F4], [F3,F5]]
%refine_indirect_features(+DirectFeatures,+InDirectFeatures,-NewInDirectFeatures)
refine_indirect_features([],F,F):-!.
refine_indirect_features(_,[],[]):-!.
refine_indirect_features(F1,[[F21,F22]|F2],F3):-
    strict_member(F21,F1),
    strict_member(F22,F1),!,
    refine_indirect_features(F1,F2,F3).
refine_indirect_features(F1,[F|F2],[F|F3]):-
    refine_indirect_features(F1,F2,F3).

%%%

%%%
% it is suited for new dwr domain (November 17, 2016)
% refine 'KeyProps_g' by keeping only predicates that have the arguments
% totally included in the union of the arguments of action and
% the episode arguments (i.e., task arguments).
% e.g., suppose [X,Y] are the arguments of a given abstract action,
%       and [Y,Z] are the episode arguments, so the union is [X,Y,Z],
%       so: - P(X,Y) or P(X) or P(Y) or P(X,Y,Z) are included for look up, and
%           - P(X,Y,W) is a predicate that is discarded for look up because of W
% e.g., a real example:
%	      episode arguments: [p1,p2]
%       abstract action: unstack(b3,p1)
%       predicate: (in r2 p1) is dicarded because of 'r2'
%refine_keypropos(+Arguments,+EpisodeEnt,+KeyProps_g,-NKeyProps_g)
refine_keypropos(_,[],[]):-!.
refine_keypropos(AllEnts,[Feature|KeyProps_g],NKeyProps_g):-
     Feature =.. [_,P],
     P       =.. [_|A],
     member(X,A), \+ strict_member(X,AllEnts),
     refine_keypropos(AllEnts,KeyProps_g,NKeyProps_g), !.
refine_keypropos(AllEnts,[Feature|KeyProps_g],[Feature|NKeyProps_g]):-
     refine_keypropos(AllEnts,KeyProps_g,NKeyProps_g).

%%%

%% extract_step_features(Step,EpEnts,KeyProps_g,FS_g,Info_g,GS_g,[Features1-Features3])
%% :- Step =.. [move|[_,TargetArg]],!,
%%        writeln(Step-EpEnts),
%%    extract_arglist_features([TargetArg],EpEnts,KeyProps_g,FS_g,Info_g,GS_g,Features1-Features2),
%%    refine_indirect_features(Features1,Features2,Features3).

extract_step_features(Step,EpEnts,KeyProps_g,FS_g,Info_g,GS_g,[Features1-Features3])
:- Step =.. [_|Args],
       writeln(Step-EpEnts),
   strict_reunion(Args,EpEnts,AllEnts),
   refine_keypropos(AllEnts,KeyProps_g,NKeyProps_g),
       %writeln('KeyProps_g'-KeyProps_g),
       %writeln('NKeyProps_g'-NKeyProps_g),
   extract_arglist_features(Args,EpEnts,NKeyProps_g,FS_g,Info_g,GS_g,Features1-Features2),
   refine_indirect_features(Features1,Features2,Features3).

extract_arglist_features([],_,_,_,_,_,[]-[])
:- !.

extract_arglist_features([Arg|Args],EpEnts,KeyProps_g,FS_g,Info_g,GS_g,Features1-Features2)
:- %   writeln(Arg-EpEnts),
   extract_arg_features(Arg,EpEnts,KeyProps_g,FS_g,Info_g,GS_g,Features11-Features12),!,
   %   AllFeatures=Features.
   extract_arglist_features(Args,EpEnts,KeyProps_g,FS_g,Info_g,GS_g,Features21-Features22),
   strict_reunion(Features11,Features21,Features1),
   strict_reunion(Features12,Features22,Features2).
   %append(Features,OtherFeatures,AllFeatures).

%%%%% extract_arg_features(Arg,EpEnts,KeyProps_g,_,_,_,Features)
%%%%% :- discover_features(Arg,EpEnts,KeyProps_g,Features).

% if there is direct features, indirect features are not necessary
extract_arg_features(Arg,EpEnts,KeyProps_g,_,_,_,Features1-[])
:- discover_features_ent_unary(Arg,EpEnts,KeyProps_g,Features1).
      %writeln('Features1(1)'-Features1),
      %length(Features1, L), writeln('\t'-L-'Unary Features')

%% extract_arg_features(Arg,EpEnts,KeyProps_g,_,_,_,Features1-[])
%% :- discover_features_ent_unary(Arg,EpEnts,KeyProps_g,Features1),
%%       %writeln('Features1(1)'-Features1),
%%       length(Features1, L), writeln('\t'-L-'Unary Features'),
%%    Features1 \=[], !.

%% extract_arg_features(Arg,EpEnts,KeyProps_g,_,_,_,[]-Features2)
%% :- %discover_features_ent_unary(Arg,EpEnts,KeyProps_g,Features1),
%%       %writeln('Features1(2)'-Features1),
%%       %length(Features1, L), writeln('\t'-L-'Unary Features'),
%%    discover_features_ent_binary(Arg,EpEnts,KeyProps_g,Features2),
%%       length(Features2, L), writeln('\t'-L-'Binary Features').

%%%%%%%%%% extract_arg_features(Arg,EpEnts,KeyProps_g,_,_,_,Features1-Features2)
%%%%%%%%%% :- discover_features_ent_unary(Arg,EpEnts,KeyProps_g,Features1),
%%%%%%%%%%       writeln('Features1'-Features1),
%%%%%%%%%%       length(Features1, L1), writeln('\t'-L1-'Unary Features'),
%%%%%%%%%%    discover_features_ent_binary(Arg,EpEnts,KeyProps_g,Features2),
%%%%%%%%%%       length(Features2, L2), writeln('\t'-L2-'Binary Features').

%%

discover_features_ent_unary(_,[],_,[])
:- !.

discover_features_ent_unary(Arg,[Ent|EpEnts],KeyProps,Features)
:- discover_features_unary(Arg,Ent,KeyProps,Features11),
   discover_features_ent_unary(Arg,EpEnts,KeyProps,Features12),
   strict_reunion(Features11,Features12,Features).

%%

discover_features_ent_binary(_,[],_,[])
:- !.

discover_features_ent_binary(Arg,[Ent|EpEnts],KeyProps,Features)
:- discover_features_binary(Arg,Ent,KeyProps,Features21),
   discover_features_ent_binary(Arg,EpEnts,KeyProps,Features22),
   strict_reunion(Features21,Features22,Features).

%%

%%%%%% discover_features(_,[],_,[]-[])
%%%%%% :- !.

%%%%%% % if there is direct features, indirect features are not necessary
%%%%%% discover_features(Arg,[Ent|EpEnts],KeyProps,Features1-Features2)
%%%%%% :- discover_features_unary(Arg,Ent,KeyProps,Features11),
%%%%%%       writeln('Features11(1)'-Features11),
%%%%%%    Features11 \=[], !,
%%%%%%    %discover_features_binary(Arg,Ent,KeyProps,Features12),
%%%%%%    Features12 = [],
%%%%%%    discover_features(Arg,EpEnts,KeyProps,Features21-Features22),
%%%%%%    strict_reunion(Features11,Features21,Features1),
%%%%%%    strict_reunion(Features12,Features22,Features2).
%%%%%%    %append(Features1,Features2,Features).

%%%%%% discover_features(Arg,[Ent|EpEnts],KeyProps,Features1-Features2)
%%%%%% :- discover_features_unary(Arg,Ent,KeyProps,Features11),
%%%%%%       writeln('Features11(2)'-Features11),
%%%%%%    discover_features_binary(Arg,Ent,KeyProps,Features12),
%%%%%%    discover_features(Arg,EpEnts,KeyProps,Features21-Features22),
%%%%%%    strict_reunion(Features11,Features21,Features1),
%%%%%%    strict_reunion(Features12,Features22,Features2).
%%%%%%    %append(Features1,Features2,Features).

%%%%%% %%

discover_features_unary(_,_,[],[])
:- !.

%vahid
% skip 'instance' properties
%discover_features_unary(Arg,Ent,[Feature|KeyProps],Features)
%:- Feature =.. [_,Prop], 
%   Prop    =.. [instance|_],!,
%   discover_features_unary(Arg,Ent,KeyProps,Features).

discover_features_unary(Arg,Ent,[Feature|KeyProps],Features)
:- %    writeln('xxxx'-Arg-Ent),
   discover_direct_feature(Arg,Ent,Feature,Features11),
   discover_features_unary(Arg,Ent,KeyProps,Features21),
   strict_reunion(Features11,Features21,Features).

%%

discover_features_binary(_,_,[],[])
:- !.

%vahid
% skip 'instance' properties
discover_features_binary(Arg,Ent,[Feature|KeyProps],Features)
:- Feature =.. [_,Prop], 
   Prop    =.. [instance|_],!,
   discover_features_binary(Arg,Ent,KeyProps,Features).

discover_features_binary(Arg,Ent,[Feature|KeyProps],Features)
:- %    writeln('xxxx'-Arg-Ent),
   discover_indirect_features(Arg,Ent,Feature,KeyProps,Features12),
   discover_features_binary(Arg,Ent,KeyProps,Features22),
   strict_reunion(Features12,Features22,Features).

%%

%%%%%% discover_features_ent(_,_,[],[]-[])
%%%%%% :- !.

%%%%%% %vahid
%%%%%% % skip 'instance' properties
%%%%%% discover_features_ent(Arg,Ent,[Feature|KeyProps],Features)
%%%%%% :- Feature =.. [_,Prop], 
%%%%%%    Prop    =.. [instance|_],!,
%%%%%%    discover_features_ent(Arg,Ent,KeyProps,Features).

%%%%%% % if there is direct features, indirect features are not necessary
%%%%%% discover_features_ent(Arg,Ent,[Feature|KeyProps],Features1-Features22)
%%%%%% :- %    writeln('xxxx'-Arg-Ent),
%%%%%%    discover_direct_feature(Arg,Ent,Feature,Features11),
%%%%%%    Features11 \= [],!,
%%%%%%    discover_features_ent(Arg,Ent,KeyProps,Features21-Features22),
%%%%%%    strict_reunion(Features11,Features21,Features1).

%%%%%% discover_features_ent(Arg,Ent,[Feature|KeyProps],Features21-Features2)
%%%%%% :- %    writeln('xxxx'-Arg-Ent),
%%%%%%    discover_indirect_features(Arg,Ent,Feature,KeyProps,Features12),
%%%%%%    discover_features_ent(Arg,Ent,KeyProps,Features21-Features22),
%%%%%%    strict_reunion(Features12,Features22,Features2).

%%%%%% %%

%discover_features_ent(Arg,Ent,[Feature|KeyProps],Features1-Features2)
%:- %    writeln('xxxx'-Arg-Ent),
%   discover_direct_feature(Arg,Ent,Feature,Features11),
%   %    Features1 = [],
%   discover_indirect_features(Arg,Ent,Feature,KeyProps,Features12),
%   %    Features2 = [],
%   discover_features_ent(Arg,Ent,KeyProps,Features21-Features22),
%   strict_reunion(Features11,Features21,Features1),
%   strict_reunion(Features12,Features22,Features2).
%   %append(Features1,Features2,Features12),
%   %append(Features12,Features3,Features).

%

%% discover_direct_feature(Arg,Ent,Feature,[Feature])
%% :- % write('Testing direct...'-Arg-Ent-Feature),
%%    Feature =.. [_,BinRel],
%%    BinRel  =.. [_|A],
%%    strict_member(Arg, A),
%%    strict_member(Ent, A), !.
%% discover_direct_feature(_,_,_,[]).

discover_direct_feature(Arg,Ent,Feature,[Feature])
:- % write('Testing direct...'-Arg-Ent-Feature),
   Feature =.. [_,BinRel],
   BinRel  =.. [_|A],
   ((A=[H], Arg==H);
    (strict_member(Arg, A),
     strict_member(Ent, A))), !.
discover_direct_feature(_,_,_,[]).

%

discover_indirect_features(_,_,_,[],[])
:- !.

discover_indirect_features(Arg,Ent,Feature1,[Feature2|KeyProps],Features)
:- discover_indirect_feature(Arg,Ent,Feature1,Feature2,Features1),
   discover_indirect_features(Arg,Ent,Feature1,KeyProps,Features2),
   append(Features1,Features2,Features).

discover_indirect_feature(Arg,Ent,Feature1,Feature2,[[Feature1,Feature2]])
:- % write('Testing indirect...'-Arg-Ent-Feature1-Feature2),
   Feature1 =.. [_,Prop1],
   Prop1    =.. [_|A1],
   Feature2 =.. [_,Prop2],
   Prop2    =.. [_|A2],
   (strict_member(Arg, A1), strict_member(Ent, A2), member(X,A1), X\==Arg, strict_member_bt(X,A2), X\==Ent;
    strict_member(Arg, A2), strict_member(Ent, A1), member(X,A2), X\==Arg, strict_member_bt(X,A1), X\==Ent), !.
discover_indirect_feature(_,_,_,_,[]).

%%%% discover_direct_feature(Arg,Ent,Feature,[Feature])
%%%% :- % write('Testing direct...'-Arg-Ent-Feature),
%%%%    Feature =.. [_,BinRel],
%%%%    BinRel  =.. [_,A1,A2],
%%%%   %( A1==Arg,A2==Ent; A2==Arg,A1==Ent ), !.%, writeln('... Verified').
%%%%    ( A1==Arg,  A2==Ent; 
%%%%      A2==Arg,  A1==Ent;
%%%%      Ent==Arg, A1==Ent; 
%%%%      Ent==Arg, A2==Ent ), !.
%%%% discover_direct_feature(_,_,_,[]).
%%%% %:- writeln('').

%%%% %

%%%% discover_indirect_features(_,_,_,[],[])
%%%% :- !.

%%%% discover_indirect_features(Arg,Ent,Feature1,[Feature2|KeyProps],Features)
%%%% :- discover_indirect_feature(Arg,Ent,Feature1,Feature2,Features1),
%%%%    discover_indirect_features(Arg,Ent,Feature1,KeyProps,Features2),
%%%%    append(Features1,Features2,Features).

%%%% discover_indirect_feature(Arg,Ent,Feature1,Feature2,[[Feature1,Feature2]])
%%%% :- % write('Testing indirect...'-Arg-Ent-Feature1-Feature2),
%%%%    Feature1 =.. [_,Prop1],
%%%%    Prop1    =.. [_,A11,A12],
%%%%    Feature2 =.. [_,Prop2],
%%%%    Prop2    =.. [_,A21,A22],
%%%%    ( A11==Arg, A12==A21, A22==Ent;
%%%%      A12==Arg, A11==A21, A22==Ent;
%%%%      A11==Arg, A12==A22, A21==Ent;
%%%%      A12==Arg, A11==A22, A21==Ent;
%%%%      A11==Ent, A12==A21, A22==Arg;
%%%%      A12==Ent, A11==A21, A22==Arg;
%%%%      A11==Ent, A12==A22, A21==Arg;
%%%%      A12==Ent, A11==A22, A21==Arg ), !.%,  writeln('... Verified').
%%%% discover_indirect_feature(_,_,_,_,[]).
%%%% %:- writeln('').

%%

% extract_arg_features(Arg,EpEnts,KeyProps_g,FS_g,Info_g,GS_g,Features)
% :- findall(Feature,discover_feature(Arg,EpEnts,KeyProps_g,Feature),Features).
% %:- bagof(Feature,discover_feature(Arg,EpEnts,KeyProps_g,Feature),Features).

% discover_feature(Arg,EpEnts,KeyProps,Feature)
% :-     writeln(sdfnlsdafnlaskdgnsd),
%    member(EpEntity,EpEnts),
%    member(Feature,KeyProps),
%    Feature =.. [_,Prop],
%    Prop =.. [_,A1,A2],
%    ( A1==Arg,A2==EpEntity; A2==Arg,A1==EpEntity ),
%        writeln(feature).
% 
% discover_feature(Arg,EpEnts,KeyProps,Feature1-Feature2)
% :-     writeln(xxxxxxxxxxxsdfnlsdafnlaskdgnsd),
%    member(EpEntity,EpEnts),
%    member(Feature1,KeyProps),
%    member(Feature2,KeyProps),
%    writeln(EpEntity-Feature1-Feature2),
%    Feature1 =.. [_,Prop1],
%    Prop1    =.. [_,A11,A12],
%    Feature2 =.. [_,Prop2],
%    Prop2    =.. [_,A21,A22],
%    ( A11==Arg, A12==A21, A22==EpEntity;
%      A12==Arg, A11==A21, A22==EpEntity;
%      A11==Arg, A12==A22, A21==EpEntity;
%      A12==Arg, A11==A22, A21==EpEntity ),
%    writeln(xxxxxxxxxxxx-Feature1-Feature2).
 

