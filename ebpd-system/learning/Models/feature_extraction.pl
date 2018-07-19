% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%       Feature Extraction for the robotized assembly domain
%       (C) Luis Seabra Lopes, UNL, Caparica, January 1996
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


get_episode_entities(Op_g,Diag_g,FS_g,Info_g,[LObj,LComp])
:- get_all_episode_variables(Op_g,Diag_g,EpVars),
   % get_all_episode_variables in: cbr.pro
   get_objects_involved_in_episode(Op_g,Diag_g,FS_g,Info_g,EpVars,LObj),
   get_components_involved_in_episode(Op_g,Diag_g,Info_g,EpVars,LComp), !.

%

get_objects_involved_in_episode(_,_,FS_g,Info_g,EpVars,LObj)
:- get_all_objects(FS_g,Info_g,LObj_1),
   strict_intersection(LObj_1,EpVars,LObj).
   

get_all_objects([],[],[])
:- !.

get_all_objects([],[object_type(Obj,_)|GS_g],[Obj|LO])
:- !, get_all_objects([],GS_g,LO).

get_all_objects([],[_|GS_g],LO)
:- !, get_all_objects([],GS_g,LO).

get_all_objects([object_type(Obj,_)|Info_g],GS_g,[Obj|LO])
:- !, get_all_objects(Info_g,GS_g,LO).

get_all_objects([_|Info_g],GS_g,LO)
:- !, get_all_objects(Info_g,GS_g,LO).

%

get_components_involved_in_episode(_,_,Info_g,EpVars,LComp)
:- get_all_components(Info_g,LComp_1),
   strict_intersection(LComp_1,EpVars,LComp).

get_all_components([],[])
:- !.

get_all_components([part_mate(_,Comp,_,_,_,_,_,_)|Info_g],[Comp|LC])
:- !, get_all_components(Info_g,LC).

get_all_components([_|Info_g],LC)
:- !, get_all_components(Info_g,LC).

%
%  Feature construction for plan skeleta
%

extract_step_features(pick(Obj),[LObj,LComp],_,FS_g,Info_g,GS_g,Obj_f)
:- extract_object_features(Obj,LObj,LComp,FS_g,Info_g,GS_g,Obj_f).

extract_step_features(place(Obj),[LObj,LComp],_,FS_g,Info_g,GS_g,Obj_f)
:- extract_object_features(Obj,LObj,LComp,FS_g,Info_g,GS_g,Obj_f).

extract_step_features(assemble(Obj,Comp),[LObj,LComp],_,FS_g,Info_g,GS_g,Step_f)
:- extract_object_features(Obj,LObj,LComp,FS_g,Info_g,GS_g,Obj_f),
   extract_component_features(Comp,LObj,LComp,FS_g,Info_g,GS_g,Comp_f),
   append_no_bt(Obj_f,Comp_f,Step_f).

extract_step_features(disassemble(Obj,Comp),
   [LObj,LComp],_,FS_g,Info_g,GS_g,Step_f)
:- extract_object_features(Obj,LObj,LComp,FS_g,Info_g,GS_g,Obj_f),
   extract_component_features(Comp,LObj,LComp,FS_g,Info_g,GS_g,Comp_f),
   append_no_bt(Obj_f,Comp_f,Step_f).

%
extract_object_features(Obj,LObj,_,_,_,_,[])
:- strict_member(Obj,LObj), !.

extract_object_features(Obj,LObj,_,FS_g,Info_g,GS_g,L2)
:- extract_initially_in_contact(Obj,LObj,Info_g,FS_g,[],L1),
   append_no_bt(Info_g,GS_g,WM_g),
   extract_same_type_as(Obj,LObj,WM_g,L1,L2), !.

   %extract_finally_in_contact(Obj,LObj,Info_g,GS_g,L1,L2),
   %extract_object_tool(Obj,Info_g,GS_g,L1,L3),
   %extract_object_type(Obj,Info_g,GS_g,L3,L4).

