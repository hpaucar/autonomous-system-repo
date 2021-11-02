;;Tutorial get from:
;;https://cw.fel.cvut.cz/old/courses/a4m36pah/tutorials

(define (domain logistics_vv)
	(:requirements :typing :fluents :action-costs)
	(:types
		location package vehicle - object
		truck plane - vehicle ;;trucks and planes are vehicles
	)

	(:predicates
		(vehicle-at ?v - vehicle ?at - location)
		(package-at ?p - package ?at - location)
		(package-in ?p - package ?in - vehicle)
		(road ?from ?to - location) ;;for truck
		(corridor ?from ?to - location) ;;for plane
	)

	(:functions
		(total-cost)
		(travel-cost ?v - vehicle)
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
			(increase (total-cost) (travel-cost ?t)))
	)

	(:action move-plane
		:parameters (?a - plane ?from ?to - location)
		:precondition (and 
			(vehicle-at ?a ?from) 
			(corridor ?from ?to))
		:effect (and 
			(not (vehicle-at ?a ?from)) 
			(vehicle-at ?a ?to) 
			(increase (total-cost) (travel-cost ?a)))
	)

	;;load/unload can be the same for both vehicles
	(:action load
		:parameters (?v - vehicle ?p - package ?where - location)
		:precondition (and 
			(vehicle-at ?v ?where) 
			(package-at ?p ?where))
		:effect (and 
			(not (package-at ?p ?where)) 
			(package-in ?p ?v))
	)

	(:action unload
		:parameters (?v - vehicle ?p - package ?where - location)
		:precondition (and 
			(vehicle-at ?v ?where) 
			(package-in ?p ?v))
		:effect (and 
			(not (package-in ?p ?v)) 
			(package-at ?p ?where))
	)
)