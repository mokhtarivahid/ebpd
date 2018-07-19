%%% based on domain 'stripped_tower'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move(Hoist, From, To, Location), 

    %IL
    [],

    %KL
    [ belonge(Hoist, Location),
      attached(From, Location),
      attached(To, Location) ],

    %DL
    [ at(Hoist,From) ],

    %AL
    [ at(Hoist,To) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    unstack(Hoist, Container1, Container2, Pile, Location), 

    %IL
    [],

    %KL
    [ belong(Hoist, Location),
      attached(Pile, Location),
      pile(Pile),
      at(Hoist, Pile) ],

    %DL
    [ in(Container1, Pile),
      top(Container1, Pile),
      on(Container1, Container2),
      empty(Hoist) ],

    %AL
    [ holding(Hoist, Container1), 
      top(Container2, Pile) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    stack(Hoist, Container1, Container2, Pile, Location), 

    %IL
    [],

    %KL
    [ belong(Hoist, Location),
      attached(Pile, Location),
      pile(Pile),
      at(Hoist, Pile) ],

    %DL
    [ top(Container2, Pile), 
      holding(Hoist, Container1) ],

    %AL
    [ in(Container1, Pile),
      top(Container1, Pile),
      on(Container1, Container2),
      empty(Hoist) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    pickup(Hoist, Container, Table, Location), 

    %IL
    [],

    %KL
    [ belong(Hoist, Location),
      attached(Table, Location),
      table(Table),
      at(Hoist, Table) ],

    %DL
    [ ontable(Container, Table),
      empty(Hoist) ],

    %AL
    [ holding(Hoist, Container) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    putdown(Hoist, Container, Table, Location), 

    %IL
    [],

    %KL
    [ belong(Hoist, Location),
      attached(Table, Location),
      table(Table),
      at(Hoist, Table) ],

    %DL
    [ holding(Hoist, Container) ],

    %AL
    [ ontable(Container, Table),
      empty(Hoist) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dock-Worker Robot abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(move(_, _, _, _), []) :- !.

%% main classes
abstract_operator_application(pickup(H, C, T, _), [pick(H, C, T)]) :- !.
abstract_operator_application(putdown(H, C, T, _), [put(H, C, T)]) :- !.
abstract_operator_application(unstack(H, C, K, P, _), [unstack(H,C,K,P)]) :- !.
abstract_operator_application(stack(H, C, K, P, _), [stack(H,C,K,P)]) :- !.

%% abstract_operator_application(pickup(_, C, T, _), [pick(C, T)]) :- !.
%% abstract_operator_application(putdown(_, C, T, _), [put(C, T)]) :- !.
%% abstract_operator_application(unstack(_, C, K, P, _), [unstack(C,K,P)]) :- !.
%% abstract_operator_application(stack(_, C, K, P, _), [stack(C,K,P)]) :- !.

abstract_operator_application(Op,[Op]).