extract_same_type_as(_,[],_,L1,L1).

extract_same_type_as(Obj1,[Obj2|LObj],WM_g,L1,L2)
:- member_bt(object_type(X1,T1),WM_g), X1 == Obj1,
   member_bt(object_type(X2,T2),WM_g), X2 == Obj2,
   T1 == T2, !,
   F = same_type_as(Obj1,Obj2),
   extract_same_type_as(Obj1,LObj,WM_g,[F|L1],L2).

extract_same_type_as(Obj1,[_|LObj],WM_g,L1,L2)
:- extract_same_type_as(Obj1,LObj,WM_g,L1,L2).

extract_initially_in_contact(_,[],_,_,L1,L1).

extract_initially_in_contact(Obj_1,[Obj_2|LO],Info_g,IS_g,L1,L2)
:- member_bt(represented_by(C1,V1),IS_g), V1 == Obj_1,
   member_bt(component_contacts(V2,LC),Info_g),V2 == C1,
   member_bt(represented_by(C2,V3),IS_g),V3 == Obj_2,
   strict_member_bt(C2,LC),!,
   F = initially_in_contact_with(Obj_1,Obj_2),
   extract_initially_in_contact(Obj_1,LO,Info_g,IS_g,[F|L1],L2).

extract_initially_in_contact(Obj_1,[_|LO],Info_g,IS_g,L1,L2)
:- extract_initially_in_contact(Obj_1,LO,Info_g,IS_g,L1,L2).

extract_finally_in_contact(_,[],_,_,L1,L1).

extract_finally_in_contact(Obj_1,[Obj_2|LO],Info_g,GS_g,L1,L2)
:- member_bt(represented_by(C1,V1),GS_g), V1 == Obj_1,
   member_bt(component_contacts(V2,LC),Info_g),V2 == C1,
   member_bt(represented_by(C2,V3),GS_g),V3 == Obj_2,
   strict_member_bt(C2,LC),!,
   F = finally_in_contact_with(Obj_1,Obj_2),
   extract_finally_in_contact(Obj_1,LO,Info_g,GS_g,[F|L1],L2).

extract_finally_in_contact(Obj_1,[_|LO],Info_g,GS_g,L1,L2)
:- extract_finally_in_contact(Obj_1,LO,Info_g,GS_g,L1,L2).

extract_object_tool(Obj,Info_g,GS_g,L1,[object_tool(Obj,T)|L1])
:- ( member_bt(object_type(V1,Part),Info_g), V1 == Obj;
     member_bt(object_type(V1,Part),GS_g  ), V1 == Obj
   ),
   member_bt(part_tool(V2,T),Info_g), V2 == Part, !.
   
extract_object_type(Obj,Info_g,GS_g,L1,[object_type(Obj,Part)|L1])
:- ( member_bt(object_type(V1,Part),Info_g), V1 == Obj;
     member_bt(object_type(V1,Part),GS_g  ), V1 == Obj
   ), !.

%

extract_component_features(Comp,_,LComp,_,_,_,[])
:- strict_member(Comp,LComp), !.

extract_component_features(Comp,_,LComp,FS_g,Info_g,_,L4)
:- extract_in_contact_with(Comp,LComp,Info_g,[],L1),
   extract_initially_assembled(Comp,FS_g,L1,L2),
   %extract_assemble_just_before(Comp,LComp,Info_g,L2,L3),
   %extract_assemble_just_after(Comp,LComp,Info_g,L4,L5),
   extract_assemble_before(Comp,LComp,Info_g,L2,L3),
   extract_assemble_after(Comp,LComp,Info_g,L3,L4), !.

extract_in_contact_with(_,[],_,L1,L1).

extract_in_contact_with(Comp,[C|LC],Info_g,L1,L2)
:- member_bt(component_contacts(V1,LComp),Info_g), V1 == Comp,
   strict_member_bt(C,LComp),!,
   F = in_contact_with(Comp,C),
   extract_in_contact_with(Comp,LC,Info_g,[F|L1],L2).

