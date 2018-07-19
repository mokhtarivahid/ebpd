%:-setdebug.
%
%
%
%         A Simple Frame Engine with Multiple Inheritance, transitive
%           and intransitive Relations, Methods and Demons
%
%           Luis Seabra Lopes -- Monte da Caparica -- December 1992
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%
%      Creation of Frames, Relations, Slots, Methods, Demons
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


%
%      Object Representation:
%
%      <Frame>(frame_).
%      frame_(<Frame>).
%
%      <Frame>(slot_,<Slot>,<SlotType>). SlotType in { data_or_method,relation }
%      <Frame>(value_,<Slot>,<Value>).
%
%      <Slot>(demon_,<Frame>,<Demon_Fn>,<Access>,<When>,<Effect>).
%
%      <Relation>(relation_,<Transitivity>,<Slot_Restriction>,<Inverse>).
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%% %% %% %% %% %% %% %% %% %% %%
%%  <Frame>(frame_).
%%  frame_(<Frame>).
%%
new_frame(Frame)
    :- nonvar(Frame),
       Term =.. [Frame,frame_],
       not_clause(Term,true),
       assert(Term),
%      write('New frame created: '),write(Frame),nl,
       AltTerm =.. [frame_,Frame],
       assert(AltTerm),!.

frame_exists(Frame)
    :- nonvar(Frame),
       Term =.. [Frame,frame_],
       clause(Term,true),!.

%new_frame(Frame,Parent) 
%    :- new_frame(Frame),
%       new_slot(Frame,isa,Parent).

show_frame(Frame)
    :- nonvar(Frame),
       Term =.. [Frame,frame_],
       clause(Term,true),
       frame_local_slots(Frame,LocS),
       frame_valued_slots(Frame,VS),
       reunion(LocS,VS,LS),
       print_list([nl,'      Frame: ',Frame,' {',nl]),
       show_slots(Frame,LS),
       print_list(['      } ',nl,nl]),!.

show_slots(_,[])
    :- !.

show_slots(Frame,[S|LS])
    :- show_slot(Frame,S),
       show_slots(Frame,LS),!.

show_slot(Frame,Slot)
    :- frame_has_slot(Frame,Slot,_,LSD,LV,_),
       print_list(['        ',Slot,':']),
       show_values(LV),
       print_list([nl]),
       (LSD==[]; print_list(['           Demons: ']), 
                show_demons(LSD), print_list([nl]) ),!.

show_values([])
    :- !.

show_values([V|LV])
    :- print_list([' ',V]),
       show_values(LV).

show_demons(LD)
    :- show_values(LD).

delete_frame(Frame)
    :- nonvar(Frame),
       frame_local_slots(Frame,LLS),
       delete_local_slots(Frame,LLS),
       frame_valued_slots(Frame,LVS),
       delete_valued_slots(Frame,LVS),
       Term =.. [Frame,frame_],
       clause(Term,true),
       retract(Term),
       AltTerm =.. [frame_,Frame],
       retract(AltTerm).
       
delete_local_slots(_,[])
    :- !.

delete_local_slots(Frame,[LS|LLS])
    :- delete_slot(Frame,LS),
       delete_local_slots(Frame,LLS).

delete_valued_slots(_,[])
    :- !.

delete_valued_slots(Frame,[VS|LVS])
    :- delete_slot_values(Frame,VS),
       delete_valued_slots(Frame,LVS).

save_knowledge_base(F)
    :- ( atom(F), name(F,F1); F = F1 ),
       make_extension(F1,FE),
       name(AF,FE),tell(AF), 
       write(':- alldynamic.'),nl,
       list_knowledge_base_terms,
       told.

list_knowledge_base_terms
    :- next_predicate(P,knowledge_base_term),
       write_clause(P),
       fail.

list_knowledge_base_terms.

append_no_bt_frame_kb(Frame,F)
    :- tell(F),
       write(':- alldynamic.'),nl,
       list_kb_termf(Frame),
       told.

