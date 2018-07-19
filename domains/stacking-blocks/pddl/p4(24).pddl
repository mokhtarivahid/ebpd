(define (problem p24)
 (:domain stacking-blocks)
 (:objects
             l1
             h1
             p1 p2 t1
             pallet1 pallet2 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24)
 (:init
             (location l1)
             (hoist h1)
             (pile p1)
             (pile p2)
             (table t1)

             (attached p1 l1)
             (attached p2 l1)
             (attached t1 l1)

             (belong h1 l1)

             (pallet pallet1)
             (pallet pallet2)
             (top pallet2 p2)

             (blue b1)
             (blue b2)
             (blue b3)
             (blue b4)
             (blue b5)
             (blue b6)
             (blue b7)
             (blue b8)
             (blue b9)
             (blue b10)
             (blue b11)
             (blue b12)
             (red b13)
             (red b14)
             (red b15)
             (red b16)
             (red b17)
             (red b18)
             (red b19)
             (red b20)
             (red b21)
             (red b22)
             (red b23)
             (red b24)

             (block b1)
             (block b2)
             (block b3)
             (block b4)
             (block b5)
             (block b6)
             (block b7)
             (block b8)
             (block b9)
             (block b10)
             (block b11)
             (block b12)
             (block b13)
             (block b14)
             (block b15)
             (block b16)
             (block b17)
             (block b18)
             (block b19)
             (block b20)
             (block b21)
             (block b22)
             (block b23)
             (block b24)

             (top b1 p1)

             (on b24 pallet1)
             (on b23 b24)
             (on b22 b23)
             (on b21 b22)
             (on b20 b21)
             (on b19 b20)
             (on b18 b19)
             (on b17 b18)
             (on b16 b17)
             (on b15 b16)
             (on b14 b15)
             (on b13 b14)
             (on b12 b13)
             (on b11 b12)
             (on b10 b11)
             (on b9 b10)
             (on b8 b9)
             (on b7 b8)
             (on b6 b7)
             (on b5 b6)
             (on b4 b5)
             (on b3 b4)
             (on b2 b3)
             (on b1 b2)

             (at h1 t1)
             (empty h1)
 )

 (:goal
         (and 
             (top pallet1 p1)
             (top b24 p2)
             (on b1 pallet2)
             (on b2 b1)
             (on b3 b2)
             (on b4 b3)
             (on b5 b4)
             (on b6 b5)
             (on b7 b6)
             (on b8 b7)
             (on b9 b8)
             (on b10 b9)
             (on b11 b10)
             (on b12 b11)
             (on b13 b12)
             (on b14 b13)
             (on b15 b14)
             (on b16 b15)
             (on b17 b16)
             (on b18 b17)
             (on b19 b18)
             (on b20 b19)
             (on b21 b20)
             (on b22 b21)
             (on b23 b22)
             (on b24 b23)
)))
