:-assert(robot_activity_experience(
  stack,    %% episode ID
  striped_tower,    %% domain
  [
    stack(t1,p1),    %% task
    [        %% key propositions
        at_start(top(pallet1,p1)),
        at_start(ontable(b1,t1)),
        at_start(ontable(b2,t1)),
        at_start(ontable(b3,t1)),
        at_start(ontable(b4,t1)),
        at_start(ontable(b5,t1)),
        at_start(ontable(b6,t1)),
        at_start(ontable(b7,t1)),
        at_start(ontable(b8,t1)),
        at_start(at(h1,t1)),
        at_start(empty(h1)),
        throughout(pile(p1)),
        throughout(table(t1)),
        throughout(location(l1)),
        throughout(hoist(h1)),
        throughout(attached(p1,l1)),
        throughout(attached(t1,l1)),
        throughout(belong(h1,l1)),
        throughout(pallet(pallet1)),
        throughout(blue(b1)),
        throughout(blue(b2)),
        throughout(blue(b3)),
        throughout(blue(b4)),
        throughout(red(b5)),
        throughout(red(b6)),
        throughout(red(b7)),
        throughout(red(b8)),
        throughout(container(b1)),
        throughout(container(b2)),
        throughout(container(b3)),
        throughout(container(b4)),
        throughout(container(b5)),
        throughout(container(b6)),
        throughout(container(b7)),
        throughout(container(b8)),
        at_end(top(b8,p1)),
        at_end(on(b1,pallet1)),
        at_end(on(b2,b1)),
        at_end(on(b3,b2)),
        at_end(on(b4,b3)),
        at_end(on(b5,b4)),
        at_end(on(b6,b5)),
        at_end(on(b7,b6)),
        at_end(on(b8,b7))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        pickup(h1,b1,t1,l1),
        move(h1,t1,p1,l1),
        stack(h1,b1,pallet1,p1,l1),
        move(h1,p1,t1,l1),
        pickup(h1,b2,t1,l1),
        move(h1,t1,p1,l1),
        stack(h1,b2,b1,p1,l1),
        move(h1,p1,t1,l1),
        pickup(h1,b3,t1,l1),
        move(h1,t1,p1,l1),
        stack(h1,b3,b2,p1,l1),
        move(h1,p1,t1,l1),
        pickup(h1,b4,t1,l1),
        move(h1,t1,p1,l1),
        stack(h1,b4,b3,p1,l1),
        move(h1,p1,t1,l1),
        pickup(h1,b5,t1,l1),
        move(h1,t1,p1,l1),
        stack(h1,b5,b4,p1,l1),
        move(h1,p1,t1,l1),
        pickup(h1,b6,t1,l1),
        move(h1,t1,p1,l1),
        stack(h1,b6,b5,p1,l1),
        move(h1,p1,t1,l1),
        pickup(h1,b7,t1,l1),
        move(h1,t1,p1,l1),
        stack(h1,b7,b6,p1,l1),
        move(h1,p1,t1,l1),
        pickup(h1,b8,t1,l1),
        move(h1,t1,p1,l1),
        stack(h1,b8,b7,p1,l1)
    ]
  ]
)).
