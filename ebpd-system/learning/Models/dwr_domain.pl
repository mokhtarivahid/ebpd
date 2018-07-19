%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Domain Assumptions
%%% 
%%% In order to correctly define the domain, there are some assumptions about it that need to be clarified. For the purpose of this prototype, the planning domain is as follows:
%%% 
%%% The system has a finite set of states.
%%% The system is fully observable, insofar as there is complete knowledge about the state of the system
%%% The system is static as there will be no external events that will impact on the planner. This means the state-transition system can now be defined as .
%%% The system has restricted goals which are limited to a goal state  or set of goal states , where the objective is any sequence of states that end at one of the goal states.
%%% The planner will create a sequential plan where the solution plan is an ordered set of actions.
%%% The system works under implicit time. This means that actions and events have no duration, but are performed instantaneously.
%%% This particular prototype will word under the assumption that does not change while the plan is being executed, for simplicity purposes. Therefore, the plan will be computed offline.
%%% According to Ghallab et al, it is possible to now reduce the problem as follows:
%%% 
%%% Given Σ = (S,A, γ), an initial state s0 and a subset of goal states Sg, find a sequence of actions  corresponding to a sequence of state transitions (s0, s1, …, sk) such that s1 ϵ γ(s0, a1), s2 ϵ γ(s1, a2) …, sk ϵ γ(sk -1, ak), and sk ϵ Sg.
%%% 
%%% Simplified, the goal is to find the set of actions that alter the state of the system so that when applied in order from the start state, the final state equals the goal state.
%%% 
%%% 1.1.2       Dock Worker System
%%% 1.1.2.1     Definition
%%% 
%%% For this prototype, the system will be based on the Dock Worker Robot example defined by Ghallab et al. The following description is taken from “Automated Planning: Theory and Practice” (20).
%%% 
%%% 
%%% 
%%% Figure 30: The Dock Worker Robot problem from “Automated Planning: Theory and Practice”, page 230
%%% 
%%% The system is defined as follows:
%%% 
%%% A set of locations which are the storage areas loc(x) in Figure 30.
%%% A set of cranes which belong to a single location and can carry only one container at a time.
%%% A set of piles which are fixed areas attached to a location. At the bottom of each pile is a pallet, on top of which are stacked zero or more containers.
%%% A set of containers which can be stacked in some pile on top of a pallet or another container. They can also be held by a crane.
%%% A symbol pallet which denotes the bottom of a pile.
%%% In this system, there are the following constraints:
%%% 
%%% Any location that has piles also has one or more cranes.
%%% A crane can move a container from the top of a pile to an empty pile or to the top of another pile at the same location.
%%% The topology of the system can be defined as follows:
%%% 
%%% adjacent (l, l’): Location l is adjacent to location l’
%%% attached(p,l): Pile p is attached to location l.
%%% belong(k,l): Crane k belongs to location l.
%%% The relationship between entities can be defined as follows:
%%% 
%%% holding(k,c) : Crane k is holding container c.
%%% empty(k) : Crane k is not holding a container.
%%% in(c,p): Container c is in pile p.
%%% on(c, c’): Container c is on some container c’ or on a pallet in a pile.
%%% top(c,p): Container c is at the top of pile p. If pile p is empty, this will be denoted as top(pallet, p)
%%% And finally, the possible operations that can be performed:
%%% 
%%% Take(c, k, p): Take a container c with empty crane k from the top of pile p.
%%% Put(c, k, p): Put container c from crane k in pile p.
%%% Move(c, p): Move container c to pile p.
%%%
%%% https://aigameproject.wordpress.com/2010/02/21/prototype-5-day-2/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    move(Robot, From, To), 

    %IL
    [],

    %KL
    [ adjacent(From, To)
      %% ,not(occupied(To))
    ],

    %DL
    [ occupied(From), 
      at(Robot,From) ],

    %AL
    [ occupied(To), 
      at(Robot,To) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    load(Crane, Container, Robot, Location), 

    %IL
    [],

    %KL
    [ at(Robot, Location),
      belong(Crane, Location) ],

    %DL
    [ unloaded(Robot),
      holding(Crane, Container) ],

    %AL
    [ loaded(Robot, Container), 
      empty(Crane) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    unload(Crane, Container, Robot, Location),

    %IL
    [],

    %KL
    [ belong(Crane, Location), 
      at(Robot, Location) ],

    %DL
    [ loaded(Robot, Container),
      empty(Crane) ],

    %AL
    [ unloaded(Robot),
      holding(Crane, Container) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    take(Crane, Container1, Pile, Container2, Location), 

    %IL
    [],

    %KL
    [ belong(Crane, Location),
      attached(Pile, Location) ],

    %DL
    [ in(Container1, Pile),
      top(Container1, Pile),
      on(Container1, Container2),
      empty(Crane) ],

    %AL
    [ holding(Crane, Container1), 
      top(Container2, Pile) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
operator_functionality(
    put(Crane, Container1, Pile, Container2, Location), 

    %IL
    [],

    %KL
    [ belong(Crane, Location),
      attached(Pile, Location) ],

    %DL
    [ top(Container2, Pile), 
      holding(Crane, Container1) ],

    %AL
    [ in(Container1, Pile),
      top(Container1, Pile),
      on(Container1, Container2),
      empty(Crane) ]
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dock-Worker Robot abstract operators:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% nil class
abstract_operator_application(move(_, _, _), []) :- !.
abstract_operator_application(load(_, _, _, _), []) :- !.
abstract_operator_application(unload(_, _, _, _), []) :- !.

%% main classes
abstract_operator_application(take(_, C, P, _, L), [take(C,P,L)]) :- !.
abstract_operator_application(put(_, C, P, _, L), [put(C,P,L)]) :- !.

abstract_operator_application(Op,[Op]).

