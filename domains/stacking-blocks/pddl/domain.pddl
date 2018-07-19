(define (domain stacking-blocks)
 (:requirements :strips)

 (:predicates
   (location ?loc)
   (pile ?pile)
   (table ?table)
   (hoist ?hoist)
   (block ?block)
   (blue ?block)
   (red ?block)
   (pallet ?pallet)

   (attached ?table ?loc)
   (belong ?hoist ?loc)
   (at ?hoist ?table)
   (holding ?hoist ?block)
   (empty ?hoist)
   (top ?block ?table)
   (on ?block1 ?block2)
   (ontable ?block ?table)
   )

 ;; there are 5 operators in this domain:

 ;; moves hoist between piles
 (:action move
     :parameters    (?hoist ?from ?to ?loc)
     :precondition  (and  (hoist ?hoist)
                          (location ?loc)
                          (belong ?hoist ?loc)
                          (attached ?from ?loc)
                          (attached ?to ?loc)
                          (at ?hoist ?from)
                          (not (= ?to ?from)))
     :effect        (and  (not (at ?hoist ?from))
                          (at ?hoist ?to)))

 ;; takes a block from a pile with a hoist
 (:action unstack
     :parameters    (?hoist ?block1 ?block2 ?pile ?loc)
     :precondition  (and  (hoist ?hoist)
                          (pile ?pile)
                          (location ?loc)
                          (belong ?hoist ?loc)
                          (attached ?pile ?loc)
                          (at ?hoist ?pile)
                          (empty ?hoist)
                          (top ?block1 ?pile)
                          (on ?block1 ?block2))
     :effect        (and  (holding ?hoist ?block1)
                          (top ?block2 ?pile)
                          (not (top ?block1 ?pile))
                          (not (on ?block1 ?block2))
                          (not (empty ?hoist))))

 ;; puts a block held by a hoist on a nearby pile
 (:action stack
     :parameters    (?hoist ?block1 ?block2 ?pile ?loc)
     :precondition  (and  (hoist ?hoist)
                          (pile ?pile)
                          (location ?loc)
                          (belong ?hoist ?loc)
                          (attached ?pile ?loc)
                          (at ?hoist ?pile)
                          (holding ?hoist ?block1)
                          (top ?block2 ?pile))
     :effect        (and  (top ?block1 ?pile)
                          (on ?block1 ?block2)
                          (not (top ?block2 ?pile))
                          (not (holding ?hoist ?block1))
                          (empty ?hoist)))

 ;; takes a block from a table with a hoist
 (:action pickup
     :parameters    (?hoist ?block ?table ?loc)
     :precondition  (and  (hoist ?hoist)
                          (table ?table)
                          (location ?loc)
                          (belong ?hoist ?loc)
                          (attached ?table ?loc)
                          (at ?hoist ?table)
                          (empty ?hoist)
                          (ontable ?block ?table))
     :effect        (and  (holding ?hoist ?block)
                          (not (ontable ?block ?table))
                          (not (empty ?hoist))))

 ;; puts a block held by a hoist on a nearby table
 (:action putdown
     :parameters    (?hoist ?block ?table ?loc)
     :precondition  (and  (hoist ?hoist)
                          (table ?table)
                          (location ?loc)
                          (belong ?hoist ?loc)
                          (attached ?table ?loc)
                          (holding ?hoist ?block)
                          (at ?hoist ?table))
     :effect        (and  (ontable ?block ?table)
                          (not (holding ?hoist ?block))
                          (empty ?hoist)))
)

