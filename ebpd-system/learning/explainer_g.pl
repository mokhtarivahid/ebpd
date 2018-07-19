
%%%
%%%  Explanation of a failure recovery episode
%%%  
%%%  L. Seabra Lopes, FCT/UNL, Dezembro 1996
%%%


generalfail(Id,FRE_g,INFO_g,FS_g,GS_g)
:- failure_episode(Id,FRE_c),
   explain_general_fr_episode(FRE_c,_,_,_,FRE_g,INFO_g,FS_g,GS_g).

generalfail1(Id,FRE_g,INFO_g,IS_g,FS_g,GS_g)
:- failure_episode(Id,FRE_c),
   explain_general_fr_episode(FRE_c,_,_,_,_,FRE_g,INFO_g,IS_g,FS_g,GS_g).

duplicar_fre(FRE_c,FRE)
:- FRE_c = [FOp_c,FDg_c,RPlan_c],
   variabilize_term(FOp_c,FOp_g), FOp = (FOp_c,FOp_g),
   variabilize_term(FDg_c,FDg_g), FDg = (FDg_c,FDg_g),
   variabilize_list_of_terms(RPlan_c,RPlan_g),
   pairwise_merged_lists(RPlan_c,RPlan_g,RPlan),
   FRE = [FOp,FDg,RPlan].

% New EBG procedure:
% -- Developed for RACE
% ( produces mapping of constants to variables 
%   and uses this mapping to generalize Task and KeyProps )

explain_general_ra_experience( RAEX_c,INFO_c,IS_c,FS_c,GS_c,
                               RAEX_g,INFO_g,IS_g,FS_g,GS_g, Map )
:- RAEX_c = [Task_c,KeyProps_c,FOp_c,FDg_c,Plan_c],
       %print('FOp_c:'), print(FOp_c), nl,
       %print('FDg_c:'), print(FDg_c), nl,
       %print('Plan_c:'), print(Plan_c), nl,
   variabilize_term(FOp_c,FOp_g,[],Map1), FOp = (FOp_c,FOp_g),
   variabilize_term(FDg_c,FDg_g,Map1,Map2), FDg = (FDg_c,FDg_g),
   variabilize_list_of_terms(Plan_c,Plan_g,Map2,Map3),
       %print('Map1:'), writeln(Map1), nl,
       %print('Map2:'), writeln(Map2), nl,
       %print('Map3:'), writeln(Map3), nl,
       %print('FOp_g:'), print(FOp_g), nl,
       %print('FDg_g:'), print(FDg_g), nl,
       %print('Plan_g:'), print(Plan_g), nl,
   pairwise_merged_lists(Plan_c,Plan_g,Plan),
       %print('Plan merged:'), print(Plan), nl,
   FRE = [FOp,FDg,Plan],
   explain_fr_episode(FRE,INFO,IS,GS),
       %print('INFO'-INFO), nl,
       %print('IS'-IS), nl,
       %print('GS'-GS), nl,
   explain_failed_operation(FOp,INFO,IS,IS,INFO,IS,CS1), % not sure if this line is needed
   explain_failure_effects(FOp,FDg,IS,CS1,IS,FS),        % not sure if this line is needed
                                                         % explain_fr_episode could return FS (the failure state)
   pairwise_merged_lists(INFO_c,INFO_g,INFO),
   pairwise_merged_lists(IS_c,IS_g,IS),
   pairwise_merged_lists(FS_c,FS_g,FS),
   pairwise_merged_lists(GS_c,GS_g,GS),

   % upgrade KeyProps taking into acount IS and GS
   %upgrade_key_properties(KeyProps_c,IS_c,GS_c,KeyProps_c_aux),
   %findall(X,(member(X,KeyProps_c_aux),X=at_start(_)),L1), length(L1,N1), writeln(at_start-N1),
   %findall(X,(member(X,KeyProps_c_aux),X=throughout(_)),L2), length(L2,N2), writeln(throughout-N2),
   %findall(X,(member(X,KeyProps_c_aux),X=at_end(_)),L3), length(L3,N3), writeln(at_end-N3),

       %print('Map3:'), writeln(Map3), nl,
   compress_variable_mapping(Map3,Map4),
       %print('Map4:'), writeln(Map4), nl,
       %writeln('Task_c: '-Task_c),
   generalize_term_from_mapping(Task_c,Map4,Task_g,Map5),
       %print('Map5:'), writeln(Map5), nl,
       %writeln('Task_g: '-Task_g),
   generalize_keyprops_from_mapping(KeyProps_c,Map5,KeyProps_g,Map6),
       writeln(KeyProps_g),
       %print('Map6:'), writeln(Map6), nl,
       %writeln('Task_g: '-Task_g),
       %writeln('KeyProps_g: '-KeyProps_g),
   Map = Map6,

   RAEX_g = [Task_g,KeyProps_g,FOp_g,FDg_g,Plan_g].