list_kb_termf(Frame)
    :- next_predicate(P,knowledge_base_term,Frame),
       write_clause(P),
       fail.

list_kb_termf(_).

get_extension([],[]).

get_extension([46|F],[46|F]).

get_extension([_|F],E)
    :- get_extension(F,E),!.

make_extension(F,FE)
    :- get_extension(F,E),
       ( E==[], append_no_bt(F,".gol",FE); FE=F),!.

write_clause(P)
    :- write(P), write('.'),nl,!.

knowledge_base_term(T)
    :- clause(T,true), T =.. [_,K], K == frame_.

knowledge_base_term(T)
    :- clause(T,true), T =.. [_,K,_,_], K == slot_.

knowledge_base_term(T)
    :- clause(T,true), T =.. [_,K,_,_], K == value_.

knowledge_base_term(T)
    :- clause(T,true), T =.. [_,K,_,_,_,_,_], K == demon_.

knowledge_base_term(T)
    :- clause(T,true), T =.. [_,K,_,_,_], K == relation_.

load_knowledge_base(F)
    :- reconsult(F),!.

%% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %%
%%  <Relation>(relation_,<Transitivity>,<Slot_Restriction>,<Inverse>).
%%
new_relation(Relation,_,_,_)
    :- nonvar(Relation),
       Term =.. [Relation,relation_,_,_,_],
       clause(Term,true),!,fail.

new_relation(Slot,_,_,_)
    :- nonvar(Slot),
       Term =.. [Slot,slot_,_,_,_],
       clause(Term,true),!,fail.

new_relation(Relation,Transitivity,Restriction,Inverse)
    :- nonvar(Relation),
       validate_relation_spec(Transitivity,Restriction),
       consistent_with_inverse(Relation,Inverse),
       Term =.. [Relation,relation_,Transitivity,Restriction,Inverse],
       assert(Term),!.

validate_relation_spec(Transitivity,Restriction)
    :- validate_transitivity(Transitivity),
       validate_restriction(Restriction),!.

validate_transitivity(transitive).
validate_transitivity(intransitive).
validate_restriction(all).
validate_restriction(none).
validate_restriction(inclusion([])).
validate_restriction(inclusion([_|_])).
validate_restriction(exclusion([])).
validate_restriction(exclusion([_|_])).

consistent_with_inverse(_,nil)
    :- !.

consistent_with_inverse(Relation,Inverse)
    :- Inv =.. [Inverse,relation_,_,_,Relation],
       clause(Inv,true),!.

consistent_with_inverse(_,_).

%%

delete_relation(Relation)
    :- current_predicate(_,P),dynamic_functor(P),
       clause(P,true),
       P =.. [_,X,Y,_], X == slot_, Y == Relation, !, fail.

delete_relation(Relation)
    :- nonvar(Relation),
       Term =.. [Relation,relation_,_,_,nil],
       retract(Term),!.

delete_relation(Relation)
    :- nonvar(Relation),
       T1 =.. [Relation,relation_,_,_,Inverse], retract(T1),
       T2 =.. [Inverse,relation_,_,_,Relation], retract(T2),!.

%%

term_is_relation(T)
    :- T =.. [_,relation_,_,_,_],!.

current_relations(ListR)
    :- all_predicate_functors(term_is_relation,ListR).
 
relation_definition(Rel,Trans,SR,Inv)
    :- nonvar(Rel),
       T =.. [Rel,relation_,Trans,SR,Inv],
       clause(T,true),!.


%% %% %% %% %% %% %% %% %% %% %% %% %%
%%  <Frame>(slot_,<Slot>).
%%
new_slot(Frame,Slot)
    :- (var(Frame);var(Slot)),!,fail.

new_slot(Frame,_)
    :- T1 =.. [Frame,frame_],
       not_clause(T1,true),
       !, fail.

new_slot(Frame,Slot)
    :- frame_has_slot(Frame,Slot,_,_,_,_),
       !, fail.

