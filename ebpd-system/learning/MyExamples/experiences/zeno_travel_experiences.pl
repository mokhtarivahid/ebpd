:-assert(robot_activity_experience(
  z5,    %% episode ID
  zeno_travel,    %% domain
  [
    flight(city0, city1),    %% task
    [        %% key propositions
        at_start(at(plane1,city0)),
        at_start(fuel_level(plane1,fl1)),
        at_start(in(person0,city0)),
        at_start(in(person1,city0)),
        at_start(in(person2,city0)),
        at_start(in(person3,city1)),
        at_start(in(person4,city1)),
        throughout(next(fl0,fl1)),
        at_end(in(person0,city1)),
        at_end(in(person1,city1)),
        at_end(in(person2,city1)),
        at_end(in(person3,city0)),
        at_end(in(person4,city0))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        board(person0, plane1, city0),
        board(person1, plane1, city0),
        board(person2, plane1, city0),
        fly(plane1, city0, city1, fl1, fl0),
        debark(person0, plane1, city1),
        debark(person1, plane1, city1),
        debark(person2, plane1, city1),
        refuel(plane1, city1, fl0, fl1),
        board(person3, plane1, city1),
        board(person4, plane1, city1),
        fly(plane1, city1, city0, fl1, fl0),
        debark(person3, plane1, city0),
        debark(person4, plane1, city0)
    ]
  ]
)).
