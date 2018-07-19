%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This file must implements following predicates:
%% step(+State, -ActionDef, -NewState)
%%   Return descendant of State and ActionDefinition that was used.
%% is_goal(State) - is true when State is a goal state.  
%%  repeating(Goal1, Goal2):-  Goal1 is the same as Goal2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-use_module(library(ordsets)).

make_init_state(I):-
        get_init(I),
        get_goal(G),
        nb_setval(fictiveGoal, G).


make_solution(S, S).

/* every member of StateList is a pair of objects in current state and a state */
%step(+InitialState, +AbstractOp, -Action, -NewState)
step(State, AOp, A, NewState):-
        get_action(A, _),
            %nl,print('Action: '), print(A), nl,

        %--------------------------------------------------------
        %[1] ignore the third class actions (i.e., actions do not 
        %    belonging to neither nil nor abstract actions)
        get_parent(A, Parent),
        (AOp=Parent; Parent=..[nil|_]),

        %--------------------------------------------------------
        %[2] unify static preconditions
        get_static(SWI),
        get_precondition_static(A, SI),
            %print('StaticInfo: '), print(SI), nl,
        unify_preconditions(SI, SWI),
            %print('StaticInfo: '), print(SI), nl,

        %--------------------------------------------------------
        %[3] unify positive preconditions
        get_precondition(A, P),
            %print('Precon: '), print(P), nl,
        unify_preconditions(P, State),
            %print('Precon: '), print(P), nl,

        %--------------------------------------------------------
        %[4] unify positive eauality preconditions
        get_pos_eq_precondition(A, PEq),
            %print('PreconEq: '), print(PEq), nl,
        unify_preconditions_equality(PEq, State),
            %print('PreconEq: '), print(PEq), nl,

        %--------------------------------------------------------
        %[5] unify negative eauality preconditions
        get_neg_eq_precondition(A, NEq),
            %print('PreconEqNeg: '), print(NEq), nl,
        unify_neg_precondition_equality(NEq, State),
            %print('PreconEqNeg: '), print(NEq), nl,

        %--------------------------------------------------------
        %[6] unify negative preconditions
        get_neg_precondition(A, NP),
        unify_neg_precondition(NP, State),

        %--------------------------------------------------------
        %[7] subtract negative effects
        get_negative_effect(A, NE), 
        ord_subtract(State, NE, State2), 

        %--------------------------------------------------------
        %[8] add positive effects
        get_positive_effect(A, PE), 
        ord_union(State2, PE, NewState)

        %--------------------------------------------------------
        %[9] prune unnecessary nil actions
        ,prune(Parent, AOp, PE)
        .

%% keep only nil actions whoes their effects produce 
%% the preconditions of the current absop
prune(P, A, _):- P=..[F|_], A=..[F|_], !.
prune(nil, AO, PE):- 
         findall(A, (get_action(A,_),get_parent(A,AO)), LA),
         prune(PE, LA).

%prune(_, []):-false.
prune(PE, [A|_]):-
         get_precondition(A,APre),
         mysubset(PE,APre), !.
prune(PE, [_|LA]):-
        prune(PE, LA).