new_slot(Frame,Slot)
    :- determine_slot_type(Slot,SlotType),
       T1 =.. [Frame,slot_,Slot,SlotType],
       assert(T1),!.

%%
new_slot(Frame,Slot,Value)
    :- new_slot(Frame,Slot),
       determine_slot_type(Slot,SlotType),
       put_new_value(Frame,Slot,SlotType,Value),!.

%%

delete_slot(Frame,Slot)
    :- frame_has_slot(Frame,Slot,_,_,_,_),
       delete_slot_values(Frame,Slot),
       remove_all_demons(Frame,Slot),
       Term =.. [Frame,slot_,Slot,_],
       retract(Term),!.

%% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %%
%%  <Slot>(demon_,<Frame>,<Demon_Fn>,<Access>,<When>,<Effect>).
%%
%%  Access in { if_read, if_write, if_delete, if_execute }
%%  When in { before, after }
%%  Effect in { alter_value, side_effect }
%%
new_demon(Frame,Slot,Demon_Fn,Access,When,Effect)
    :- nonvar(Frame),nonvar(Slot),nonvar(Demon_Fn),
       Ilegal =.. [Slot,demon_,Frame,Demon_Fn,_,_,_],
       not_clause(Ilegal,true),
       remove_all_demons(Frame,Slot),
       Term =.. [Slot,demon_,Frame,Demon_Fn,Access,When,Effect],
       assert(Term),!.

add_demon(Frame,Slot,Demon_Fn,Access,When,Effect)
    :- nonvar(Frame),nonvar(Slot),nonvar(Demon_Fn),
       Ilegal =.. [Slot,demon_,Frame,Demon_Fn,_,_,_],
       not_clause(Ilegal,true),
       Term =.. [Slot,demon_,Frame,Demon_Fn,Access,When,Effect],
       assert(Term),!.

remove_all_demons(Frame,Slot)
     :- Term =.. [Slot,demon_,Frame,_,_,_,_],
        retract_all(Term). %% O BIM tem o retractall(Term).

%%

disable_demons
    :- clause(demons_disabled,true),!.

disable_demons
    :- assert(demons_disabled),!.

enable_demons
    :- retract(demons_disabled),!.

%%

fire_demons(_,_,_,_,_,_,_,_,In,In)
    :- clause(demons_disabled,true),!.

fire_demons(_,_,_,[],_,_,_,_,In,In).

fire_demons(Frame,Slot,ST,[Dem|LDem],Access,Number,When,Effect,In,Out)
    :- fire_demon(Frame,Slot,ST,Dem,Access,Number,When,Effect,In,Out1),
       fire_demons(Frame,Slot,ST,LDem,Access,Number,When,Effect,Out1,Out).

fire_demon(Frame,Slot,_,Demon_Fn,Access,many,When,side_effect,In,In) 
    :- Demon =.. [Slot,demon_,_Demon_Fn,Access,When,side_effect],
       clause(Demon,true),
       DemonCall =.. [Demon_Fn,Frame,Slot,In,_],
       ( call(DemonCall);
         !, When \== before ).
fire_demon(_,_,_,_,_,_,_,side_effect,_,_).

fire_demon(Frame,Slot,_,Demon_Fn,Access,one,When,alter_value,In,Out) 
    :- Demon =.. [Slot,demon_,_Demon_Fn,Access,When,alter_value],
       clause(Demon,true),
       DemonCall =.. [Demon_Fn,Frame,Slot,In,Out],
       call(DemonCall).

fire_demon(_,_,_,_,_,one,_,alter_value,In,In).

fire_demon(_,_,_,_,_,many,_,alter_value,[],[]) :- !.

fire_demon(Frame,Slot,ST,D_Fn,Acc,many,Wh,alter_value,[InV|InL],[OutV|OutL]) 
    :- fire_demon(Frame,Slot,ST,D_Fn,Acc,one,Wh,alter_value,InV,OutV),
       fire_demon(Frame,Slot,ST,D_Fn,Acc,many,Wh,alter_value,InL,OutL),!.

