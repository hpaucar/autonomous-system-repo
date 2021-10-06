(define (problem frota_uber)
	(:domain domain_frota_uber_v1)
	(:objects
		t1 t2 - taxi
		p1 p2 p3 p4 - passenger
		A B C D E - location
	)
	(:init
		(vehicle-at t1 E)		
		(vehicle-at t2 C)
	;	(vehicle-at t3 C)

		(passenger-at p1 A)
		(passenger-at p2 A)
		(passenger-at p3 A)
		(passenger-at p4 A)

		(road A C) (road C A)
		(road C B) (road B C)
		(road B D) (road D B)
		(road C D) (road D C)
		(road D E) (road E D)
		(road E C) (road C E)
		(road A E) (road E A)

		(= (road-size A C) 20) (= (road-size C A) 20)
		(= (road-size C B) 30) (= (road-size B C) 30)
		(= (road-size B D) 20) (= (road-size D B) 20)
		(= (road-size C D) 15) (= (road-size D C) 15)
		(= (road-size D E) 20) (= (road-size E D) 20)
		(= (road-size E C) 30) (= (road-size C E) 30)
		(= (road-size A E) 30) (= (road-size E A) 30) ; change by 40

		(= (vehicle-capacity t1) 2)
		(= (vehicle-capacity t2) 2)
	;	(= (vehicle-capacity t3) 2)
		
		(= (total-distance) 0)
		(= (total-cost) 0)
	)
	(:goal (and
		(passenger-at p1 D)
		(passenger-at p2 D)
		(passenger-at p3 D)
		(passenger-at p4 D))
	)

	(:metric
		minimize (total-distance))
	
	(:metric
		maximize (total-cost)
	)

)