%%%%        get_negative_effect(A, NE),
%%%%           %print('\nNegEff: \n'), print(NE), nl,
%%%%        ord_subtract(State, NE, State2),
%%%%        %subtract(State, NE, State2),
%%%%           %print('\nState2: \n'), print(State2), nl,
%%%%
%%%%
%%%%        get_positive_effect(A, PE),
%%%%            %print('\nPosEff: \n'), print(PE), nl,
%%%%        create_map(PE,Map),
%%%%            %print('\nMap: \n'), print(Map), nl,
%%%%        put_items_to_list(Map,NMap),
%%%%            %print('\nNMap: \n'), print(NMap), nl,
%%%%        get_combinations(NMap,MapList),
%%%%            %print('\nMapList: \n'), print(MapList), nl,
%%%%        duplicate_and_map(PE,MapList,PEList,_),
%%%%            %print('\nPEList: \n'), print(PEList), nl,
%%%%        make_new_constants(PEList,PE,GPEList),
%%%%            %print('\nGPEList: \n'), print(GPEList), nl,
%%%%        list_to_ord_set(GPEList,OGPEList),
%%%%            %print('\nOGPEList: \n'), print(OGPEList), nl,
%%%%        member(GPE,OGPEList),
%%%%            %print('\nGPE: \n'), print(GPE), nl,
%%%%
%%%%        unify_positive_effects(PE,GPE),
%%%%            %print('\nPE: \n'), print(PE), nl,
%%%%
%%%%        get_neg_precondition(A, NP),
%%%%            %print('\nNegative Precon: \n'), print(NP), nl,
%%%%        unify_neg_preconditions(NP, State), % it is here because of unification of all variables
%%%%        unify_neg_preconditions(NP, SWI), % it is here because of unification of all variables
%%%%            %print('\nNegative Precon: \n'), print(NP), nl,
%%%%
%%%%        get_pos_or_precondition(A, POP),
%%%%        get_neg_or_precondition(A, NOP),
%%%%            %print('\nNegative Or Precon: \n'), print(POP), nl,
%%%%            %print('\nPositive Or Precon: \n'), print(NOP), nl,
%%%%        unify_or_preconditions(POP, NOP, State), % it is here because of unification of all variables
%%%%            %print('\nNegative Or Precon: \n'), print(POP), nl,
%%%%            %print('\nPositive Or Precon: \n'), print(NOP), nl,
%%%%
%%%%        ord_union(State2, GPE, NewState).
%%%%        %union(State2, GPE, NewState).
%%%%            %print('\nNewState: \n'), print(NewState), nl,
%%%%
%%%%        %get_action_name(A,AN),
%%%%            %format('~w~n', [AN]).



%is_goal(+ActivitySchema,+State):-
%is_goal(AS, S):- AS=nil, !, is_goal(S).
%is_goal(_, S):-
%        goal(G),
%        get_static(SWI),
%        ord_union(SWI, S, NewState),
%        mysubset(G,NewState),
%        print('\nGoal: '-G),nl,!.

is_goal([], _):-
        nb_getval(goal,[]), !.

is_goal(_, S):-
        nb_getval(goal,G), 
        ord_subset(G, S),
        nl,ansi_format([bg(blue)], '~nGoal achieved: ~w~n', [G]),
        !.

%%%is_goal([], S):-
%%%        nb_getval(goal,G),
%%%        %get_static(SI),
%%%        %ord_union(SI, S, State),
%%%        %ord_subset(G, State),
%%%        ord_subset(G, S),
%%%        ansi_format([bold,fg(blue)], '~nGoal achieved: ~w', [G]),
%%%        !.

%is_goal(S):-
%        get_goal(G),
%        not(length(G,0)),
%        ord_subset(G, S).

repeating(S1, S2):-
        S1 = S2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > unify_positive_effects with type checking
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unify_positive_effects(+PositiveEffect,+GroundPositiveEffect)
unify_positive_effects([],_).
unify_positive_effects([P|PE],GPE):-
    P=..[F|_],
    F = 'get_new_constant',
    unify_positive_effects(PE,GPE).

unify_positive_effects([P|PE],GPE):-
    P=..[F|_],
    F = 'get_type',
    unify_positive_effects(PE,GPE).

unify_positive_effects([P|PE],GPE):-
    P=..[F|_],
    F = 'member',
    unify_positive_effects(PE,GPE).

unify_positive_effects([P|PE],GPE):-
    member(P,GPE),
    unify_positive_effects(PE,GPE).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > unify_preconditions with type checking
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%unify_preconditions(+Subset, +Set, +RequiredKeys, +Action)
% It is similar to mysubset/2, but if there is typing in domain checks the type
% of variables as well.
unify_preconditions([],_,_,_).
unify_preconditions(P,S,R,_):- not(member(typing,R)), !, mysubset(P,S).

unify_preconditions([X|Y],S,R,A):-
    X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    Fx='=',
    ground(X),
    %atom(Px1),atom(Px2),
    %is_equal(Px1,Px2),!,
    Px1=Px2,!,
    unify_preconditions(Y,S,R,A).

