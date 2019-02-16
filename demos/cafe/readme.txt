;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Demonstrations include the teaching scenarios for the 'cafe' EBPD on a PR2 in 
Gazebo. The first demo shows the task one in 'ServeACoffee' demonstration in 
which the PR2 moves to the counter, picks up mug1 from the counter, moves to 
the table where a guest sits, and puts the mug1 on the table in front of the 
guest. In the second demo, PR2 picks up two mugs from the counter and moves to 
the both south and north sides of the table and puts mug1 and mug2 in the goal 
placing areas.

Note that:
1) The videos are not annotated which we will provide fully annotated videos 
   for the final version of the paper.

2) For some reason the simulator failed to execute the last action (i.e., place 
   mug2 on north of the table) in the second demo. We are debugging the code to 
   resolve that problem and will include videos of demonstrations of the system 
   in all scenarios for the final version of the paper.



The abstract and concrete domains, experiences, learned activity schemata, 
generated scopes of applicability and problems, used in this experiment, are 
available in the 'cafe' domain.