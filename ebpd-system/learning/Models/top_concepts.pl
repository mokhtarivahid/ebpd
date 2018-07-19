%%%%%%%
%%%%%%%     Top concepts in frame-based modeling
%%%%%%%         (C) L. Seabra Lopes, FCT/UNL, Caparica, 11/1995
%%%%%%%


%%
%%  Relations:
%%

:- new_relation(isa,transitive,exclusion([subtypes]),subtypes),
   new_relation(subtypes,intransitive,none,isa).

%%
%%  Assembly Entity Concept:
%%

:- new_frame(assembly_entity).


%////////////////////////////////////////////////////////////////////
%%
%%  Concepts:
%%
%
%:- new_frame(anonymous_browsable_entity).
%
%:- new_relation(interlocutor,intransitive,none,browsed_by),
%   new_relation(browsed_by,intransitive,none,interlocutor).
%
%:- new_relation(target_entity,intransitive,none,assigned_interlocutor),
%   new_relation(assigned_interlocutor,intransitive,none,target_entity).
%