unify_preconditions([X|Y],S,R,A):-
    %X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    %(atom(Px1);atom(Px2)),!,
    ground(X), !,
    member(X,S),
    unify_preconditions(Y,S,R,A).

unify_preconditions([X|Y],S,R,A):-
    X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    get_parameters(A,PL),
    var(Px1),get_type_of(PL,Px1,Tx1),
    var(Px2),get_type_of(PL,Px2,Tx2),!,
    member(Ps,S), Ps=..[Fs|[Ps1|[Ps2]]],
    Fs=Fx,
    get_type_of(Ps1,Ts1),get_type_of(Ps2,Ts2),
    is_subclass(Ts1,Tx1),
    is_subclass(Ts2,Tx2),
    Px1=Ps1,
    Px2=Ps2,
    unify_preconditions(Y,S,R,A).

unify_preconditions([X|Y],S,R,A):-
    X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    get_parameters(A,PL),
    var(Px2),get_type_of(PL,Px2,Tx2),!,
    member(Ps,S), Ps=..[Fs|[Ps1|[Ps2]]],
    Fs=Fx,
    get_type_of(Ps2,Ts2),
    is_subclass(Ts2,Tx2),
    Px1=Ps1,
    Px2=Ps2,
    unify_preconditions(Y,S,R,A).

unify_preconditions([X|Y],S,R,A):-
    X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    get_parameters(A,PL),
    var(Px1),get_type_of(PL,Px1,Tx1),!,
    member(Ps,S), Ps=..[Fs|[Ps1|[Ps2]]],
    Fs=Fx,
    get_type_of(Ps1,Ts1),
    is_subclass(Ts1,Tx1),
    Px1=Ps1,
    Px2=Ps2,
    unify_preconditions(Y,S,R,A).

unify_preconditions([X|Y],S,R,A):-
    member(X,S),
    unify_preconditions(Y,S,R,A).

%unify_neg_preconditions(+NegativePrecon, +State)
unify_neg_preconditions([],_):-!.
unify_neg_preconditions([X|_],_):-
    X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    Fx='=',
    atom(Px1),atom(Px2),
    Px1=Px2,!,false.
unify_neg_preconditions([X|Y],S):-
    X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    Fx='=',
    atom(Px1),atom(Px2),
    Px1\=Px2,!,
    unify_neg_preconditions(Y,S).
unify_neg_preconditions([X|Y],S):- not(member(X,S)), unify_neg_preconditions(Y,S).

%is_subclass(+Term,+Type)
is_subclass(V,T):- V=T,!.
is_subclass(V,T):- get_sub_type(T,L), member(V,L).

%get_type_of(+Term,-Type)
% returns type of given term in domain constants or domain type or problem objects
get_type_of(P,P):- is_type(P),!.
get_type_of(P,T):- nb_getval(objects,L), get_type_of(L,P,T),!.
get_type_of(P,T):- nb_getval(constants,L), get_type_of(L,P,T),!.

%get_type_of(+ParametersList,+Variable,-Type)
get_type_of([],_,nil):- !, fail.
get_type_of([X|_],V,T):- X=..[T|[VL]], member_of(V,VL),!.
get_type_of([_|R],V,T):- get_type_of(R,V,T).

%member_of(+Variable,+VariableList)
member_of(_,[]):- fail, !.
member_of(V,[X|_]):- V==X, !.
member_of(V,[_|Y]):- member_of(V,Y).

%is_type(+Term)
% return true if given term is a type
is_type(P):- get_sub_type(P,T), T\=[].

%is_equal(+Term1,+Term2)
is_equal(T1,T2):- atom(T1), atom(T2), T1=T2,!.
is_equal(T1,T2):- var(T1), var(T2), T1==T2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > unify or_preconditions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%unify_or_preconditions(+PositiveOr,+NegativeOr,+State)
unify_or_preconditions([],[],_):-!.
unify_or_preconditions(P,[],S):- unify_pos_or(P,S), !.
unify_or_preconditions([],N,S):- unify_neg_or(N,S), !.
unify_or_preconditions(P,_,S):- unify_pos_or(P,S), !.
unify_or_preconditions(_,N,S):- unify_neg_or(N,S).