%% %% %% %% %% %% %% %% %% %% %% %% %% %%
%%  <Frame>(value_,<Slot>,<Value>).
%% 

new_value(Frame,Slot,Val)
    :- nonvar(Frame),nonvar(Slot),nonvar(Val),
       frame_has_slot(Frame,Slot,ST,LSD,_,_),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,before,side_effect,[Val],_),
       fire_demons(Frame,Slot,ST,LSD,if_write,one,before,alter_value,Val,V),
       delete_slot_values(Frame,Slot),
       put_new_value(Frame,Slot,ST,V),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,after,side_effect,[Val],_),!.

add_value(Frame,Slot,Val)
    :- nonvar(Frame),nonvar(Slot),nonvar(Val),
       frame_has_slot(Frame,Slot,ST,LSD,_,_),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,before,side_effect,[Val],_),
       fire_demons(Frame,Slot,ST,LSD,if_write,one,before,alter_value,Val,V),
       put_new_value(Frame,Slot,ST,V),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,after,side_effect,[Val],_),!.

put_new_value(Frame,Slot,data_or_method,Value)
    :- Term =.. [Frame,value_,Slot,Value],
       assert(Term),!.

put_new_value(Frame,Relation,relation,Related)
    :- T1 =.. [Related,frame_],clause(T1,true),
       T2 =.. [Relation,relation_,_,_,Inverse],clause(T2,true),
       T3 =.. [Frame,value_,Relation,Related],
       assert(T3),
       put_in_related(Frame,Inverse,Related).

put_in_related(_,nil,_)
    :- !.

put_in_related(Frame,Inverse,Related)
    :- T1 =.. [Related,value_,Inverse,Frame],
       assert(T1),!.

new_values(Frame,Slot,LV)
    :- nonvar(Frame),nonvar(Slot),
       frame_has_slot(Frame,Slot,ST,LSD,_,_),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,before,side_effect,LV,_),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,before,alter_value,LV,LV1),
       delete_slot_values(Frame,Slot),
       put_new_values(Frame,Slot,ST,LV1),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,after,side_effect,LV,_),!.

put_new_values(_,_,_,[])
    :- !.

put_new_values(Frame,Slot,SlotType,[V|LV])
    :- put_new_value(Frame,Slot,SlotType,V),
       put_new_values(Frame,Slot,SlotType,LV).

add_values(Frame,Slot,LV)
    :- nonvar(Frame),nonvar(Slot),
       frame_has_slot(Frame,Slot,ST,LSD,_,_),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,before,side_effect,LV,_),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,before,alter_value,LV,LV1),
       put_new_values(Frame,Slot,ST,LV1),
       fire_demons(Frame,Slot,ST,LSD,if_write,many,after,side_effect,LV,_),!.

%%

get_value(Frame,Slot,Value)
    :- frame_has_slot(Frame,Slot,ST,LSD,LV,_),
       fire_demons(Frame,Slot,ST,LSD,if_read,many,before,side_effect,LV,_),
       ( LV = [], V= nil; LV = [V|_] ),
       fire_demons(Frame,Slot,ST,LSD,if_read,one,after,alter_value,V,Value),
       fire_demons(Frame,Slot,ST,LSD,if_read,many,after,side_effect,LV,_),!.

get_values(Frame,Slot,LV)
    :- frame_has_slot(Frame,Slot,ST,LSD,LV1,_),
       fire_demons(Frame,Slot,ST,LSD,if_read,many,before,side_effect,LV1,_),
       fire_demons(Frame,Slot,ST,LSD,if_read,many,after,alter_value,LV1,LV),
       fire_demons(Frame,Slot,ST,LSD,if_read,many,after,side_effect,LV1,_),!.

%% 

frame_slot_values(Frame,Slot,Values)
    :- nonvar(Frame), nonvar(Slot),
       Term =.. [Frame,value_,Slot,Val],
       bagof(Val,clause(Term,true),Values),!.
