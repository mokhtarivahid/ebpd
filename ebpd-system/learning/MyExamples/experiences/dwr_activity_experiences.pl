:- assert(
robot_activity_experience(
    
    p00,                   %% episode ID
    stack00,              %% problem
    [
        stack00(c11, c12, p11, p22, pallet), %% Task
        [                       %% KeyProps
                at_start(at(r1, l1)),
                at_start(unloaded(r1)),
                at_start(occupied(l1)),
                at_start(empty(k1)),
                at_start(empty(k2)),
                at_start(in(c11, p11)),
                at_start(in(c12, p11)),
                at_start(in(c21, p21)),
                at_start(in(c22, p21)),
                at_start(on(c12, c11)),
                at_start(on(c11, pallet)),
                at_start(top(c12, p11)),
                at_start(top(pallet, p12)),
                at_start(on(c22, c21)),
                at_start(on(c21, pallet)),
                at_start(top(c22, p21)),
                at_start(top(pallet, p22)),
                throughout(adjacent(l1, l2)),
                throughout(adjacent(l2, l1)),
                throughout(attached(p11, l1)),
                throughout(attached(p12, l1)),
                throughout(attached(p21, l2)),
                throughout(attached(p22, l2)),
                throughout(belong(k1, l1)),
                throughout(belong(k2, l2)),
                at_end(in(c11, p22)),
                at_end(in(c12, p22)),
                at_end(on(c11, c12)),
                at_end(on(c12, pallet)),
                at_end(top(c11, p22)),
                at_end(top(pallet, p11))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
                take(k1, c12, p11, c11, l1),
                load(k1, c12, r1, l1),
                move(r1, l1, l2),
                unload(k2, c12, r1, l2),
                put(k2, c12, p22, pallet, l2),
                take(k1, c11, p11, pallet, l1),
                move(r1, l2, l1),
                load(k1, c11, r1, l1),
                move(r1, l1, l2),
                unload(k2, c11, r1, l2),
                put(k2, c11, p22, c12, l2)
        ]
    ]
)).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- assert(
robot_activity_experience(
    
    p01,                   %% episode ID
    stack01,              %% problem
    [
        stack01(c11, c12, p11, p22, pallet), %% Task
        [                       %% KeyProps
                at_start(at(r1, l1)),
                at_start(unloaded(r1)),
                at_start(occupied(l1)),
                at_start(empty(k1)),
                at_start(empty(k2)),
                at_start(in(c11, p11)),
                at_start(in(c12, p11)),
                at_start(in(c21, p21)),
                at_start(in(c22, p21)),
                at_start(on(c12, c11)),
                at_start(on(c11, pallet)),
                at_start(top(c12, p11)),
                at_start(top(pallet, p12)),
                at_start(on(c22, c21)),
                at_start(on(c21, pallet)),
                at_start(top(c22, p21)),
                at_start(top(pallet, p22)),
                throughout(adjacent(l1, l2)),
                throughout(adjacent(l2, l1)),
                throughout(attached(p11, l1)),
                throughout(attached(p12, l1)),
                throughout(attached(p21, l2)),
                throughout(attached(p22, l2)),
                throughout(belong(k1, l1)),
                throughout(belong(k2, l2)),
                at_end(in(c11, p22)),
                at_end(in(c12, p22)),
                at_end(on(c12, c11)),
                at_end(on(c11, pallet)),
                at_end(top(c12, p22)),
                at_end(top(pallet, p11))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
                take(k1, c12, p11, c11, l1),
                load(k1, c12, r1, l1),
                move(r1, l1, l2),
                unload(k2, c12, r1, l2),
                move(r1, l2, l1),
                take(k1, c11, p11, pallet, l1),
                load(k1, c11, r1, l1),
                move(r1, l1, l2),
                put(k2, c12, p22, pallet, l2),
                unload(k2, c11, r1, l2),
                put(k2, c11, p21, c22, l2),
                take(k2, c12, p22, pallet, l2),
                load(k2, c12, r1, l2),
                take(k2, c11, p21, c22, l2),
                put(k2, c11, p22, pallet, l2),
                unload(k2, c12, r1, l2),
                put(k2, c12, p22, c11, l2)
        ]
    ]
)).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- assert(
robot_activity_experience(
    
    p02,                   %% episode ID
    stack02,              %% problem
    [
        stack02(c1, c2, c3, p1, p2, pallet), %% Task
        [                       %% KeyProps
                at_start(in(c1, p1)),
                at_start(in(c2, p1)),
                at_start(in(c3, p1)),
                at_start(on(c3, c2)),
                at_start(on(c2, c1)),
                at_start(on(c1, pallet)),
                at_start(top(c3, p1)),
                at_start(top(pallet, q1)),
                at_start(top(pallet, p2)),
                at_start(top(pallet, q2)),
                at_start(at(r1, l1)),
                at_start(unloaded(r1)),
                at_start(occupied(l1)),
                at_start(empty(k1)),
                at_start(empty(k2)),
                throughout(adjacent(l1, l2)),
                throughout(adjacent(l2, l1)),
                throughout(attached(p1, l1)),
                throughout(attached(q1, l1)),
                throughout(attached(p2, l2)),
                throughout(attached(q2, l2)),
                throughout(belong(k1, l1)),
                throughout(belong(k2, l2)),
                at_end(in(c1, p2)),
                at_end(in(c2, p2)),
                at_end(in(c3, p2)),
                at_end(on(c3, c2)),
                at_end(on(c2, c1)),
                at_end(on(c1, pallet)),
                at_end(top(c3, p2)),
                at_end(top(pallet, p1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
                take(k1,c3,p1,c2,l1),
                load(k1,c3,r1,l1),
                move(r1,l1,l2),
                take(k1,c2,p1,c1,l1),
                unload(k2,c3,r1,l2),
                move(r1,l2,l1),
                load(k1,c2,r1,l1),
                put(k2,c3,q2,pallet,l2),
                move(r1,l1,l2),
                take(k1,c1,p1,pallet,l1),
                unload(k2,c2,r1,l2),
                move(r1,l2,l1),
                load(k1,c1,r1,l1),
                put(k2,c2,p2,pallet,l2),
                move(r1,l1,l2),
                take(k2,c2,p2,pallet,l2),
                put(k2,c2,q2,c3,l2),
                unload(k2,c1,r1,l2),
                put(k2,c1,p2,pallet,l2),
                take(k2,c2,q2,c3,l2),
                put(k2,c2,p2,c1,l2),
                take(k2,c3,q2,pallet,l2),
                put(k2,c3,p2,c2,l2)
        ]
    ]
)).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