unify_pos_or([],_):- false,!.
unify_pos_or([X|_],_):-
    X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    Fx='=',
    atom(Px1),atom(Px2),
    Px1=Px2,!,true.
unify_pos_or([X|Y],S):-
    X=..[Fx|_],  % P1 is first arg and P2 is second arg
    Fx='=',
    unify_pos_or(Y,S),!.
unify_pos_or([X|_],S):- member(X,S),!,true.
unify_pos_or([_|Y],S):- unify_pos_or(Y,S).

unify_neg_or([],_):- false,!.
unify_neg_or([X|_],_):-
    X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    Fx='=',
    atom(Px1),atom(Px2),
    Px1\=Px2,!,
    true.
unify_neg_or([X|Y],S):-
    X=..[Fx|[Px1|[Px2]]],  % P1 is first arg and P2 is second arg
    Fx='=',
    atom(Px1),atom(Px2),
    Px1=Px2,!,
    unify_neg_or(Y,S).
unify_neg_or([X|_],S):- not(member(X,S)),!,true.
unify_neg_or([_|Y],S):- unify_neg_or(Y,S).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > update problem objects
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%merge_objects(+Constants,+Objects,-NewObjects)
merge_objects([], L, L).
merge_objects([C|R], O, L):-
    add_objects(C, O, NO),
    merge_objects(R, NO, L).

%add_objects(+Constant,+Objects,-NewObjects)
add_objects(C, [], [C]).
add_objects(C, [O|R], [NO|R]):-
    C=..[T,CL],
    O=..[T,OL], !,
    ord_union(OL, CL, NL),
    NO=..[T,NL].
add_objects(C, [O|R], [O|L]):-
    add_objects(C, R, L).



%update_objects(+NewTermType,+NewTerm)
update_objects(T,NT):-
    nb_getval(objects,O),
    add_object(O,T,NT,NO),
    nb_setval(objects,NO).

add_object([],T,NT,[NO]):- NO=..[T|[[NT]]], !.
add_object([H|R],T,NT,[N|R]):-
    H=..[F|[V]], F=T,
    append(V,[NT],L), N=..[F|[L]],!.
add_object([H|R],T,NT,[H|NO]):- add_object(R,T,NT,NO).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > create map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*  create_map(+PositiveEffects,-MapList, -NewPositiveEffects):-
    It extracts possible types for variable in get_type, e.g. get_type([tuckarmposture,_G123])
    It creates new constants for get_new_constant, e.g. get_new_constant([_G143, _G167]) */
create_map([],[]).

create_map([P|PE],[Map|MapList]):-
    P=..[F|AL],     % P: predicate F: functor AL: arguments list
    F = 'member',
    AL = [T|L],   % T: type V: variable
    make_map(T,L,Map),!,
    create_map(PE,MapList).

create_map([P|PE],[Map|MapList]):-
    P=..[F|AL],     % P: predicate F: functor AL: arguments list
    F = 'get_type',
    AL = [T|[V]],   % T: type V: variable
    get_sub_type(T,L),  % get sub-types of T
    make_map(V,L,Map),!,
    create_map(PE,MapList).

create_map([P|PE],[Map|MapList]):-
    P=..[F|AL],     % P: predicate F: functor AL: arguments list
    F = 'get_new_constant',
    AL = [T|[V]],   % T: type V: variable
    atom(T),var(V),
    get_new_constant(T,NT),
    update_objects(T,NT),
    make_map(V,[NT],Map),!,
    create_map(PE,MapList).

create_map([_|PE],MapList):-
    create_map(PE,MapList).

/*  get_sub_type(+GivenType,-ListOfSubTypes):-
    return a list of sub-types of a given type from the domain types,
    if GivenType does not have sublist it returns only type of GivenType,
    and returns empty list [] if the GivenType is not valid
    e.g.    GivenType: armsposture
            ListOfSubTypes: [armstuckedposture,armsuntuckedposture]
    or e.g. GivenType: robotat
            ListOfSubTypes: [robotat] */
