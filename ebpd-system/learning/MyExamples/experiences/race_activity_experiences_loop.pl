:- assert(
robot_activity_experience(
    
    245300,                   %% episode ID
    serve_coffee_to_guest4,             %% problem
    [
        serve_coffee_to_guest(cup1,cupcake1,guest1,table1),  %% Task
        [                       %% KeyProps
            at_start(instance(armunnamedposture, armunnamedposture0)),
            %at_start(hasphysicalentity(on4, cup1)),
            at_start(instance(gripperclosedposture, gripperclosedposture0)),
            %at_start(hasrobot(robotat0, trixi1)),
            at_start(hasgripperposture(rightgripper1, gripperclosedposture0)),
            at_start(instance(armunnamedposture, armunnamedposture1)),
            %at_start(instance(robotat, robotat0)),
            %at_start(hasarea(on4, placingareaeastrightcounter1)),
            at_start(on(cup1, placingareaeastrightcounter1)),
            at_start(on(cupcake1, placingareaeastrightcounter1)),
            at_start(hastorsoposture(torso1, torsodownposture0)),
            at_start(hasarmposture(leftarm1, armunnamedposture0)),
            %at_start(instance(on, on4)),
            %at_start(hasarea(robotat0, floorareatamsrestaurant1)),
            at_start(robotat(trixi1, floorareatamsrestaurant1)),
            at_start(hasarmposture(rightarm1, armunnamedposture1)),
            at_start(instance(torsodownposture, torsodownposture0)),
            throughout(haspremanipulationarea(table1, premanipulationareasouthtable1)),
            throughout(instance(table, table1)),
            throughout(instance(arm, leftarm1)),
            throughout(hasplacingarearight(sittingareawesttable1, placingareawestrighttable1)),
            throughout(instance(placingarea, placingareasouthrighttable2)),
            throughout(hasplacingarea(table2, placingareanorthlefttable2)),
            throughout(hasplacingarea(table1, placingareaeastlefttable1)),
            throughout(hasplacingarearight(sittingareasouthtable2, placingareasouthrighttable2)),
            throughout(haspremanipulationarea(manipulationareaeastcounter1, premanipulationareaeastcounter1)),
            throughout(hasmanipulationarea(table1, manipulationareasouthtable1)),
            throughout(instance(floorarea, floorareatamsrestaurant1)),
            throughout(instance(placingarea, placingareawestlefttable1)),
            throughout(hasplacingarea(table1, placingareawestlefttable1)),
            throughout(hasmanipulationarea(placingareasouthlefttable2, manipulationareawesttable2)),
            %throughout(instance(on, on2)),
            throughout(instance(manipulationarea, manipulationareanorthtable1)),
            %throughout(hasarea(on3, nearareatable2)),
            throughout(hasgripper(leftarm1, leftgripper1)),
            throughout(instance(torsoupposture, dummytorsoupposture)),
            throughout(instance(premanipulationarea, premanipulationareaeasttable2)),
            throughout(haspremanipulationarea(table2, premanipulationareawesttable2)),
            throughout(hasmanipulationareawest(table2, manipulationareawesttable2)),
            throughout(hasplacingarea(counter1, placingareaeastrightcounter1)),
            throughout(at(guest1, sittingareawesttable1)),
            throughout(hasplacingarealeft(sittingareanorthtable2, placingareanorthlefttable2)),
            throughout(hasplacingarea(table2, placingareasouthrighttable2)),
            %throughout(hasarea(on2, nearareatable1)),
            throughout(hassittingarea(table2, sittingareasouthtable2)),
            throughout(instance(armcarryposture, dummyarmcarryposture)),
            throughout(haspremanipulationarea(manipulationareasouthtable1, premanipulationareasouthtable1)),
            throughout(instance(premanipulationarea, premanipulationareawesttable2)),
            throughout(hasmanipulationarea(placingareaeastrightcounter1, manipulationareaeastcounter1)),
            throughout(hasmanipulationarea(placingareawestlefttable1, manipulationareanorthtable1)),
            throughout(haspremanipulationarea(table2, premanipulationareaeasttable2)),
            throughout(hasmanipulationarea(placingareaeastlefttable1, manipulationareasouthtable1)),
            throughout(instance(guest, guest1)),
            throughout(hasplacingarealeft(sittingareawesttable1, placingareawestlefttable1)),
            throughout(hasmanipulationarea(placingareaeastrighttable1, manipulationareanorthtable1)),
            throughout(instance(torso, torso1)),
            throughout(hasplacingarealeft(sittingareasouthtable2, placingareasouthlefttable2)),
            throughout(instance(premanipulationarea, premanipulationareanorthtable1)),
            throughout(instance(sittingarea, sittingareanorthtable2)),
            throughout(instance(sittingarea, sittingareasouthtable2)),
            throughout(hasmanipulationarea(placingareawestrighttable1, manipulationareasouthtable1)),
            throughout(instance(placingarea, placingareawestrighttable1)),
            throughout(hasmanipulationarea(counter1, manipulationareaeastcounter1)),
            throughout(instance(cup, cup1)),
            throughout(instance(cupcake, cupcake1)),
            throughout(instance(sittingarea, sittingareawesttable1)),
            throughout(instance(armtuckedposture, dummyarmtuckedposture)),
            %throughout(hasphysicalentity(at1, guest1)),
            %throughout(hasphysicalentity(on2, table1)),
            throughout(hasmanipulationarea(placingareanorthrighttable2, manipulationareawesttable2)),
            throughout(haspremanipulationarea(manipulationareawesttable2, premanipulationareawesttable2)),
            throughout(hasmanipulationareasouth(table1, manipulationareasouthtable1)),
            throughout(hasplacingarea(table1, placingareawestrighttable1)),
            %throughout(hasphysicalentity(on3, table2)),
            throughout(haspremanipulationarea(table1, premanipulationareanorthtable1)),
            throughout(instance(arm, rightarm1)),
            throughout(hasmanipulationarea(table2, manipulationareaeasttable2)),
            throughout(haspremanipulationarea(manipulationareanorthtable1, premanipulationareanorthtable1)),
            throughout(hasplacingarearight(sittingareanorthtable2, placingareanorthrighttable2)),
            throughout(instance(gripperclosedposture, gripperclosedposture1)),
            throughout(instance(manipulationarea, manipulationareaeasttable2)),
            throughout(instance(table, table2)),
            throughout(instance(placingarea, placingareaeastlefttable1)),
            throughout(haspremanipulationarea(manipulationareaeasttable2, premanipulationareaeasttable2)),
            %throughout(hasphysicalentity(on1, counter1)),
            throughout(hasmanipulationareanorth(table1, manipulationareanorthtable1)),
            throughout(hasplacingarea(table2, placingareanorthrighttable2)),
            throughout(hassittingarea(table1, sittingareawesttable1)),
            throughout(hasplacingarealeft(sittingareaeasttable1, placingareaeastlefttable1)),
            %throughout(hasarea(at1, sittingareawesttable1)),
            throughout(hasplacingarea(table2, placingareasouthlefttable2)),
            throughout(hasgripper(rightarm1, rightgripper1)),
            throughout(hasplacingarea(table1, placingareaeastrighttable1)),
            throughout(instance(manipulationarea, manipulationareasouthtable1)),
            throughout(instance(gripper, leftgripper1)),
            throughout(hassittingarea(table2, sittingareanorthtable2)),
            throughout(hasmanipulationarea(placingareanorthlefttable2, manipulationareaeasttable2)),
            throughout(hasmanipulationarea(placingareasouthrighttable2, manipulationareaeasttable2)),
            throughout(instance(counter, counter1)),
            throughout(hassittingarea(table1, sittingareaeasttable1)),
            %throughout(instance(on, on3)),
            throughout(instance(torsomiddleposture, dummytorsomiddleposture)),
            throughout(hasmanipulationareaeast(table2, manipulationareaeasttable2)),
            throughout(instance(armuntuckedposture, dummyarmuntuckedposture)),
            throughout(hasgripperposture(leftgripper1, gripperclosedposture1)),
            throughout(instance(premanipulationarea, premanipulationareasouthtable1)),
            throughout(instance(manipulationarea, manipulationareaeastcounter1)),
            throughout(instance(placingarea, placingareanorthrighttable2)),
            throughout(instance(manipulationarea, manipulationareawesttable2)),
            throughout(instance(placingarea, placingareaeastrightcounter1)),
            throughout(instance(placingarea, placingareanorthlefttable2)),
            throughout(instance(sittingarea, sittingareaeasttable1)),
            throughout(instance(placingarea, placingareaeastrighttable1)),
            %throughout(instance(at, at1)),
            throughout(hasmanipulationarea(table2, manipulationareawesttable2)),
            throughout(instance(placingarea, placingareasouthlefttable2)),
            throughout(instance(premanipulationarea, premanipulationareaeastcounter1)),
            throughout(hasplacingarearight(sittingareaeasttable1, placingareaeastrighttable1)),
            throughout(instance(gripper, rightgripper1)),
            %throughout(hasarea(on1, nearareacounter1)),
            throughout(hasmanipulationarea(table1, manipulationareanorthtable1)),
            %throughout(instance(on, on1)),
            at_end(instance(torsoupposture, torsoupposture6)),
            at_end(hasgripperposture(rightgripper1, gripperopeningposture8)),
            at_end(hasarmposture(rightarm1, armunnamedposture59)),
            %at_end(hasarea(on_0x0, placingareawestrighttable1)),
            at_end(on(cup1, placingareawestrighttable1)),
            at_end(on(cupcake1, placingareawestrighttable1)),
            at_end(instance(gripperopeningposture, gripperopeningposture8)),
            %at_end(instance(robotat, robotat15)),
            %at_end(instance(on, on_0x0)),
            %at_end(hasphysicalentity(on_0x0, cup1)),
            at_end(instance(armunnamedposture, armunnamedposture59)),
            at_end(instance(armcarryposture, armcarryposture47)),
            %at_end(hasarea(robotat15, manipulationareasouthtable1)),
            at_end(robotat(trixi1, manipulationareasouthtable1)),
            at_end(hastorsoposture(torso1, torsoupposture6)),
            at_end(hasarmposture(leftarm1, armcarryposture47))
            %at_end(hasrobot(robotat15, trixi1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            tuck_arms(leftarm1, rightarm1, armunnamedposture, armunnamedposture, armunnamedposture0, armunnamedposture1, armtuckedposture, armtuckedposture, armtuckedposture7, armtuckedposture13),
            move_base(robotat0, floorareatamsrestaurant1, robotat5, premanipulationareaeastcounter1),
            move_torso(torso1, torsodownposture, torsodownposture0, torsoupposture, torsoupposture2),
            tuck_arms(leftarm1, rightarm1, armtuckedposture, armtuckedposture, armtuckedposture7, armtuckedposture13, armuntuckedposture, armtuckedposture, armuntuckedposture5, armtuckedposture1002),
            move_arm_to_side(leftarm1, armuntuckedposture, armuntuckedposture5, armtosideposture21),
            move_arm_to_side(rightarm1, armuntuckedposture, armuntuckedposture9, armtosideposture23),
            move_base_blind_to_ma(robotat5, premanipulationareaeastcounter1, robotat7, manipulationareaeastcounter1),
            %observe_objects_on_area(placingareaeastrightcounter1, robotat7, manipulationareaeastcounter1),
            pick_up_object(cup1, rightarm1, on4, robotat7, manipulationareaeastcounter1, placingareaeastrightcounter1, rightgripper1, holding_0x0, torsoupposture2, armtosideposture23, armtosideposture33),
            pick_up_object(cupcake1, leftarm1, on5, robotat7, manipulationareaeastcounter1, placingareaeastrightcounter1, leftgripper1, holding_0x1, torsoupposture2, armtosideposture21, armtosideposture31),
            move_base_blind_to_pma(robotat7, manipulationareaeastcounter1, robotat9, premanipulationareaeastcounter1),
            move_arms_to_carryposture(leftarm1, rightarm1, armtosideposture, armtosideposture, armtosideposture31, armtosideposture33, armcarryposture37, armcarryposture39),
            move_torso(torso1, torsoupposture, torsoupposture2, torsomiddleposture, torsomiddleposture4),
            move_base(robotat9, premanipulationareaeastcounter1, robotat12, premanipulationareasouthtable1),
            move_torso(torso1, torsomiddleposture, torsomiddleposture4, torsoupposture, torsoupposture6),
            move_arm_to_side(rightarm1, armcarryposture, armcarryposture39, armtosideposture53),
            move_arm_to_side(leftarm1, armcarryposture, armcarryposture37, armtosideposture54),
            move_base_blind_to_ma(robotat12, premanipulationareasouthtable1, robotat15, manipulationareasouthtable1),
            place_object(cup1, rightarm1, robotat15, manipulationareasouthtable1, on_0x0, placingareawestrighttable1, rightgripper1, holding_0x0, torsoupposture6, armtosideposture53, armtosideposture1011),
            place_object(cupcake1, leftarm1, robotat15, manipulationareasouthtable1, on_0x1, placingareawestrighttable1, leftgripper1, holding_0x1, torsoupposture6, armtosideposture54, armtosideposture1012),
            move_base_blind_to_pma(robotat15, manipulationareasouthtable1, robotat19, premanipulationareasouthtable1)
        ]
    ]
)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- assert(
robot_activity_experience(
    
    245301,                   %% episode ID
    serve_coffee_to_guest4,             %% problem
    [
        serve_coffee_to_guest(cup1,cupcake1,guest1,table1),  %% Task
        [                       %% KeyProps
            at_start(instance(armunnamedposture, armunnamedposture0)),
            %at_start(hasphysicalentity(on4, cup1)),
            at_start(instance(gripperclosedposture, gripperclosedposture0)),
            %at_start(hasrobot(robotat0, trixi1)),
            at_start(hasgripperposture(rightgripper1, gripperclosedposture0)),
            at_start(instance(armunnamedposture, armunnamedposture1)),
            %at_start(instance(robotat, robotat0)),
            %at_start(hasarea(on4, placingareaeastrightcounter1)),
            at_start(on(cup1, placingareaeastrightcounter1)),
            at_start(on(cupcake1, placingareaeastrightcounter1)),
            at_start(hastorsoposture(torso1, torsodownposture0)),
            at_start(hasarmposture(leftarm1, armunnamedposture0)),
            %at_start(instance(on, on4)),
            %at_start(hasarea(robotat0, floorareatamsrestaurant1)),
            at_start(robotat(trixi1, floorareatamsrestaurant1)),
            at_start(hasarmposture(rightarm1, armunnamedposture1)),
            at_start(instance(torsodownposture, torsodownposture0)),
            throughout(haspremanipulationarea(table1, premanipulationareasouthtable1)),
            throughout(instance(table, table1)),
            throughout(instance(arm, leftarm1)),
            throughout(hasplacingarearight(sittingareawesttable1, placingareawestrighttable1)),
            throughout(instance(placingarea, placingareasouthrighttable2)),
            throughout(hasplacingarea(table2, placingareanorthlefttable2)),
            throughout(hasplacingarea(table1, placingareaeastlefttable1)),
            throughout(hasplacingarearight(sittingareasouthtable2, placingareasouthrighttable2)),
            throughout(haspremanipulationarea(manipulationareaeastcounter1, premanipulationareaeastcounter1)),
            throughout(hasmanipulationarea(table1, manipulationareasouthtable1)),
            throughout(instance(floorarea, floorareatamsrestaurant1)),
            throughout(instance(placingarea, placingareawestlefttable1)),
            throughout(hasplacingarea(table1, placingareawestlefttable1)),
            throughout(hasmanipulationarea(placingareasouthlefttable2, manipulationareawesttable2)),
            %throughout(instance(on, on2)),
            throughout(instance(manipulationarea, manipulationareanorthtable1)),
            %throughout(hasarea(on3, nearareatable2)),
            throughout(hasgripper(leftarm1, leftgripper1)),
            throughout(instance(torsoupposture, dummytorsoupposture)),
            throughout(instance(premanipulationarea, premanipulationareaeasttable2)),
            throughout(haspremanipulationarea(table2, premanipulationareawesttable2)),
            throughout(hasmanipulationareawest(table2, manipulationareawesttable2)),
            throughout(hasplacingarea(counter1, placingareaeastrightcounter1)),
            throughout(at(guest1, sittingareawesttable1)),
            throughout(hasplacingarealeft(sittingareanorthtable2, placingareanorthlefttable2)),
            throughout(hasplacingarea(table2, placingareasouthrighttable2)),
            %throughout(hasarea(on2, nearareatable1)),
            throughout(hassittingarea(table2, sittingareasouthtable2)),
            throughout(instance(armcarryposture, dummyarmcarryposture)),
            throughout(haspremanipulationarea(manipulationareasouthtable1, premanipulationareasouthtable1)),
            throughout(instance(premanipulationarea, premanipulationareawesttable2)),
            throughout(hasmanipulationarea(placingareaeastrightcounter1, manipulationareaeastcounter1)),
            throughout(hasmanipulationarea(placingareawestlefttable1, manipulationareanorthtable1)),
            throughout(haspremanipulationarea(table2, premanipulationareaeasttable2)),
            throughout(hasmanipulationarea(placingareaeastlefttable1, manipulationareasouthtable1)),
            throughout(instance(guest, guest1)),
            throughout(hasplacingarealeft(sittingareawesttable1, placingareawestlefttable1)),
            throughout(hasmanipulationarea(placingareaeastrighttable1, manipulationareanorthtable1)),
            throughout(instance(torso, torso1)),
            throughout(hasplacingarealeft(sittingareasouthtable2, placingareasouthlefttable2)),
            throughout(instance(premanipulationarea, premanipulationareanorthtable1)),
            throughout(instance(sittingarea, sittingareanorthtable2)),
            throughout(instance(sittingarea, sittingareasouthtable2)),
            throughout(hasmanipulationarea(placingareawestrighttable1, manipulationareasouthtable1)),
            throughout(instance(placingarea, placingareawestrighttable1)),
            throughout(hasmanipulationarea(counter1, manipulationareaeastcounter1)),
            throughout(instance(cup, cup1)),
            throughout(instance(cupcake, cupcake1)),
            throughout(instance(sittingarea, sittingareawesttable1)),
            throughout(instance(armtuckedposture, dummyarmtuckedposture)),
            %throughout(hasphysicalentity(at1, guest1)),
            %throughout(hasphysicalentity(on2, table1)),
            throughout(hasmanipulationarea(placingareanorthrighttable2, manipulationareawesttable2)),
            throughout(haspremanipulationarea(manipulationareawesttable2, premanipulationareawesttable2)),
            throughout(hasmanipulationareasouth(table1, manipulationareasouthtable1)),
            throughout(hasplacingarea(table1, placingareawestrighttable1)),
            %throughout(hasphysicalentity(on3, table2)),
            throughout(haspremanipulationarea(table1, premanipulationareanorthtable1)),
            throughout(instance(arm, rightarm1)),
            throughout(hasmanipulationarea(table2, manipulationareaeasttable2)),
            throughout(haspremanipulationarea(manipulationareanorthtable1, premanipulationareanorthtable1)),
            throughout(hasplacingarearight(sittingareanorthtable2, placingareanorthrighttable2)),
            throughout(instance(gripperclosedposture, gripperclosedposture1)),
            throughout(instance(manipulationarea, manipulationareaeasttable2)),
            throughout(instance(table, table2)),
            throughout(instance(placingarea, placingareaeastlefttable1)),
            throughout(haspremanipulationarea(manipulationareaeasttable2, premanipulationareaeasttable2)),
            %throughout(hasphysicalentity(on1, counter1)),
            throughout(hasmanipulationareanorth(table1, manipulationareanorthtable1)),
            throughout(hasplacingarea(table2, placingareanorthrighttable2)),
            throughout(hassittingarea(table1, sittingareawesttable1)),
            throughout(hasplacingarealeft(sittingareaeasttable1, placingareaeastlefttable1)),
            %throughout(hasarea(at1, sittingareawesttable1)),
            throughout(hasplacingarea(table2, placingareasouthlefttable2)),
            throughout(hasgripper(rightarm1, rightgripper1)),
            throughout(hasplacingarea(table1, placingareaeastrighttable1)),
            throughout(instance(manipulationarea, manipulationareasouthtable1)),
            throughout(instance(gripper, leftgripper1)),
            throughout(hassittingarea(table2, sittingareanorthtable2)),
            throughout(hasmanipulationarea(placingareanorthlefttable2, manipulationareaeasttable2)),
            throughout(hasmanipulationarea(placingareasouthrighttable2, manipulationareaeasttable2)),
            throughout(instance(counter, counter1)),
            throughout(hassittingarea(table1, sittingareaeasttable1)),
            %throughout(instance(on, on3)),
            throughout(instance(torsomiddleposture, dummytorsomiddleposture)),
            throughout(hasmanipulationareaeast(table2, manipulationareaeasttable2)),
            throughout(instance(armuntuckedposture, dummyarmuntuckedposture)),
            throughout(hasgripperposture(leftgripper1, gripperclosedposture1)),
            throughout(instance(premanipulationarea, premanipulationareasouthtable1)),
            throughout(instance(manipulationarea, manipulationareaeastcounter1)),
            throughout(instance(placingarea, placingareanorthrighttable2)),
            throughout(instance(manipulationarea, manipulationareawesttable2)),
            throughout(instance(placingarea, placingareaeastrightcounter1)),
            throughout(instance(placingarea, placingareanorthlefttable2)),
            throughout(instance(sittingarea, sittingareaeasttable1)),
            throughout(instance(placingarea, placingareaeastrighttable1)),
            %throughout(instance(at, at1)),
            throughout(hasmanipulationarea(table2, manipulationareawesttable2)),
            throughout(instance(placingarea, placingareasouthlefttable2)),
            throughout(instance(premanipulationarea, premanipulationareaeastcounter1)),
            throughout(hasplacingarearight(sittingareaeasttable1, placingareaeastrighttable1)),
            throughout(instance(gripper, rightgripper1)),
            %throughout(hasarea(on1, nearareacounter1)),
            throughout(hasmanipulationarea(table1, manipulationareanorthtable1)),
            %throughout(instance(on, on1)),
            at_end(instance(torsoupposture, torsoupposture6)),
            at_end(hasgripperposture(rightgripper1, gripperopeningposture8)),
            at_end(hasarmposture(rightarm1, armunnamedposture59)),
            %at_end(hasarea(on_0x0, placingareawestrighttable1)),
            at_end(on(cup1, placingareawestrighttable1)),
            at_end(on(cupcake1, placingareawestlefttable1)),
            at_end(instance(gripperopeningposture, gripperopeningposture8)),
            %at_end(instance(robotat, robotat15)),
            %at_end(instance(on, on_0x0)),
            %at_end(hasphysicalentity(on_0x0, cup1)),
            at_end(instance(armunnamedposture, armunnamedposture59)),
            at_end(instance(armcarryposture, armcarryposture47)),
            %at_end(hasarea(robotat15, manipulationareasouthtable1)),
            at_end(robotat(trixi1, manipulationareasouthtable1)),
            at_end(hastorsoposture(torso1, torsoupposture6)),
            at_end(hasarmposture(leftarm1, armcarryposture47))
            %at_end(hasrobot(robotat15, trixi1))
        ],
        none,               %% failed operation
        race_dummy,         %% failure type
        [
            tuck_arms(leftarm1, rightarm1, armunnamedposture, armunnamedposture, armunnamedposture0, armunnamedposture1, armtuckedposture, armtuckedposture, armtuckedposture7, armtuckedposture13),
            move_base(robotat0, floorareatamsrestaurant1, robotat5, premanipulationareaeastcounter1),
            move_torso(torso1, torsodownposture, torsodownposture0, torsoupposture, torsoupposture2),
            tuck_arms(leftarm1, rightarm1, armtuckedposture, armtuckedposture, armtuckedposture7, armtuckedposture13, armuntuckedposture, armtuckedposture, armuntuckedposture5, armtuckedposture1002),
            move_arm_to_side(leftarm1, armuntuckedposture, armuntuckedposture5, armtosideposture21),
            move_arm_to_side(rightarm1, armuntuckedposture, armuntuckedposture9, armtosideposture23),
            move_base_blind_to_ma(robotat5, premanipulationareaeastcounter1, robotat7, manipulationareaeastcounter1),
            %observe_objects_on_area(placingareaeastrightcounter1, robotat7, manipulationareaeastcounter1),
            pick_up_object(cup1, rightarm1, on4, robotat7, manipulationareaeastcounter1, placingareaeastrightcounter1, rightgripper1, holding_0x0, torsoupposture2, armtosideposture23, armtosideposture33),
            pick_up_object(cupcake1, leftarm1, on5, robotat7, manipulationareaeastcounter1, placingareaeastrightcounter1, leftgripper1, holding_0x1, torsoupposture2, armtosideposture21, armtosideposture31),
            move_base_blind_to_pma(robotat7, manipulationareaeastcounter1, robotat9, premanipulationareaeastcounter1),
            move_arms_to_carryposture(leftarm1, rightarm1, armtosideposture, armtosideposture, armtosideposture31, armtosideposture33, armcarryposture37, armcarryposture39),
            move_torso(torso1, torsoupposture, torsoupposture2, torsomiddleposture, torsomiddleposture4),
            move_base(robotat9, premanipulationareaeastcounter1, robotat12, premanipulationareasouthtable1),
            move_torso(torso1, torsomiddleposture, torsomiddleposture4, torsoupposture, torsoupposture6),
            move_arm_to_side(rightarm1, armcarryposture, armcarryposture39, armtosideposture53),
            move_arm_to_side(leftarm1, armcarryposture, armcarryposture37, armtosideposture54),
            move_base_blind_to_ma(robotat12, premanipulationareasouthtable1, robotat15, manipulationareasouthtable1),
            place_object(cup1, rightarm1, robotat15, manipulationareasouthtable1, on_0x0, placingareawestrighttable1, rightgripper1, holding_0x0, torsoupposture6, armtosideposture53, armtosideposture1011),
            move_base_blind_to_pma(robotat15, manipulationareasouthtable1, robotat16, premanipulationareasouthtable1),
            move_arms_to_carryposture(leftarm1, rightarm1, armtosideposture, armtosideposture, armtosideposture54, armtosideposture1011, armcarryposture40, armcarryposture41),
            move_torso(torso1, torsoupposture, torsoupposture6, torsomiddleposture, torsomiddleposture8),
            move_base(robotat16, premanipulationareasouthtable1, robotat17, premanipulationareanorthtable1),
            move_torso(torso1, torsomiddleposture, torsomiddleposture8, torsoupposture, torsoupposture9),
            move_arm_to_side(rightarm1, armcarryposture, armcarryposture41, armtosideposture56),
            move_arm_to_side(leftarm1, armcarryposture, armcarryposture40, armtosideposture55),
            move_base_blind_to_ma(robotat17, premanipulationareanorthtable1, robotat18, manipulationareanorthtable1),
            place_object(cupcake1, leftarm1, robotat18, manipulationareanorthtable1, on_0x1, placingareawestlefttable1, leftgripper1, holding_0x1, torsoupposture9, armtosideposture55, armtosideposture1012),
            move_base_blind_to_pma(robotat15, manipulationareasouthtable1, robotat19, premanipulationareasouthtable1)
        ]
    ]
)).