upgrade_key_properties(KP_c,IS_c,GS_c,KP_c_aux)
:-    %writeln('KP_c'-KP_c),
   findall(at_start(X), (member(X,IS_c), \+member(at_start(X),KP_c)),LAS),
      %writeln('LAS'-LAS),
   findall(at_end(X), (member(X,GS_c), \+member(at_end(X),KP_c)),LAE),
      %writeln('LAE'-LAE),
   append(KP_c,LAS,KP_c_aux0),
   append(KP_c_aux0,LAE,KP_c_aux).



% Old EBG procedure:

explain_general_fr_episode( FRE_c,INFO_c,IS_c,FS_c,GS_c,
                            FRE_g,INFO_g,IS_g,FS_g,GS_g  )
:- FRE_c = [FOp_c,FDg_c,RPlan_c],
       %print('FOp_c:'), print(FOp_c), nl,
       %print('FDg_c:'), print(FDg_c), nl,
       %print('RPlan_c:'), print(RPlan_c), nl,
   variabilize_term(FOp_c,FOp_g), FOp = (FOp_c,FOp_g),
   variabilize_term(FDg_c,FDg_g), FDg = (FDg_c,FDg_g),
   variabilize_list_of_terms(RPlan_c,RPlan_g),
       %print('FOp_g:'), print(FOp_g), nl,
       %print('FDg_g:'), print(FDg_g), nl,
       %print('RPlan_g:'), print(RPlan_g), nl,
   pairwise_merged_lists(RPlan_c,RPlan_g,RPlan),
       %print('RPlan merged:'), print(RPlan), nl,
   FRE = [FOp,FDg,RPlan],
   explain_fr_episode(FRE,INFO,IS,GS),
       %print('INFO'-INFO), nl,
       %print('IS'-IS), nl,
       %print('GS'-GS), nl,
   explain_failed_operation(FOp,INFO,IS,IS,INFO,IS,CS1), % not sure if this line is needed
   explain_failure_effects(FOp,FDg,IS,CS1,IS,FS),        % not sure if this line is needed
                                                         % explain_fr_episode could return FS (the failure state)
   pairwise_merged_lists(INFO_c,INFO_g,INFO),
   pairwise_merged_lists(IS_c,IS_g,IS),
   pairwise_merged_lists(FS_c,FS_g,FS),
   pairwise_merged_lists(GS_c,GS_g,GS),

   FRE_g = [FOp_g,FDg_g,RPlan_g].

explain_general_fr_episode(FRE_c,INFO_c,FS_c,GS_c,FRE_g,INFO_g,FS_g,GS_g)
:- FRE_c = [FOp_c,FDg_c,RPlan_c],
   variabilize_term(FOp_c,FOp_g), FOp = (FOp_c,FOp_g),
   variabilize_term(FDg_c,FDg_g), FDg = (FDg_c,FDg_g),
   variabilize_list_of_terms(RPlan_c,RPlan_g),
   pairwise_merged_lists(RPlan_c,RPlan_g,RPlan),
   FRE = [FOp,FDg,RPlan],
   explain_fr_episode(FRE,INFO,FS,GS),
   pairwise_merged_lists(INFO_c,INFO_g,INFO),
   pairwise_merged_lists(FS_c,FS_g,FS),
   pairwise_merged_lists(GS_c,GS_g,GS),
   FRE_g = [FOp_g,FDg_g,RPlan_g].


operator_functionality_cg(Op,OpLI,OpLK,OpLD,OpLA)
:- Op \= (_,_), !, operator_functionality(Op,OpLI,OpLK,OpLD,OpLA).