get_sub_type(GT,L):-
    nb_getval(types, T),
    get_sub_type(GT,T,R,Tmp),!,
    return_type(R,Tmp,L).

%get_sub_type(+GivenType,+DomainTypeList,-ListOfSubTypes,-TypeOfGiven):-
get_sub_type(_,[],[],_).
get_sub_type(GT,[T|_],L,_):-
    T=..[N|[VL]],
    N=GT,!, L=VL.
get_sub_type(GT,[T|R],L,Tmp):-
    T=..[_|[VL]],
    member(Tmp,VL), Tmp=GT,
    get_sub_type(GT,R,L,Tmp).
get_sub_type(GT,[_|R],L,Tmp):-
    get_sub_type(GT,R,L,Tmp).

%return(+TypesList,+Type,-RetList)
return_type([],T,[]):-var(T),!.
return_type([],L,[L]):-!.
return_type(L,_,L).

/*  make_map(+Variable,+ListOfObjects,-MapList):-
    creates a map of possible pairs of given variable and given list of objects 
    e.g.    Variable: _G120
            ListOfObjects: [armtuckedposture,armuntuckedposture]
            MapList: [_G120-armtuckedposture,_G120-armuntuckedposture]
            MapList: [_G120-[armtuckedposture,armuntuckedposture]] */
