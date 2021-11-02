;;Tutorial get from:
;;https://cw.fel.cvut.cz/old/courses/a4m36pah/tutorials

;;simple problem shown at the tutorial. 
;;Excercise 1: try to make a bigger problem
;;Excercise 2: extend the domain definition with costs

(define (problem p1_v2)
	(:domain logistics_vv)
	(:objects
		t1 t2 - truck
		pl - plane
		p - package
		A B C D - location
	)
	(:init
		(vehicle-at t1 A)
		(vehicle-at t2 B)
		(vehicle-at pl B)
		
		(package-at p A)
		
		(road A B) (road B A)
		(road B C) (road C B)
		(road C D) (road D C)
		
		(corridor B D) (corridor D B)

		(= (total-cost) 0)

		(= (travel-cost t1) 3) 
		(= (travel-cost t2) 1) 
		(= (travel-cost pl) 10) 
	)
	(:goal
		(package-at p D)
	)
	(:metric
		minimize (total-cost)
	)
)
