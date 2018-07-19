%:- setdebug.
%%% 
%%%    Utilities Predicates
%%%

% :- use_module(library(charsio)).


ordenar([],_,_,[]):-!.

ordenar(L,Criterio,Args,[Best|RestOrd])
    :- buscar_melhor(L,Criterio,Args,Best,Rest),
       ordenar(Rest,Criterio,Args,RestOrd),!.

buscar_melhor([H],_,_,H,[])
    :- !.
buscar_melhor([H|L],Criterio,Args,Best,[BB|Rest])
    :- buscar_melhor(L,Criterio,Args,B,Rest),
       score(H,Criterio,Args,SH), score(B,Criterio,Args,SB),
       ( SH>SB, P = [H,B]; P = [B,H] ),
       P = [Best,BB].
       
score(X,Criterio,Args,SX)
    :- Term =.. [Criterio,X,SX|Args],
       call(Term).

criterio_exemplo(X,1,Arg)
    :- member_no_bt(X,Arg).

criterio_exemplo(_,0,_).

%list_length([],0)
%    :- !.
%list_length([_|T],M)
%    :- list_length(T,N),
%       M is N+1.

list_length([_|T],M)
    :- !,
       list_length(T,N),
       M is N+1.
list_length(_,0).

member_extract(X,[X|L],L)
    :- !.

member_extract(X,[Y|L],[Y|LL])
    :- member_extract(X,L,LL),!.

%

strict_set_difference([],_,[])
    :- !.
strict_set_difference([E|S1],S2,S)
    :- strict_member(E,S2),!,strict_set_difference(S1,S2,S).
strict_set_difference([E|S1],S2,[E|S])
    :- strict_set_difference(S1,S2,S).

%

intersection_bt([],_,[]).

intersection_bt([X|S1],S2,[X|S])
    :- member_bt(X,S2),
       intersection_bt(S1,S2,S).

intersection_bt([_|S1],S2,S)
    :- intersection_bt(S1,S2,S).

%

strict_intersection([],_,[])
    :- !.

strict_intersection([X|S1],S2,[X|S])
    :- strict_member(X,S2),!,
       strict_intersection(S1,S2,S).

strict_intersection([_|S1],S2,S)
    :- !, strict_intersection(S1,S2,S).

%

strict_intersection_bt([],_,[]).

strict_intersection_bt([X|S1],S2,[X|S])
    :- strict_member_bt(X,S2),
       strict_intersection_bt(S1,S2,S).

strict_intersection_bt([_|S1],S2,S)
    :- strict_intersection_bt(S1,S2,S).

%

contained([],_)
    :- !.

contained([H|T],L)
    :- member_no_bt(H,L),
       contained(T,L).


no_repeatitions([])
    :- !.

no_repeatitions([X|L])
    :- strict_member(X,L),!,fail.

no_repeatitions([_|L])
    :- no_repeatitions(L),!.

%% 

member_no_bt(X,[X|_])
    :- !.
member_no_bt(X,[_|L])
    :- member_no_bt(X,L).

member_bt(X,[X|_]).
member_bt(X,[_|L])
    :- member_bt(X,L).

strict_member(X,[Y|_])
    :- X == Y, !.

strict_member(X,[_|L])
    :- strict_member(X,L),!.

strict_member_bt(X,[Y|_])
    :- X == Y.

strict_member_bt(X,[_|L])
    :- strict_member_bt(X,L).

get_member(X,[X|L],L)
:- !.
get_member(X,[Y|L],[Y|L1])
:- get_member(X,L,L1).


variable_set([],[])
    :-!.
variable_set([T|LT],LVS)
    :- varlist(T,TVS),
       variable_set(LT,LTVS),
       append_no_bt(TVS,LTVS,LVS),!.

term_variable_set(T,VS)
    :- T =.. [_|A],
       filter_constants(A,VS).

filter_constants([],[])
    :- !.
filter_constants([CV|LCV],[CV|LV])
    :- var(CV), filter_constants(LCV,LV).
filter_constants([_|LCV],LV)
    :- filter_constants(LCV,LV).

argument_set([],[])
    :- !.
argument_set([T|LT],LAS)
    :- T =.. [_|LA],
       argument_set(LT,LTAS),
       append_no_bt(LA,LTAS,LAS),!.

append_no_bt([],L,L)
    :- !.
append_no_bt([H|T],L,[H|L1])
    :- append_no_bt(T,L,L1).

%

reunion([],L,L)
    :- !.

reunion([H|T],L,L1)
    :- member(H,L),
       reunion(T,L,L1),!.

reunion([H|T],L,[H|T1])
    :- reunion(T,L,T1),!.

%

%strict_reunion(+Set1, +Set2, -Set3)
strict_reunion([],L,L)
    :- !.

strict_reunion([H|T],L,L1)
    :- strict_member(H,L), !,
       strict_reunion(T,L,L1).

strict_reunion([H|T],L,[H|T1])
    :- strict_reunion(T,L,T1).

%

%% keep the order of Set1
%strict_reunion_ordered(+Set1, +Set2, -Set3)
strict_reunion_ordered(L1,L2,L3)
    :- strict_subtract(L1,L2,NL2),
       append(L1,NL2,L3).

%

%strict_subtract(+Set, +Delete, -Result)
strict_subtract(_,[],[])
    :- !.
