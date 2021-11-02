;;simple problem shown at the tutorial. 
;;Excercise 1: try to make a bigger problem
;;Excercise 2: extend the domain definition with costs

(define (problem p1)
	(:domain logistics)
	(:objects
		t1 t2 - truck
		pl - plane
		p - package
		A B C - location
	)
	(:init
		(vehicle-at t1 A)
		(vehicle-at t2 B)
		(vehicle-at pl B)
		(package-at p A)
		(road A B)
		(road B A)
		(corridor B C)
		(corridor C B)

		(= (total-cost) 0)

		(= (travel-cost t1) 3) 
		(= (travel-cost t2) 1) 
		(= (travel-cost pl) 10) 
		
		 (= (distance A B) 10)
	    (= (distance B A) 10)
	    (= (distance C B) 100)
	    (= (distance B C) 100)
	)
	(:goal
		(package-at p C)
	)
	(:metric
		minimize (total-cost)
	)
)