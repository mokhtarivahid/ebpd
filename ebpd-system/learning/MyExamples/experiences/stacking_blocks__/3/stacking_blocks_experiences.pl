:-assert(robot_activity_experience(
  p10,    %% episode ID
  stacking-blocks,    %% domain
  [
    stack(p1,p2),    %% task
    [        %% key propositions
        at_start(top(pallet2,p2)),
        at_start(top(b1,p1)),
        at_start(on(b10,pallet1)),
        at_start(on(b9,b10)),
        at_start(on(b8,b9)),
        at_start(on(b7,b8)),
        at_start(on(b6,b7)),
        at_start(on(b5,b6)),
        at_start(on(b4,b5)),
        at_start(on(b3,b4)),
        at_start(on(b2,b3)),
        at_start(on(b1,b2)),
        throughout(pile(p1)),
        throughout(pile(p2)),
        throughout(table(t1)),
        throughout(pallet(pallet1)),
        throughout(pallet(pallet2)),
        throughout(blue(b1)),
        throughout(blue(b2)),
        throughout(blue(b3)),
        throughout(blue(b4)),
        throughout(blue(b5)),
        throughout(red(b6)),
        throughout(red(b7)),
        throughout(red(b8)),
        throughout(red(b9)),
        throughout(red(b10)),
        throughout(block(b1)),
        throughout(block(b2)),
        throughout(block(b3)),
        throughout(block(b4)),
        throughout(block(b5)),
        throughout(block(b6)),
        throughout(block(b7)),
        throughout(block(b8)),
        throughout(block(b9)),
        throughout(block(b10)),
        at_end(top(pallet1,p1)),
        at_end(top(b10,p2)),
        at_end(on(b1,pallet2)),
        at_end(on(b2,b1)),
        at_end(on(b3,b2)),
        at_end(on(b4,b3)),
        at_end(on(b5,b4)),
        at_end(on(b6,b5)),
        at_end(on(b7,b6)),
        at_end(on(b8,b7)),
        at_end(on(b9,b8)),
        at_end(on(b10,b9))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        move(h1,t1,p1,l1),
        unstack(h1,b1,b2,p1,l1),
        move(h1,p1,p2,l1),
        stack(h1,b1,pallet2,p2,l1),
        move(h1,p2,p1,l1),
        unstack(h1,b2,b3,p1,l1),
        move(h1,p1,p2,l1),
        stack(h1,b2,b1,p2,l1),
        move(h1,p2,p1,l1),
        unstack(h1,b3,b4,p1,l1),
        move(h1,p1,p2,l1),
        stack(h1,b3,b2,p2,l1),
        move(h1,p2,p1,l1),
        unstack(h1,b4,b5,p1,l1),
        move(h1,p1,p2,l1),
        stack(h1,b4,b3,p2,l1),
        move(h1,p2,p1,l1),
        unstack(h1,b5,b6,p1,l1),
        move(h1,p1,p2,l1),
        stack(h1,b5,b4,p2,l1),
        move(h1,p2,p1,l1),
        unstack(h1,b6,b7,p1,l1),
        move(h1,p1,p2,l1),
        stack(h1,b6,b5,p2,l1),
        move(h1,p2,p1,l1),
        unstack(h1,b7,b8,p1,l1),
        move(h1,p1,p2,l1),
        stack(h1,b7,b6,p2,l1),
        move(h1,p2,p1,l1),
        unstack(h1,b8,b9,p1,l1),
        move(h1,p1,p2,l1),
        stack(h1,b8,b7,p2,l1),
        move(h1,p2,p1,l1),
        unstack(h1,b9,b10,p1,l1),
        move(h1,p1,t1,l1),
        putdown(h1,b9,t1,l1),
        move(h1,t1,p1,l1),
        unstack(h1,b10,pallet1,p1,l1),
        move(h1,p1,t1,l1),
        putdown(h1,b10,t1,l1),
        pickup(h1,b9,t1,l1),
        move(h1,t1,p2,l1),
        stack(h1,b9,b8,p2,l1),
        move(h1,p2,t1,l1),
        pickup(h1,b10,t1,l1),
        move(h1,t1,p2,l1),
        stack(h1,b10,b9,p2,l1)
    ]
  ]
)).