frame_slot_values(_,_,[]).

%%

delete_value(Frame,Relation,Related)
    :- nonvar(Frame),nonvar(Relation),
       frame_has_slot(Frame,Relation,relation,LSD,_,_),
      fire_demons(Frame,Slot,ST,LSD,if_delete,one,before,side_effect,Related,_),
       T1 =.. [Frame,value_,Relation,Related],
       retract_all(T1),
       T2 =.. [Relation,relation_,_,_,Inverse],clause(T2,true),
       delete_in_related(Frame,Inverse,Related),
     fire_demons(Frame,Slot,ST,LSD,if_delete,one,after,side_effect,Related,_),!.

delete_value(Frame,Slot,Val)
    :- nonvar(Frame),nonvar(Slot),
       ST = data_or_method,frame_has_slot(Frame,Slot,ST,LSD,_,_),
       fire_demons(Frame,Slot,ST,LSD,if_delete,one,before,side_effect,Val,_),
       fire_demons(Frame,Slot,ST,LSD,if_delete,one,before,alter_value,Val,V),
       Term =.. [Frame,value_,Slot,V],
       retract_all(Term),
       fire_demons(Frame,Slot,ST,LSD,if_delete,one,after,side_effect,Val,_),!.

delete_in_related(_,nil,_)
    :- !.

delete_in_related(Frame,Inverse,Related)
    :- determine_slot_demons_frame(Related,Inverse,_),
       T1 =.. [Related,value_,Inverse,Frame],
       retract_all(T1),!.

delete_values(Frame,Slot)
    :- nonvar(Frame),nonvar(Slot),
       ST = data_or_method,frame_has_slot(Frame,Slot,ST,LSD,LV,_),
       %determine_slot_type(Slot,SlotType),
       fire_demons(Frame,Slot,ST,LSD,if_delete,many,before,side_effect,LV,_),
       delete_slot_values(Frame,Slot),
       fire_demons(Frame,Slot,ST,LSD,if_delete,many,after,side_effect,LV,_),!.

delete_slot_values(Frame,Slot)
    :- nonvar(Frame), nonvar(Slot),
       T1 =.. [Frame,value_,Slot,Value],
       ( setof(Value,clause(T1,true),LVal); LVal = []),
       determine_slot_type(Slot,SlotType),
       delete_slot_values(Frame,Slot,SlotType,LVal).

delete_slot_values(_,_,data_or_method,[]).

delete_slot_values(Frame,Slot,data_or_method,[V|LV])
    :- remove_value(Frame,Slot,V),
       delete_slot_values(Frame,Slot,data_or_method,LV).

delete_slot_values(Frame,Relation,relation,LR)
    :- T =.. [Relation,relation_,_,_,Inverse], clause(T,true),
       delete_all_links(Frame,Relation,Inverse,LR).

delete_all_links(_,_,_,[]).

delete_all_links(Frame,Relation,Inverse,[R|LR])
    :- remove_value(Frame,Relation,R),
       delete_in_related(Frame,Inverse,R),
       delete_all_links(Frame,Relation,Inverse,LR).

remove_value(Frame,Slot,Val)
    :- Term =.. [Frame,value_,Slot,Val],
       retract_all(Term).

%%

call_method(Frame,Slot)
    :- call_method(Frame,Slot,[]).

call_method_0(Frame,Slot)
    :- call_method(Frame,Slot,[]).

call_method_1(Frame,Slot,P)
    :- call_method(Frame,Slot,[P]).

call_method_2(Frame,Slot,P1,P2)
    :- call_method(Frame,Slot,[P1,P2]).

call_method_3(Frame,Slot,P1,P2,P3)
    :- call_method(Frame,Slot,[P1,P2,P3]).

