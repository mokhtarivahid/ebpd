(define (problem p32)
 (:domain stacking-blocks)
 (:objects
             l1
             h1
             p1 p2 t1
             pallet1 pallet2 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32)
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
             (blue b13)
             (blue b14)
             (blue b15)
             (blue b16)
             (red b17)
             (red b18)
             (red b19)
             (red b20)
             (red b21)
             (red b22)
             (red b23)
             (red b24)
             (red b25)
             (red b26)
             (red b27)
             (red b28)
             (red b29)
             (red b30)
             (red b31)
             (red b32)

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
             (block b25)
             (block b26)
             (block b27)
             (block b28)
             (block b29)
             (block b30)
             (block b31)
             (block b32)

             (top b16 p1)

             (on b17 pallet1)
             (on b1 b17)
             (on b18 b1)
             (on b2 b18)
             (on b19 b2)
             (on b3 b19)
             (on b20 b3)
             (on b4 b20)
             (on b21 b4)
             (on b5 b21)
             (on b22 b5)
             (on b6 b22)
             (on b23 b6)
             (on b7 b23)
             (on b24 b7)
             (on b8 b24)
             (on b25 b8)
             (on b9 b25)
             (on b26 b9)
             (on b10 b26)
             (on b27 b10)
             (on b11 b27)
             (on b28 b11)
             (on b12 b28)
             (on b29 b12)
             (on b13 b29)
             (on b30 b13)
             (on b14 b30)
             (on b31 b14)
             (on b15 b31)
             (on b32 b15)
             (on b16 b32)

             (at h1 t1)
             (empty h1)
 )

 (:goal
         (and 
             (top pallet1 p1)
             (top b32 p2)
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
             (on b25 b24)
             (on b26 b25)
             (on b27 b26)
             (on b28 b27)
             (on b29 b28)
             (on b30 b29)
             (on b31 b30)
             (on b32 b31)
)))
