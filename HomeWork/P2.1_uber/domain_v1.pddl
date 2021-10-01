(define (domain domain_uber_v1)
	(:requirements :typing :fluents :action-costs)
	(:types
		location passenger vehicle - object
		truck - vehicle ;;trucks and planes are vehicles
	)

	(:predicates
		(vehicle-at ?v - vehicle ?at - location)
		(passenger-at ?p - passenger ?at - location)
		(passenger-in ?p - passenger ?in - vehicle)
		(road ?from ?to - location) ;;for truck		
		(vehicle-free ?v - vehicle)
	)

	(:functions
		(total-cost)		
		(road-size ?from ?to - location)
	)

	;;we need separate move actions because of the different types of road/corridor
	(:action move-truck
		:parameters (?t - truck ?from ?to - location)
		:precondition (and
			(vehicle-at ?t ?from)
			(road ?from ?to))
		:effect (and
			(not (vehicle-at ?t ?from))
			(vehicle-at ?t ?to)			
			(increase (total-cost) (* 5 (road-size ?from ?to))))
	)


	;;load/unload can be the same for both vehicles
	(:action load
		:parameters (?v - vehicle ?p - passenger ?where - location)
		:precondition (and
			(vehicle-at ?v ?where)
			(passenger-at ?p ?where)
			(vehicle-free ?v))
		:effect (and
			(not (passenger-at ?p ?where))
			(passenger-in ?p ?v)
			(not (vehicle-free ?v))
			)
	)

	(:action unload
		:parameters (?v - vehicle ?p - passenger ?where - location)
		:precondition (and
			(vehicle-at ?v ?where)
			(passenger-in ?p ?v))
		:effect (and
			(not (passenger-in ?p ?v))
			(passenger-at ?p ?where)
			(vehicle-free ?v)
			)
	)
)