call_method(Frame,Slot,LP)
    :- nonvar(Frame), nonvar(Slot),
       ST = data_or_method,frame_has_slot(Frame,Slot,ST,LSD,[Val|_],_),
       atom(Val),
       fire_demons(Frame,Slot,ST,LSD,if_execute,many,before,side_effect,LP,_),
       fire_demons(Frame,Slot,ST,LSD,if_execute,many,before,alter_value,LP,LP1),
       Term =.. [Val,Frame|LP1],
       call(Term),
       fire_demons(Frame,Slot,ST,LSD,if_execute,many,after,side_effect,LP,_),!.

call_method(Frame,Owner^Slot,LP)
    :- nonvar(Frame), nonvar(Slot), nonvar(Owner),
       ST = data_or_method,frame_has_slot(Owner,Slot,ST,LSD,[Mth|_],Path),
       atom(Mth),
       frame_inherits_owner_slot(Frame,Owner,Slot,Path),
       fire_demons(Frame,Slot,ST,LSD,if_execute,many,before,side_effect,LP,_),
       fire_demons(Frame,Slot,ST,LSD,if_execute,many,before,alter_value,LP,LP1),
       Term =.. [Mth,Frame|LP1],
       call(Term),
       fire_demons(Frame,Slot,ST,LSD,if_execute,many,after,side_effect,LP,_),!.

frame_inherits_owner_slot(Frame,Owner,Slot,Path)
    :- T1 =.. [Frame,value_,Rel,Owner], clause(T1,true),
       T2 =.. [Rel,relation_,_,SR,_], clause(T2,true),
       frame_local_slots(Owner,L1),
       consider_slot_restriction(L1,SR,L2),
       frame_inherits_owner_slot(Frame,Owner,Slot,Path,L2).

frame_inherits_owner_slot(_,Owner,Slot,[Owner],ConsiderSolts)
    :- member_no_bt(Slot,ConsiderSolts),!.

frame_inherits_owner_slot(_,Owner,_,[Owner,Next|_],ConsiderSolts)
    :- T =.. [Owner,value_,Rel,Next], clause(T,true),
       member_no_bt(Rel,ConsiderSolts),!.


%
%      Relations-related Predicates:
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

frame_has_slot(Frame,Slot,SlotType,SlotDemons,Values,[Frame|Path])
    :- frame_has_slot(Frame,Slot,all,transitive_intransitively,_,_,Path),
       determine_slot_type(Slot,SlotType),
       determine_slot_demons([Frame|Path],Slot,SlotDemons),
       determine_slot_values([Frame|Path],Slot,Values). %,!.

frame_has_slot(Frame,InverseRel,relation,[],Values,[])
    :- frame_actual_relations(Frame,AR),
       member_no_bt(InverseRel,AR),
       frame_slot_values(Frame,InverseRel,Values),!.

%%

determine_slot_type(Slot,relation)
    :- T1 =.. [Slot,relation_,_,_,_],
       clause(T1,true),!.
determine_slot_type(_,data_or_method) :- !.

determine_slot_demons_frame(Frame,Slot,SlotDemons)
    :- T1 =.. [Slot,demon_,Frame,Demon_Fn,A,W,E],
       setof(Demon_Fn,(A,W,E)^clause(T1,true),SlotDemons),!.
determine_slot_demons_frame(_,_,[]) :- !.

determine_slot_demons([Frame|_],Slot,SlotDemons)
    :- T1 =.. [Slot,demon_,Frame,Demon_Fn,A,W,E],
       setof(Demon_Fn,(A,W,E)^clause(T1,true),SlotDemons),!.
determine_slot_demons([_|Path],Slot,Values)
    :- determine_slot_demons(Path,Slot,Values), !.
determine_slot_demons([],_,[])
    :- !.


determine_slot_values([Frame|_],Slot,Values)
    :- frame_valued_slots(Frame,LS),
       member_no_bt(Slot,LS),!,
       frame_slot_values(Frame,Slot,Values).
determine_slot_values([_|Path],Slot,Values)
    :- determine_slot_values(Path,Slot,Values), !.
determine_slot_values([],_,[])
    :- !.

%%