operator_functionality_cg((Op_c,Op_g),OpLI,OpLK,OpLD,OpLA)
:- operator_functionality(Op_c,OpLI_c,OpLK_c,OpLD_c,OpLA_c),
   operator_functionality(Op_g,OpLI_g,OpLK_g,OpLD_g,OpLA_g),
   %   print('before merging'),
   pairwise_merged_lists(OpLI_c,OpLI_g,OpLI),
   pairwise_merged_lists(OpLK_c,OpLK_g,OpLK),
   pairwise_merged_lists(OpLD_c,OpLD_g,OpLD),
   pairwise_merged_lists(OpLA_c,OpLA_g,OpLA).
   
failure_description_cg(FDg,FOp,FailLD,FailLA)
:- FDg \= (_,_), !, failure_description(FDg,FOp,FailLD,FailLA).

failure_description_cg((FDg_c,FDg_g),(FOp_c,FOp_g),FailLD,FailLA)
:- failure_description(FDg_c,FOp_c,FailLD_c,FailLA_c),
   failure_description(FDg_g,FOp_g,FailLD_g,FailLA_g),
   pairwise_merged_lists(FailLD_c,FailLD_g,FailLD),
   pairwise_merged_lists(FailLA_c,FailLA_g,FailLA).

%

%explain_fr_episode(FRE,INFO,IS,GS)

explain_fr_episode(FRE,INFO,FS,GS)
:- FRE = [FOp,FDg,RPlan],
   initialize_generalization_context,
   %   print(a), nl,
   %   print('FOp'-FOp), nl,
   explain_failed_operation(FOp,[],[],[],WI1,IS1,CS1),
   %   print(b), nl,
   explain_failure_effects(FOp,FDg,IS1,CS1,_,CS2),
   %   print(c), nl,
   explain_recovery_plan(RPlan,WI1,CS2,CS2,INFO,FS,GS),
   %   print(d), nl,
   cleanup_generalization_context.

%%

explain_failed_operation((none,none),WI,IS,CS,WI,IS,CS).
                %%% this is a new rule for RACE (since we 
                %%% do not work with failures, for now)   

explain_failed_operation(FOp,WI1,IS1,CS1,WI2,IS3,CS3)
:- operator_functionality_cg(FOp,OpLI,OpLK,OpLD,_),
   explain_world_information(OpLI,CS1,WI1,WI2),
   explain_keep_conditions(OpLK,IS1,CS1,IS2,CS2),
   explain_keep_conditions(OpLD,IS2,CS2,IS3,CS3).

% explain_failed_operation(FOp,WI1,IS2,CS2)
% :- operator_functionality_cg(FOp,OpLI,OpLK,OpLD,_),
%    explain_world_information(OpLI,[],[],WI1),
%    explain_keep_conditions(OpLK,[],[],IS1,CS1),
%    explain_keep_conditions(OpLD,IS1,CS1,IS2,CS2).

explain_failure_effects(FOp,FDg,IS1,CS1,IS2,CS3)
:- failure_description_cg(FDg,FOp,FailLD,FailLA),
   explain_del_conditions(FailLD,IS1,CS1,IS2,CS2),
   explain_add_conditions(FailLA,CS2,CS3).

explain_recovery_plan([],INFO,IS,GS,INFO,IS,GS)
:- !.

explain_recovery_plan([Op|RPlan],WI1,IS1,CS1,INFO,IS,GS)
:- explain_operator_application(Op,WI1,IS1,CS1,WI2,IS2,CS2),
   explain_recovery_plan(RPlan,WI2,IS2,CS2,INFO,IS,GS).

explain_operator_application(Op,WI1,IS1,CS1,WI2,IS3,CS4)
:- 
   %   print('explain_operator_application Op = '), print(Op), nl,
   operator_functionality_cg(Op,OpLI,OpLK,OpLD,OpLA), !,
   %   print(c1), nl,
   explain_world_information(OpLI,CS1,WI1,WI2),
   %   print(c2), nl,
   explain_keep_conditions(OpLK,IS1,CS1,IS2,CS2),
   %   print(c3), nl,
   explain_del_conditions(OpLD,IS2,CS2,IS3,CS3),
   %   print(c4), nl,
   explain_add_conditions(OpLA,CS3,CS4).

%%%
%%%
%%%

explain_world_information([],_,WI,WI).

explain_world_information([I|LI],CS,WI1,WI3)
:- explain_information_fact(I,CS,WI1,WI2),
   explain_world_information(LI,CS,WI2,WI3).

%

explain_information_fact(I,_,WI,WI) 
:- member_bt(I,WI).

explain_information_fact(I,CS,WI,WI)
:- member_bt(I,CS).

