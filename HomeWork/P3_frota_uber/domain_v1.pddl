(define (domain domain_frota_uber_v1)
	(:requirements :typing :fluents :action-costs :conditional-effects)
	(:types
		location passenger vehicle - object
		taxi - vehicle ;;taxis and planes are vehicles
	)

	(:predicates
		(vehicle-at ?v - vehicle ?at - location)
		(passenger-at ?p - passenger ?at - location)
		(passenger-in ?p - passenger ?in - vehicle)
		(road ?from ?to - location) ;;for taxi		
	;	(vehicle-free ?v - vehicle)
	)

	(:functions
		(total-distance)
		(total-cost)
		(road-size ?from ?to - location)
		(vehicle-capacity ?v - vehicle)
	)

	;;we need separate move actions because of the different types of road/corridor
	(:action move-taxi
		:parameters (?t - taxi ?from ?to - location)
		:precondition (and
			(vehicle-at ?t ?from)
			(road ?from ?to))
		:effect (and					
			(when (= (vehicle-capacity ?t) 1)
				(increase (total-cost) (* 1.5 (road-size ?from ?to))))
			(when (= (vehicle-capacity ?t) 0) 
				(increase (total-cost) (* 2 (road-size ?from ?to))))
			(increase (total-distance) (road-size ?from ?to))
			
			(not (vehicle-at ?t ?from))
			(vehicle-at ?t ?to)	
		)
	)

	;;load/unload can be the same for both vehicles
	(:action load
		:parameters (?v - vehicle ?p - passenger ?where - location)
		:precondition (and
			(vehicle-at ?v ?where)
			(passenger-at ?p ?where)			
			(> (vehicle-capacity ?v) 0))
		:effect (and
			(not (passenger-at ?p ?where))
			(passenger-in ?p ?v)			
			(decrease (vehicle-capacity ?v) 1))
	)

	(:action unload
		:parameters (?v - vehicle ?p - passenger ?where - location)
		:precondition (and
			(vehicle-at ?v ?where)
			(passenger-in ?p ?v))
		:effect (and
			(not (passenger-in ?p ?v))
			(passenger-at ?p ?where)
			(increase (vehicle-capacity ?v) 1))
	)
)