frame_has_slot(Frame,Slot,SR,_,ST,Values,[])
    :- frame_local_slots(Frame,L1),
       consider_slot_restriction(L1,SR,L2),
       member_no_bt(Slot,L2),!,
       frame_slot_values(Frame,Slot,Values),
       Term =.. [Frame,slot_,Slot,ST],
       clause(Term,true).

% Isto era no Golog1.0:
% Voltou a ser ...
% Nao sei porque tinha tirado ...
% Voltou a ficar comentario ...
%frame_has_slot(Frame,Slot,SR,_,unknown,Values,[])
%    :- frame_valued_slots(Frame,L1),
%       consider_slot_restriction(L1,SR,L2),
%       member(Slot,L2),!,
%       frame_slot_values(Frame,Slot,Values).

frame_has_slot(Frame,Slot,SR,transitive_intransitively,ST,Values,Path)
    :- frame_actual_relations(Frame,L1,transitive),
       consider_slot_restriction(L1,SR,L2),
       frame_inherits_slot(Frame,Slot,L2,
             transitive_intransitively,ST,Values,Path).

frame_has_slot(Frame,Slot,SR,transitive_intransitively,ST,Values,Path)
    :- frame_actual_relations(Frame,L1,intransitive),
       consider_slot_restriction(L1,SR,L2),
       frame_inherits_slot(Frame,Slot,L2,transitively,ST,Values,Path).

frame_has_slot(Frame,Slot,SR,transitively,ST,Values,Path)
    :- frame_actual_relations(Frame,L1,transitive),
       consider_slot_restriction(L1,SR,L2),
       frame_inherits_slot(Frame,Slot,L2,transitively,ST,Values,Path).

%%  

frame_inherits_slot(_,_,[],_,_,_,_)
    :- !,fail.

frame_inherits_slot(Frame,Slot,LR,Inheritance_Mode,ST,Values,Path)
    :- setof([PF,SlotR],
                Rel^Tr^Inv^( member_bt(Rel,LR),
                      T2 =.. [Frame,value_,Rel,PF],
                      T3 =.. [Rel,relation_,Tr,SlotR,Inv],
                      clause(T2,true),clause(T3,true),Inv \== Slot),LPF),
       slot_inherited_from_relatives(Slot,LPF,Inheritance_Mode,ST,Values,Path).

slot_inherited_from_relatives(_,[],_,_,_,_) 
    :- !, fail.

slot_inherited_from_relatives(Slot,[[PF,SR]|_],InheritMode,ST,Values,[PF|Path])
    :- frame_has_slot(PF,Slot,SR,InheritMode,ST,Values,Path).

slot_inherited_from_relatives(Slot,[_|LR],Inheritance_Mode,ST,Values,Path) 
    :- slot_inherited_from_relatives(Slot,LR,Inheritance_Mode,ST,Values,Path).

%%

frame_local_slots(Frame,LSlot)
    :- nonvar(Frame),
       Term=..[Frame,slot_,Slot,ST],
       setof(Slot,ST^clause(Term,true),LSlot),!.
frame_local_slots(_,[]).

get_local_slots(Frame,LSlot)
    :- frame_local_slots(Frame,LSlot).

frame_valued_slots(Frame,LSlot)
    :- nonvar(Frame),
       Term =.. [Frame,value_,Slot,Val],
       setof(Slot,Val^clause(Term,true),LSlot),!.
frame_valued_slots(_,[]).

frame_local_relations(Frame,LR,Transitivity)
    :- nonvar(Frame),
       Term =.. [Frame,slot_,Relation,relation],
       setof(Relation,
                SR^Inv^(clause(Term,true),
                      TT =.. [Relation,relation_,Transitivity,SR,Inv],
                      clause(TT,true)),LR).
frame_local_relations(_,[],_).

frame_actual_relations(Frame,LR)
    :- frame_actual_relations(Frame,LR1,transitive),
       frame_actual_relations(Frame,LR2,intransitive),
       append_no_bt(LR1,LR2,LR).