explain_information_fact(I,_,WI,[I|WI]) 
:- I \= (_,_), ( clause(planning_info(I),true); I = object_type(_,_) ).

explain_information_fact(I,_,WI,[I|WI]) 
:- I = (I_c,_), ( clause(planning_info(I_c),true); I_c = object_type(_,_) ).

%%%
%%%
%%%

explain_keep_conditions([],IS,CS,IS,CS).

explain_keep_conditions([K|LK],IS1,CS1,IS3,CS3)
:- explain_keep_condition(K,IS1,CS1,IS2,CS2),
   explain_keep_conditions(LK,IS2,CS2,IS3,CS3).

%

%explain_keep_condition(K,IS1,CS1,IS2,CS2)
%:- K = (UQ_c,UQ_g), UQ_c = all(X_c,SET_c,Term_c), !,
%   expand_universal_quantification(X_c,Term_c,SET_c,LK_c),
%   UQ_g = all(X_g,SET_g,Term_g),
%   expand_universal_quantification(X_g,Term_g,SET_g,LK_g),
%   pairwise_merged_lists(LK_c,LK_g,LK),
%   explain_keep_conditions(LK,IS1,CS1,IS2,CS2).
%
%explain_keep_condition(K,IS1,CS1,IS2,CS2)
%:- K = all(X,SET,Term), !, 
%   expand_universal_quantification(X,Term,SET,LK),
%   explain_keep_conditions(LK,IS1,CS1,IS2,CS2).

explain_keep_condition(K,IS1,CS1,IS2,CS2)
:- universally_quantified(K), !,
   expand_universal_quantification(K,LK),
   explain_keep_conditions(LK,IS1,CS1,IS2,CS2).

explain_keep_condition(K,IS,CS,IS,CS)
:- K = (_ -> _), !.

explain_keep_condition(K,IS,CS,IS,CS)
:- K = ( (_ -> _), (_ -> _) ), !.

explain_keep_condition(LK,IS1,CS1,IS2,CS2)
:- LK = (LK_c,LK_g), LK_c = [_|_], !, 
   pairwise_merged_lists(LK_c,LK_g,LK_m),
   explain_keep_conditions(LK_m,IS1,CS1,IS2,CS2).

explain_keep_condition(LK,IS1,CS1,IS2,CS2)
:- LK = [_|_], !, 
   explain_keep_conditions(LK,IS1,CS1,IS2,CS2).

explain_keep_condition(K,IS,CS,IS,CS)
:- K = not(_), !.

explain_keep_condition(K,IS,CS,IS,CS)
:- K = (not(_),not(_)), !.

explain_keep_condition(K,IS,[],[K|IS],[K]).

explain_keep_condition(K,IS,[K|CS],IS,[K|CS]).

% explain_keep_condition(K,IS1,[C|CS1],IS2,[C|CS2])
% :- K \= (_,_), C \= (_,_), K \= C, 
%    explain_keep_condition(K,IS1,CS1,IS2,CS2).
% 
% explain_keep_condition(K,IS1,[C|CS1],IS2,[C|CS2])
% :- K = (K_c,_), C = (C_c,_), K_c \= C_c, 
%    explain_keep_condition(K,IS1,CS1,IS2,CS2).

explain_keep_condition(K,IS1,[C|CS1],IS2,[C|CS2])
:- K \= C, explain_keep_condition(K,IS1,CS1,IS2,CS2).

%

universally_quantified(all(_,_,_)).
universally_quantified((all(_,_,_),all(_,_,_))).

expand_universal_quantification(K,LK)
:- K = all(X,SET,Term), !,
   expand_universal_quantification(X,Term,SET,LK).

expand_universal_quantification(K,LK)
:- K = ( all(X_c,SET_c,Term_c), all(X_g,SET_g,Term_g) ), !,
   pairwise_merged_lists(SET_c,SET_g,SET),
   expand_universal_quantification( (X_c,X_g), (Term_c,Term_g), SET, LK ).

expand_universal_quantification(_,_,[],[])
:- !.

expand_universal_quantification(X,Term,[Arg|LArg],[K|LK])
:- expand_term_to_arg(X,Term,Arg,K), !,
   expand_universal_quantification(X,Term,LArg,LK).

%

