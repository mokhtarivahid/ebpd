(define (problem p50)
 (:domain stacking-blocks)
 (:objects
             l1
             h1
             p1 p2 t1
             pallet1 pallet2 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50)
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
             (blue b17)
             (blue b18)
             (blue b19)
             (blue b20)
             (blue b21)
             (blue b22)
             (blue b23)
             (blue b24)
             (blue b25)
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
             (red b47)
             (red b48)
             (red b49)
             (red b50)

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
             (block b47)
             (block b48)
             (block b49)
             (block b50)

             (top b1 p1)

             (on b50 pallet1)
             (on b49 b50)
             (on b48 b49)
             (on b47 b48)
             (on b46 b47)
             (on b45 b46)
             (on b44 b45)
             (on b43 b44)
             (on b42 b43)
             (on b41 b42)
             (on b40 b41)
             (on b39 b40)
             (on b38 b39)
             (on b37 b38)
             (on b36 b37)
             (on b35 b36)
             (on b34 b35)
             (on b33 b34)
             (on b32 b33)
             (on b31 b32)
             (on b30 b31)
             (on b29 b30)
             (on b28 b29)
             (on b27 b28)
             (on b26 b27)
             (on b25 b26)
             (on b24 b25)
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
             (top b50 p2)
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
             (on b47 b46)
             (on b48 b47)
             (on b49 b48)
             (on b50 b49)
)))