make_map(_,[],[]).
make_map(X,[H],[X-H]).
make_map(X,[H|T],[X-H|L]):-
    make_map(X,T,L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > ground positive effects and remove get_type, get_new_constant and member
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%make_new_constants(+PositiveEffectList,+PositiveEffect,-GroundPositiveEffectList),
make_new_constants([],PE,[GPE]):- make_ground(PE,GPE),!.
make_new_constants(PEL,_,GPEL):- make_new_constants(PEL,GPEL).

/* It creates new constants and remove get_type, get_new_constant and member
   predicates from positive effects */
%make_new_constants(+PositiveEffectList,-GroundPositiveEffectList),
make_new_constants([],[]).
make_new_constants([M|PEList],[GM|GPEList]):-
    make_ground(M,GM),!,
    make_new_constants(PEList,GPEList).

make_ground([],[]).

make_ground([P|PE],GPE):-
    P=..[F|_],      % P: predicate F: functor AL: arguments list
    F = 'get_type',!,
    make_ground(PE,GPE).

make_ground([P|PE],GPE):-
    P=..[F|_],      % P: predicate F: functor AL: arguments list
    F = 'member',!,
    make_ground(PE,GPE).

make_ground([P|PE],GPE):-
    P=..[F|AL],     % P: predicate F: functor AL: arguments list
    F = 'get_new_constant',
    AL = [T|[V]],   % T: type V: variable
    atom(T),atom(V),!,
    make_ground(PE,GPE).

make_ground([P|PE],GPE):-
    P=..[F|AL],     % P: predicate F: functor AL: arguments list
    F = 'get_new_constant',
    AL = [T|[V]],   % T: type V: variable
    atom(T),var(V),!,
    get_new_constant(T,NT),
    update_objects(T,NT),
    V=NT,
    make_ground(PE,GPE).

make_ground([P|PE],[P|GPE]):-
    make_ground(PE,GPE).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > create copies of positive effect and create a map for every copy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%duplicate_and_map(+TermList,+MapList,-NewTermsList,-NewMapList):-
duplicate_and_map(_,[],[],[]).
duplicate_and_map(T,[M|Map],[NT|NTL],[NM|NMap]):-
    copy_term(T,NT),
    term_variables(T,L),
    term_variables(NT,NL),
    copy_and_map(L,M,NL,NM),
    duplicate_and_map(T,Map,NTL,NMap).

%copy_and_map(+ListOfVariables,+MapList,-NewListOfVariables,-NewMapList):-
copy_and_map(_,[],_,[]).
copy_and_map(L,[V-A|Map],NL,[NV-A|NMap]):-
  get_index(L,V,I),
  get_item(NL,NV,I),
  NV=A,
  copy_and_map(L,Map,NL,NMap).

%get_index(+List,+Variable,-Index):-
get_index([],_,_):-fail.
get_index([H|_],V,0):- V==H,!.
get_index([_|T],V,Idx):- get_index(T,V,I), succ(I,Idx).

%get_item(+List,-Variable,+Index):-
get_item([],_,_):-fail.
get_item([H|_],H,0).
get_item([_|T],V,Idx):- get_item(T,V,I), succ(I,Idx).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% > get all possible combinations of map list
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* It receives the MapList and make a new MapList in which every element in
   given MapList is put in a list containing one item
   e.g. InMapList: [[_G7267-armtuckedposture,_G7267-armuntuckedposture],[_G7351-armtuckedposture,_G7351-armuntuckedposture]]
        OutMapList: [[[_G7267-armtuckedposture],[_G7267-armuntuckedposture]],[[_G7351-armtuckedposture],[_G7351-armuntuckedposture]]]
put_items_to_list(+InMapList,-OutMapList) */
put_items_to_list([],[]):-!.
put_items_to_list([H],[T]):- items_to_list(H,T), !.
put_items_to_list(L,NL):- put_items_to_list2(L,NL), !.

put_items_to_list2([],[]):-!.
put_items_to_list2([H|T],[M|N]):-
    items_to_list(H,M),
    put_items_to_list2(T,N).

/* It receives a list and put the elements of the list into a list containing
   only that element.
   e.g. InList: [_G7351-armtuckedposture,_G7351-armuntuckedposture]
        OutList: [[_G7351-armtuckedposture],[_G7351-armuntuckedposture]]
items_to_list(+InList,-OutList):- */
items_to_list([],[]):-!.
items_to_list([H|T],[[H]|M]):- items_to_list(T,M).

/* It receives a MapList which contain a list of lists and returns all possible 
   combinations of the elements of lists.
   e.g. InMapList: [[[_G7194-armtuckedposture],[_G7194-armuntuckedposture]],[[_G7278-armtuckedposture],[_G7278-armuntuckedposture]]]
        OutMapList: [[_G7194-armtuckedposture,_G7278-armtuckedposture],[_G7194-armtuckedposture,_G7278-armuntuckedposture],[_G7194-armuntuckedposture,_G7278-armtuckedposture],[_G7194-armuntuckedposture,_G7278-armuntuckedposture]]
get_combinations(+InMapList,-OutMapList):- */
get_combinations([],[]):-!.
get_combinations([X],X):-!.
get_combinations([H|T],A):-
    get_combinations(T,R),!,
    get_combination(H,R,L),
    append(L,A).

/* It receives two lists and returns all possible combinations between the 
    elements of two lists. Note: the elements of two lists are inside in 
    list of only one element.
    e.g. List1: [[_G10068-armtuckedposture],[_G10068-armuntuckedposture]]
         List2: [[_G10152-armtuckedposture],[_G10152-armuntuckedposture]]
         OutList: [[_G10068-armtuckedposture,_G10152-armtuckedposture],[_G10068-armtuckedposture,_G10152-armuntuckedposture],[_G10068-armuntuckedposture,_G10152-armtuckedposture],[_G10068-armuntuckedposture,_G10152-armuntuckedposture]]
get_combination(+List1,+List2,-OutList):- */
get_combination(L,[],L).
get_combination([],_,[]):-!.
get_combination([H|T],L,[P|M]):-
    insert_in_all(H,L,P),
    get_combination(T,L,M).

/* insert_in_all given element X into the all elements of InList which every elements
   of InList is a list.
   e.g. X: _G10068-armtuckedposture
        InList: [[_G10152-armtuckedposture],[_G10152-armuntuckedposture]]
        OutList: [[_G10068-armtuckedposture,_G10152-armtuckedposture],[_G10068-armtuckedposture,_G10152-armuntuckedposture]]
insert_in_all(+X,+InList,-OutList):- */
insert_in_all(_,[],[]).
insert_in_all(X,[H|T],[P|L]):-
    append(X,H,P),
    insert_in_all(X,T,L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% < get all possible combinations of map list
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