expand_term_to_arg(X,Term,Arg,K)
:- Term = ( (Body_c -> Head_c),(Body_g -> Head_g) ), !,
   pairwise_merged_lists(Body_c,Body_g,Body),
   pairwise_merged_lists(Head_c,Head_g,Head),
   expand_term_to_arg(X,Body,Arg,B),
   expand_term_to_arg(X,Head,Arg,H),
   pairwise_merged_lists(B_c,B_g,B),
   pairwise_merged_lists(H_c,H_g,H),
   K = ( (B_c -> H_c), (B_g -> H_g) ).

expand_term_to_arg(X,(Body -> Head),Arg,(B -> H))
:- !, 
   expand_term_to_arg(X,Body,Arg,B),
   expand_term_to_arg(X,Head,Arg,H).

expand_term_to_arg(X,(not(_),not(_)),Arg,(not(K_c),not(K_g)))
:- !, expand_term_to_arg(X,_,Arg,(K_c,K_g)).

expand_term_to_arg(X,not(Term),Arg,not(K))
:- !, expand_term_to_arg(X,Term,Arg,K).

expand_term_to_arg(X,(Term_c,Term_g),Arg,(T_c,T_g) )
:- Term_c = [_|_], Term_g = [_|_], !,
   pairwise_merged_lists(Term_c,Term_g,Term),
   expand_term_to_arg(X,Term,Arg,T),
   pairwise_merged_lists(T_c,T_g,T).

expand_term_to_arg(_,[],_,[])
:- !.

expand_term_to_arg(X,[Term|LTerm],Arg,[K|LK])
:- expand_term_to_arg(X,Term,Arg,K), !,
   expand_term_to_arg(X,LTerm,Arg,LK).

expand_term_to_arg(X,Term,Arg,K)
:- Term = (Term_c,Term_g), !,
   Term_c =.. [F|Args_c], Term_g =.. [F|Args_g],
   pairwise_merged_lists(Args_c,Args_g,Args),
   replace_quantification_variable(X,Arg,Args,Args_r),
   pairwise_merged_lists(Args_r_c,Args_r_g,Args_r),
   K_c =.. [F|Args_r_c], K_g =.. [F|Args_r_g], K = (K_c,K_g).

expand_term_to_arg(X,Term,Arg,K)
:- Term =.. [F|Args],
   replace_quantification_variable(X,Arg,Args,Args_r),
   K =.. [F|Args_r].

%

replace_quantification_variable(_,_,[],[])
:- !.

replace_quantification_variable(X,Arg,[Y|Args],[Arg|Args_r])
:- X = (X_c,_), Y = (Y_c,_), X_c == Y_c, !,
   replace_quantification_variable(X,Arg,Args,Args_r).

replace_quantification_variable(X,Arg,[Y|Args],[Arg|Args_r])
:- X \= (_,_), X == Y, !,
   replace_quantification_variable(X,Arg,Args,Args_r).

replace_quantification_variable(X,Arg,[Y|Args],[Y|Args_r])
:- replace_quantification_variable(X,Arg,Args,Args_r).

%%%
%%%
%%%

explain_del_conditions([],IS,CS,IS,CS).

explain_del_conditions([D|LD],IS1,CS1,IS3,CS3)
:- explain_del_condition(D,IS1,CS1,IS2,CS2),
   explain_del_conditions(LD,IS2,CS2,IS3,CS3).

%

explain_del_condition(D,IS,[],[D|IS],[]).

explain_del_condition(D,IS,[D|CS],IS,CS).

% explain_del_condition(D,IS1,[E|CS1],IS2,[E|CS2])
% :- D \= (_,_), E \= (_,_), D \= E, 
%    explain_del_condition(D,IS1,CS1,IS2,CS2).
% 
% explain_del_condition(D,IS1,[E|CS1],IS2,[E|CS2])
% :- D = (D_c,_), E = (E_c,_), D_c \= E_c, 
%    explain_del_condition(D,IS1,CS1,IS2,CS2).

explain_del_condition(D,IS1,[E|CS1],IS2,[E|CS2])
:- D \= E, explain_del_condition(D,IS1,CS1,IS2,CS2).

%%%
%%%
%%%


explain_add_conditions(LA,CS1,CS2)
:- append_no_bt(LA,CS1,CS2).

%%%
%%%
%%%

pairwise_merged_lists([],[],[])
:- !.

pairwise_merged_lists([X|L1],[Y|L2],[(X,Y)|L])
:- !, pairwise_merged_lists(L1,L2,L).

pairwise_merged_lists(X,Y,(X,Y))
:- X \= [], X \= [_|_],Y \= [], Y \= [_|_].


