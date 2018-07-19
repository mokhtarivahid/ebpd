(define (problem p46)
 (:domain stacking-blocks)
 (:objects
             l1
             h1
             p1 t1
             pallet1 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46)
 (:init
             (location l1)
             (hoist h1)
             (pile p1)
             (table t1)

             (attached p1 l1)
             (attached t1 l1)

             (belong h1 l1)

             (pallet pallet1)
             (top pallet1 p1)

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
             (blue b17)
             (blue b18)
             (blue b19)
             (blue b20)
             (blue b21)
             (blue b22)
             (blue b23)
             (red b24)
             (red b25)
             (red b26)
             (red b27)
             (red b28)
             (red b29)
             (red b30)
             (red b31)
             (red b32)
             (red b33)
             (red b34)
             (red b35)
             (red b36)
             (red b37)
             (red b38)
             (red b39)
             (red b40)
             (red b41)
             (red b42)
             (red b43)
             (red b44)
             (red b45)
             (red b46)

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
             (block b33)
             (block b34)
             (block b35)
             (block b36)
             (block b37)
             (block b38)
             (block b39)
             (block b40)
             (block b41)
             (block b42)
             (block b43)
             (block b44)
             (block b45)
             (block b46)

             (ontable b1 t1)
             (ontable b2 t1)
             (ontable b3 t1)
             (ontable b4 t1)
             (ontable b5 t1)
             (ontable b6 t1)
             (ontable b7 t1)
             (ontable b8 t1)
             (ontable b9 t1)
             (ontable b10 t1)
             (ontable b11 t1)
             (ontable b12 t1)
             (ontable b13 t1)
             (ontable b14 t1)
             (ontable b15 t1)
             (ontable b16 t1)
             (ontable b17 t1)
             (ontable b18 t1)
             (ontable b19 t1)
             (ontable b20 t1)
             (ontable b21 t1)
             (ontable b22 t1)
             (ontable b23 t1)
             (ontable b24 t1)
             (ontable b25 t1)
             (ontable b26 t1)
             (ontable b27 t1)
             (ontable b28 t1)
             (ontable b29 t1)
             (ontable b30 t1)
             (ontable b31 t1)
             (ontable b32 t1)
             (ontable b33 t1)
             (ontable b34 t1)
             (ontable b35 t1)
             (ontable b36 t1)
             (ontable b37 t1)
             (ontable b38 t1)
             (ontable b39 t1)
             (ontable b40 t1)
             (ontable b41 t1)
             (ontable b42 t1)
             (ontable b43 t1)
             (ontable b44 t1)
             (ontable b45 t1)
             (ontable b46 t1)

             (at h1 t1)
             (empty h1)
 )

 (:goal
         (and 
             (top b46 p1)

             (on b1 pallet1)
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
             (on b33 b32)
             (on b34 b33)
             (on b35 b34)
             (on b36 b35)
             (on b37 b36)
             (on b38 b37)
             (on b39 b38)
             (on b40 b39)
             (on b41 b40)
             (on b42 b41)
             (on b43 b42)
             (on b44 b43)
             (on b45 b44)
             (on b46 b45)
)))
