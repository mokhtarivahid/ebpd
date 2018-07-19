
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
%   Abstract Operators & Feature Extraction (for Case-Based Reasoning):
%   (C) L. Seabra Lopes, FCT/UNL, Monte da Caparica, February 1996
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%%
%% Abstraction of situation description predicates:
%%


abstract_situation_descriptor(robot_free(_),free).
abstract_situation_descriptor(represented_by(C,X),reby(C,X)).
abstract_situation_descriptor(component_assembled(C,_,_),assembled(C)).
abstract_situation_descriptor(object_in_robot(X,_),holding(X)).
abstract_situation_descriptor(part_available_in_feeder(X,_),available(X)).
abstract_situation_descriptor(object_on_table(X),available(X)).
abstract_situation_descriptor(part_in_pallet(X,_),available(X)).
abstract_situation_descriptor(part_in_pallet(X,_),available(X)).
abstract_situation_descriptor(defective(X),defective(X)).
abstract_situation_descriptor(object_type(X,Type),object_type(X,Type)).


%%
%% Generate abstract state description:
%%

abstract_situation_description([],[]).

abstract_situation_description([SD|LSD],[ASD|LASD])
:- abstract_situation_descriptor(SD,ASD),!,
   abstract_situation_description(LSD,LASD).


abstract_situation_description([_|LSD],LASD)
:- abstract_situation_description(LSD,LASD).


%%
%% Abstraction of operators:
%%

abstract_operator_application(feed_pallet(_,_),[]).
abstract_operator_application(putaway_pallet(_,_),[]).
abstract_operator_application(get_tool(_,_,_),[]).
abstract_operator_application(store_tool(_,_,_),[]).
abstract_operator_application(pick_part_from_pallet(_,_,Obj,_,_,_),
   [pick(Obj)]).
abstract_operator_application(place_part_in_pallet(_,_,Obj,_,_,_),
   [place(Obj)]).
abstract_operator_application(pick_part_from_feeder(_,_,Obj,_,_),
   [pick(Obj)]).
abstract_operator_application(putdown_object(_,_,Obj),[place(Obj)]).
abstract_operator_application(pickup_object(_,_,Obj),[pick(Obj)]).
abstract_operator_application(pickup_part(_,_,Obj,_),[pick(Obj)]).
abstract_operator_application(set_fixture_for_product(_,_),[]).
abstract_operator_application(assemble_component(_,_,Obj,Comp,_,_,_),
   [assemble(Obj,Comp)]).
abstract_operator_application(disassemble_component(_,_,Obj,Comp,_,_,_),
   [disassemble(Obj,Comp)]).
abstract_operator_application(feed_part(_,_,_),[]).

%%

%% Definition of abstract operators
%%


abstract_operator(pick(X),
     [],
     [],
     [free,available(X)],
     [holding(X)]
).

abstract_operator(place(X),
     [],
     [],
     [holding(X)],
     [free,available(X)]
).

abstract_operator(assemble(X,C),
     [ object_type(X,Type),
       part_mate(_,C,Type,_,_,_,Prec,_),
       component_contacts(C,LCont)
       ],
     [ not(defective(X)),
       all(P,Prec,assembled(P)),not(assembled(C)),
       all(Co,LCont,([ assembled(Co), reby(Co,Xo) ] -> not(defective(Xo)) ))
       ],
     [ holding(X)],
     [ free,assembled(C),reby(C,X)]
).

abstract_operator(disassemble(X,C),
     [part_mate(_,C,_,_,_,_,_,Prec)],
     [all(P,Prec,not(assembled(P)))],
     [free,assembled(C),reby(C,X)],
     [holding(X)]
).


