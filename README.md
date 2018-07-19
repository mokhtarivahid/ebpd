# Experience-Based Planning Domains (EBPDs) 

Main references:  
- [Mokhtari, V., Seabra Lopes, L. & Pinho, A.J. Pattern Recognition Letters (2017) 99: 57.](https://doi.org/10.1016/j.patrec.2017.06.003)  
- [Mokhtari, V., Seabra Lopes, L. & Pinho, A.J. Journal of Intelligent & Robotic Systems (2016) 83: 463.](https://doi.org/10.1007/s10846-016-0371-y)  


## Definition 1.  
An EBPD is a tuple,  

∆ = (D<sub>a</sub>, D<sub>c</sub>, R, E, M),  

where D<sub>a</sub> is an abstract planning domain, D<sub>c</sub> is a concrete planning domain, R is a set of 
abstraction hierarchies (i.e., inference rules) f : D<sub>c</sub> → D<sub>a</sub> to translate the concrete space 
in D<sub>c</sub> into the abstract space in D<sub>a</sub> , E is a set of experiences, and M is a set of methods 
in the form of activity schemata for solving problems.  

## Definition 1.  
A planning domain D in general is a tuple,  

D = (L, Σ, S, O),  
  
where L is a first-order logic language that has finitely many predicate and constant symbols, 
Σ is a set of ground atoms of L that are always true (i.e., static world information), S is 
a set of states in which every state s ∈ S is a set of ground atoms of L which may become false 
(i.e., transient world information), and O is a set of planning operators.  
  
## Definition 2.  
A planning operator o ∈ O is a tuple,  
  
o = (h, S, P, E),  
  
where h is the abstract operator's head, S is the static world information, P is the precondition, 
and E is the effect of a. A head takes a form n(x<sub>1</sub> , ..., x<sub>k≥0</sub>), in which n is the name, and 
x<sub>1</sub> , ..., x<sub>k</sub> are the arguments, e.g., `pick(?object, ?table)`.  

## Definition 3.  
An experience e ∈ E is a triple of ground structures,  
  
e = (t, K, π),  
  
where t is the head of a task, taught by a human user to a robot, e.g., `clear(table1)`, K is a set of 
key propositions, and π is a plan solution to achieve t. K is a subset of world description of an 
experience. Every key proposition in K is in the form τ (P ), which τ is a timestamp and P is a 
predicate. The timestamps specify the temporal extent of the predicates in an experience. Three types 
of timestamps are used to represent key propositions, init (true at the initial state, e.g., `(init(on 
cup table1))`, static (always true during an experience, e.g., `(static(arm canreach arm1 table1)))`, and 
goal (true at the goal state, e.g., `(goal(on cup tray1)))`.  
  
## Definition 4. 
An activity schema m ∈ M is a triple,  
  
m = (h, S, Ω),  
  
where h is a head of a target task (e.g., `clear(?table))`, S is the scope of applicability of m, 
and Ω is an abstract plan to achieve the h, i.e., a sequence or loops of abstract operators enriched 
with features.  
  
Every enriched abstract operator ω is in the form: ω = (a, F), 
where a ∈ A is an abstract operator head, and F is a set of features, i.e., a set of key propositions 
(see Definition 3), that describes the arguments of a. 

## Definition 5. 
A task planning problem is a tuple of ground structures,  
  
P = (t, σ, s0, g),  
  
where t is the head of a target task to be planned (e.g., `clear(table1))`, σ ⊆ Σ is the static world 
information (i.e., state invariant information), s0 ∈ S is the initial state (i.e., transient world 
information), and g is the goal, i.e., a set of propositions to be satisfied in a goal state s<sub>g</sub> ∈ S.  


# Repository content  

This repository contains the materials for the experience-based planning and learning system. 
It includes the following files and folders for the 'robotic arm' application domain:  

1) source code implemented in swi-prolog ('ebpd-system') containing the learning and planning system.  
2) test domains:  
  2.1. the planning operators domain ('domain.ebpd')  
  2.2. the abstract operators domain ('domain-abs.ebpd')  
  2.3. the abstraction hierarchies ('abstraction-hierarchies.ebpd')  
  2.4. a set of experiences ('experience.ebpd')  
  2.5. a set of activity schemata, i.e., task models ('schema.ebpd')  
  2.6. a set of problems represented in both ebpd and pddl (\problems)  
  2.7. the obtained results from SBP and Mp planners (\results)  
