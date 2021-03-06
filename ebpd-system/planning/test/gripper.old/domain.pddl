(define (domain gripper)
 (:requirements :strips :typing) 
 (:types table object robot gripper)
 (:predicates 
        (at ?r - robot ?x - table)
        (on ?o - object ?x - table)
        (free ?r - robot ?g - gripper)
        (holding ?r - robot ?o - object ?g - gripper)
        (reach ?r - robot ?t - table))

   (:action move
       :parameters (?r - robot ?from ?to - table)
       :parent     (nil ())
       :static     (reach ?r ?to)
       :precondition (at ?r ?from)
       :effect (and (at ?r ?to) (not (at ?r ?from))))

   (:action pick
       :parameters (?r - robot ?o - object ?t - table ?g - gripper)
       :parent     (pick (?o ?t))
       :static     ()
       :precondition (and (on ?o ?t) (at ?r ?t) (free ?r ?g))
       :effect (and (holding ?r ?o ?g) (not (on ?o ?t)) (not (free ?r ?g))))

   (:action drop
       :parameters (?r - robot ?o - object ?t - table ?g - gripper)
       :parent     (drop (?o ?t))
       :static     ()
       :precondition (and (holding ?r ?o ?g) (at ?r ?t))
       :effect (and (on ?o ?t) (free ?r ?g) (not (holding ?r ?o ?g))))
)