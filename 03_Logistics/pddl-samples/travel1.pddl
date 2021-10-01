(define (problem bulldozer1)
	(:domain travel)
	(:objects
		a b c d e f g jack bulldozer
	)
	(:init
		(at jack a)
		(at bulldozer e)

		(vehicle bulldozer)
		(mobile jack)
		(person jack)
		(road a b) (road b a)
		(road a e) (road e a)
		(road e b) (road b e)
		(road a c) (road c a)
		(road c b) (road b c)		
		(road d f) (road f d)
		(road f g) (road g f)
		(road d g) (road g d)

		(bridge b d) (bridge d b)
		(bridge c f) (bridge f c)

	)
	(:goal
		(and 
			(at bulldozer g) 
			(at jack a))
	)
)