extract_in_contact_with(Comp,[_|LC],Info_g,L1,L2)
:- extract_in_contact_with(Comp,LC,Info_g,L1,L2).

extract_initially_assembled(Comp,FS_g,L1,[F|L1])
:- member_bt(component_assembled(C,_,_),FS_g), Comp == C, !,
   F = initially_assembled(Comp).

extract_initially_assembled(_,_,L1,L1).


extract_assemble_just_before(_,[],_,L1,L1).

extract_assemble_just_before(Comp,[C|LC],Info_g,L1,L2)
:- direct_mate_precedence(Comp,C,Info_g), !,
   F = assemble_just_before(Comp,C),
   extract_assemble_just_before(Comp,LC,Info_g,[F|L1],L2).

extract_assemble_just_before(Comp,[_|LC],Info_g,L1,L2)
:- extract_assemble_just_before(Comp,LC,Info_g,L1,L2).

extract_assemble_before(_,[],_,L1,L1).

extract_assemble_before(Comp,[C|LC],Info_g,L1,L2)
:- indirect_precedence(Comp,C,[],Info_g), !,
   F = assemble_before(Comp,C),
   extract_assemble_before(Comp,LC,Info_g,[F|L1],L2).

extract_assemble_before(Comp,[_|LC],Info_g,L1,L2)
:- extract_assemble_before(Comp,LC,Info_g,L1,L2).

direct_mate_precedence(Comp,C,Info_g)
:- member_bt(part_mate(_,V1,_,_,_,_,_,LNextM),Info_g), 
   V1 == Comp, \+ var(LNextM),
   strict_member_bt(C,LNextM),!.

direct_mate_precedence(Comp,C,Info_g)
:- member_bt(part_mate(_,V1,_,_,_,_,LPrevM,_),Info_g), 
   V1 == C, \+ var(LPrevM),
   strict_member_bt(Comp,LPrevM),!.

indirect_precedence(Comp,C,_,Info_g)
:- direct_mate_precedence(Comp,C,Info_g), !.

indirect_precedence(Comp,C2,Lseen,Info_g)
:- member_bt(part_mate(_,V1,_,_,_,_,_,LNextM),Info_g), 
   V1 == Comp, \+ var(LNextM),
   member_bt(C1,LNextM), \+ strict_member(C1,[Comp|Lseen]),
   indirect_precedence(C1,C2,[Comp|Lseen],Info_g).

indirect_precedence(Comp,C2,Lseen,Info_g)
:- member_bt(part_mate(_,C1,_,_,_,_,LPrevM,_),Info_g), \+ var(LPrevM),
   \+ strict_member(C1,[Comp|Lseen]), strict_member_bt(Comp,LPrevM),
   indirect_precedence(C1,C2,[Comp|Lseen],Info_g).

extract_assemble_just_after(_,[],_,L1,L1).

extract_assemble_just_after(Comp,[C|LC],Info_g,L1,L2)
:- direct_mate_precedence(C,Comp,Info_g), !,
   F = assemble_just_after(Comp,C),
   extract_assemble_just_after(Comp,LC,Info_g,[F|L1],L2).

extract_assemble_just_after(Comp,[_|LC],Info_g,L1,L2)
:- extract_assemble_just_after(Comp,LC,Info_g,L1,L2).


extract_assemble_after(_,[],_,L1,L1).

extract_assemble_after(Comp,[C|LC],Info_g,L1,L2)
:- indirect_precedence(C,Comp,[],Info_g), !,
   F = assemble_after(Comp,C),
   extract_assemble_after(Comp,LC,Info_g,[F|L1],L2).

extract_assemble_after(Comp,[_|LC],Info_g,L1,L2)
:- extract_assemble_after(Comp,LC,Info_g,L1,L2).


