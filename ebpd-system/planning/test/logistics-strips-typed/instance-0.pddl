(define (problem logistics-4-0)
(:domain logistics)
(:objects
 apn1 - airplane
 apt1 apt2 - airport
 loc2 loc1 - location
 cit2 cit1 - city
 tru2 tru1 - truck
 obj11 obj12 ;obj13 obj14 obj15 obj16 obj17 obj18 obj19 obj20 
 - package)

(:init 
 	(in-city loc1 cit1) 
 	(in-city loc2 cit2)
 	(in-city apt1 cit1) 
 	(in-city apt2 cit2)
	(at apn1 apt1)
	(at tru1 loc1)
	(at tru2 loc2)
	(at obj11 loc1)
	(at obj12 loc1)
	; (at obj13 loc1)
	; (at obj14 loc1)
	; (at obj15 loc1)
	; (at obj16 loc1)
	; (at obj17 loc1)
	; (at obj18 loc1)
	; (at obj19 loc1)
	; (at obj20 loc1)
 	)

(:goal (and 
			(at obj11 loc2) 
			(at obj12 loc2) 
			; (at obj13 loc2) 
			; (at obj14 loc2) 
			; (at obj15 loc2) 
			; (at obj16 loc2) 
			; (at obj17 loc2) 
			; (at obj18 loc2) 
			; (at obj19 loc2) 
			; (at obj20 loc2) 
		))
)