frame_actual_relations(Frame,LR,Transitivity)
    :- nonvar(Frame),
       setof(Slot,(T1,T2,Value,SR,Inv)^( 
                      T1 =.. [Frame,value_,Slot,Value],
                      clause(T1,true),
                      T2 =.. [Slot,relation_,Transitivity,SR,Inv],
                      clause(T2,true)),LR),!.
frame_actual_relations(_,[],_).

%%

consider_slot_restriction(L,all,L)
    :- !.

consider_slot_restriction(_,none,[])
    :- !.

consider_slot_restriction(L1,inclusion(SR),L2)
    :- consider_slot_restriction(inclusion,L1,SR,L2),!.

consider_slot_restriction(L1,exclusion(SR),L2)
    :- consider_slot_restriction(exclusion,L1,SR,L2),!.


consider_slot_restriction(inclusion,[S|L],SR,[S|T])
    :- member_no_bt(S,SR),
       consider_slot_restriction(inclusion,L,SR,T).

consider_slot_restriction(inclusion,[_|L],SR,T)
    :- consider_slot_restriction(inclusion,L,SR,T).

consider_slot_restriction(exclusion,[S|L],SR,T)
    :- member_no_bt(S,SR),
       consider_slot_restriction(exclusion,L,SR,T).

consider_slot_restriction(exclusion,[S|L],SR,[S|T])
    :- consider_slot_restriction(exclusion,L,SR,T).

consider_slot_restriction(_,[],_,[])
    :- !.



%%
not_clause(T,X)
    :- clause(T,X),!, fail.

not_clause(_,_).
%%

%
% Get all local or inherited slots in a frame.
% % % % % % % % % % % % % % % % % % % % % % % %

get_all_slots(Frame,LS)
    :- get_all_slots(Frame,all,trans_intrans,[],LS).

get_all_slots(Frame,SR,Trans,Inv,LS)
    :- frame_local_slots(Frame,L1),
       consider_slot_restriction(L1,SR,L2),
       frame_actual_relations(Frame,L3),
       consider_slot_restriction(L3,SR,L4),
       consider_slot_restriction(L4,exclusion(Inv),L5),
       reunion(L2,L5,L6),
       get_all_inherited_slots(Frame,Trans,L5,L7),
       reunion(L6,L7,LS),!.

get_all_inherited_slots(_,_,[],[])
    :- !.

get_all_inherited_slots(Frame,Trans,[R|LR],LS)
    :- get_slots_inherited_by_relation(Frame,Trans,R,L1),
       get_all_inherited_slots(Frame,Trans,LR,L2),
       reunion(L1,L2,LS),!.

get_slots_inherited_by_relation(_,trans,Rel,[])
    :- T1 =.. [Rel,relation_,intransitive,_,_], clause(T1,true), !.

get_slots_inherited_by_relation(Frame,trans_intrans,Rel,LS)
    :- T1 =.. [Rel,relation_,intransitive,SR,Inv], clause(T1,true), 
       setof(F,T2^( T2 =.. [Frame,value_,Rel,F],clause(T2,true) ), LF),
       get_all_slots_in_frame_list(LF,trans,SR,Inv,LS),!.

get_slots_inherited_by_relation(Frame,Trans,Rel,LS)
    :- T1 =.. [Rel,relation_,transitive,SR,Inv], clause(T1,true),
       setof(V,T2^( T2 =.. [Frame,value_,Rel,V],clause(T2,true) ), LF),
       get_all_slots_in_frame_list(LF,Trans,SR,Inv,LS),!.
       
get_all_slots_in_frame_list([],_,_,_,[]) :- !.

get_all_slots_in_frame_list([Frame|LF],Trans,SR,Inv,LS)
    :- get_all_slots(Frame,SR,Trans,[Inv],L1),
       get_all_slots_in_frame_list(LF,Trans,SR,Inv,L2),
       reunion(L1,L2,LS),!.

%%  

