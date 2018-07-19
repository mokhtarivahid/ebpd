:-assert(robot_activity_experience(
  l2,    %% episode ID
  logistics,    %% domain
  [
    logistic(office1,office2),    %% task
    [        %% key propositions
        at_start(at(packet1,office1)),
        at_start(at(packet2,office1)),
        at_start(at(truck1,airport1)),
        at_start(at(truck2,airport2)),
        at_start(at(airplane1,airport1)),
        throughout(object(packet1)),
        throughout(object(packet2)),
        throughout(vehicle(truck1)),
        throughout(vehicle(truck2)),
        throughout(vehicle(airplane1)),
        throughout(truck(truck1)),
        throughout(truck(truck2)),
        throughout(airplane(airplane1)),
        throughout(location(office1)),
        throughout(location(office2)),
        throughout(location(airport1)),
        throughout(location(airport2)),
        throughout(airport(airport1)),
        throughout(airport(airport2)),
        throughout(city(city1)),
        throughout(city(city2)),
        throughout(loc(office1,city1)),
        throughout(loc(airport1,city1)),
        throughout(loc(office2,city2)),
        throughout(loc(airport2,city2)),
        at_end(at(packet1,office2)),
        at_end(at(packet2,office2)),
        at_end(at(truck1,airport1)),
        at_end(at(truck2,office2)),
        at_end(at(airplane1,airport2))
    ],
    none,               %% failed operation
    race_dummy,         %% failure type
    [
        drive(truck1, airport1, office1, city1),
        load(packet1, truck1, office1),
        load(packet2, truck1, office1),
        drive(truck1, office1, airport1, city1),
        unload(packet1, truck1, airport1),
        unload(packet2, truck1, airport1),
        load(packet1, airplane1, airport1),
        load(packet2, airplane1, airport1),
        fly(airplane1, airport1, airport2),
        unload(packet1, airplane1, airport2),
        unload(packet2, airplane1, airport2),
        load(packet1, truck2, airport2),
        load(packet2, truck2, airport2),
        drive(truck2, airport2, office2, city2),
        unload(packet1, truck2, office2),
        unload(packet2, truck2, office2)
    ]
  ]
)).