strict_subtract(L1,[H|L2],NL2)
    :- strict_member(H,L1), !,
       strict_subtract(L1,L2,NL2), !.
strict_subtract(L1,[H|L2],[H|NL2])
    :- strict_subtract(L1,L2,NL2), !.

%

%strict_delete(+List1, @Elem, -List2)
strict_delete([],_,[])
    :- !.
strict_delete([X|L],X,NL)
    :- strict_delete(L,X,NL), !.
strict_delete([H|L],X,[H|NL])
    :- strict_delete(L,X,NL), !.

%

%%  strict_subtract([], _, []).
%%  strict_subtract([H|T], L2, L3) :-
%%          strict_member(H, L2),
%%          !,
%%          strict_subtract(T, L2, L3).
%%  strict_subtract([H|T1], L2, [H|T3]) :-
%%          strict_subtract(T1, L2, T3).

%

%strict_equal(+Set1, +Set2).
strict_equal([],[]).
strict_equal([Ha|Ta],[Hb|Tb]) :-
   Ha == Hb, strict_equal(Ta,Tb).

%

%strict_indexOf(+Set, +@Elem, -@Index):-!.
strict_indexOf([V|_],E,1):- V == E, !.
strict_indexOf([_|T],V,I) :- strict_indexOf(T,V,J), I is J+1.

strict_indexOfWithNoEntry(L,E,I):-
    strict_indexOf(L,E,I), !.
strict_indexOfWithNoEntry(_,_,-1).

%

%indexOf(+Set, +@Elem, -@Index):-!.
indexOf([V|_],V,1):-!.
indexOf([_|T],V,I) :- indexOf(T,V,J), I is J+1.

indexOfWithNoEntry(L,E,I):-
    indexOf(L,E,I), !.
indexOfWithNoEntry(_,_,-1).

%

% assert e retract retrocediveis
% so funciona para factos completamente instanciados

assert_fact_bt(F)
:- assert(F).

assert_fact_bt(F)
:- !, retract(F).

retract_fact_bt(F)
:- \+ clause(F,true), !, fail.

retract_fact_bt(F)
:- retract(F).

retract_fact_bt(F)
:- !, assert(F).

%

make_flat([],[]) :- !.
make_flat([H|T],L)
    :- make_flat(T,TF),
       append_no_bt(H,TF,L),!.


%nao interessa:
%flat_special([],_,[]) :- !.
%
%flat_special([[G,H]|T],G,L)
%    :- flat_special(T,G,TF),
%       append_no_bt(H,TF,L),!.


next_predicate(P,Criterio)
    :- current_predicate(_,P),dynamic_functor(P),
       T =.. [Criterio,P],
       call(T).

next_predicate(P,Criterio,Frame)
    :- current_predicate(_,P),dynamic_functor(P),
       T=..[Criterio,P],
       functor(P,Frame,_),
       call(T).
%%


all_predicate_functors(Criterio,LPF)
    :- all_predicate_functors(Criterio,[],LPF).

all_predicate_functors(Criterio,L1,L2)
    :- next_predicate(P,Criterio),
       P =.. [F|_], \+ member(F,L1),
       all_predicate_functors(Criterio,[F|L1],L2),!.

all_predicate_functors(_,L,L) :- !.



%%
%%

map_apply(IL,Transformation,OL)
:- T =.. [Transformation,X,Y],
   setof(Y,X^(member_bt(X,IL),call(T)),OL).

map_remove_if(IL,Criterio,OL)
:- T =.. [Criterio,X],
   setof(X,(member_bt(X,IL),\+ call(T)),OL).

make_a_vector(_,_,[],N)
:- N<1,!.

make_a_vector(Element,Par,[E|Vect],N)
:- T =.. [Element,E,Par], call(T),
   M is N-1, make_a_vector(Element,Par,Vect,M),!.


append_no_bt_strings([],[])
:- !.

append_no_bt_strings([S],S)
:- !.

append_no_bt_strings([S|LS],SS)
:- append_no_bt_strings(LS,S1),
   sprintf(SS,'%s %s',[S,S1]),!.

retract_all(T)
:- retract(T),fail.

retract_all(_).

print_list([]) :- !.
print_list([nl|L]) :- nl, print_list(L), !.
print_list([ln|L]) :- nl, print_list(L), !.
print_list([X|L]) :- write(X), print_list(L),!.

%%%%

find_minmax([X],X,X)
:- !.

find_minmax([X|L],Min,Max)
:- find_minmax(L,A,B), 
   ( X<A, Min = X; Min = A), 
   ( X>B, Max = X; Max = B),!.

%%

show_list([]) :- !.

show_list([H|T])
:- print_list(['     ',H,nl]),
   show_list(T),!.


%%

update_atom_serial_number(AN)
:- clause(atom_serial_number(_),true),
   retract(atom_serial_number(N)),
   AN is N+1,
   assert(atom_serial_number(AN)),!.

update_atom_serial_number(0)
:- assert(atom_serial_number(0)),!.

generate_atom(_,Atom)
:- atom(Atom).

generate_atom(Prefix,Atom)
:- name(Prefix,L1),
   update_atom_serial_number(N),
   % swrite(AN,N),
   name(N,L2),
   % number_to_chars(N,L2),
   append_no_bt(L1,L2,L3),
   name(Atom,L3).
 
 



%%

lista([]).

lista([_|_]).

%%
