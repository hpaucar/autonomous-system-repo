(define (domain uberPool)

	(:requirements :typing :fluents :durative-actions :conditional-effects)

	(:types
		location locatable time - object
		pump - location
		person uber - locatable
		driver customer - person
	)

	(:predicates
		(at ?locata - locatable ?loc - location)
		(in-cust ?cust - customer ?ube - uber)
		(in-driv ?driv - driver ?ube - uber)
		(on-shift ?driv - driver)
		(idle ?driv - driver)
		(link ?loc1 ?loc2 - location)
		(time-not-running ?tim - time)
		(time-running ?tim - time)
	)

	(:functions
		(distance ?loc1 ?loc2 - location)
		(time-surge)
		(time)
		(fuel-level ?ube - uber)
		(customer-count ?ube - uber)
		(speed ?ube - uber)

		(:durative-action DRIVER-BOARD
			:parameters (?ube - uber ?driv - driver ?loc - location ?tim - time)
			:duration (= ?duration 1)
			:condition (and (at start (at ?driv ?loc))
				(at start (time-runnning ?tim))
				(at start (idle ?driv))
				(overall
					(at ?ube ?loc)))
			:effect (and (at start (not (at ?driv ?loc)))
				(at end (in-driv ?driv ?ube)))
		)

		(:durative-action DRIVER-UNBOARD
			:parameters (?ube - uber ?driv - driver ?loc - location)
			:duration (= ?duration 1)
			:condition (and (at start (at ?ube ?loc))
				(at start (idle ?driv))
				(at start (in-driv ?driv ?ube)))
			:effect (and (at start (not (in-driv ?driv ?uber)))
				(at end (at ?driv ?loc)))
		)

		(:durative-action SHIFT
			:parameters (?driv - driver ?loc - location)
			:duration (= ?duration 480)
			:condition (and (at start (idle ?driv))
				(at start (in-driv ?driv ?ube)))
			:effect (and (at start (not (idle ?driv)))
				(at start (on-shift ?driv))
				(at end (idle ?driv))
				(at end (not (on-shift ?driv))))
		)

		(:durative-action TIME
			:parameters (?tim - time)
			:duration (= ?duration 1500)
			:condition (at start (time-not-running ?tim - time))
			:effect (and (at start (not (time-not-running ?tim)))
				(at start (time-running ?tim))
				(at end (time-not-running ?tim))
				(at end (not (time-running ?tim)))
				(increase (time) (* #t 1)))
		)

		(:action CHANGE-TIME-SURGE
			:parameters (?tim - time)
			:precondition (and (time-running ?tim)
				(= (time) 720))
			:effect (increase (time-surge) 1)
		)

		(:durative-action REFUEL
			:parameters (?pum - pump ?ube - uber)
			:duration (= ?duration 5)
			:condition (and (at start (>= (fuel-level ?ube) 1))
				(at start (<= (fuel-level ?ube) 50))
				(overall
					(at ?ube - uber ?pum - pump)))
			:effect (at end (= (fuel-level ?ube) 100))
		)

		(:durative-action CUSTOMER-BOARD
			:parameters (?cust - customer ?loc - location ?ube - uber)
			:duration (= ?duration 1)
			:condition (and (at start (at ?cust ?loc))
				(at start (< (customer-count ?ube) 2))
				(overall
					(at ?ube ?loc)))
			:effect (and (at start (not (at ?cust ?loc)))
				(at end (in-cust ?cust ?ube))
				(at end (increase (customer-count ?ube) 1)))
		)

		(:durative-action CUSTOMER-UNBOARD
			:parameters (?cust - customer ?loc - location ?ube - uber)
			:duration (= ?duration 1)
			:condition (and (at start (> (customer-count ?ube) 0))
				(at start (in-cust ?cust ?ube))
				(overall
					(at ?ube ?loc)))
			:effect (and (at end (not (in-cust ?cust ?ube)))
				(at end (at ?cust ?loc))
				(at end (decrease (customer-count ?ube) 1)))
		)

		(:durative-action DRIVE
			:parameters (?driv - driver ?ube - uber ?loc-from - location ?loc-to - location)
			:duration (= ?duration (/ (distance ?loc-from ?loc-to) (* (time-surge) (speed ?ube))))
			:condition (and (overall
					(on-shift ?driv))
				(overall
					(in-driv ?driv ?ube))
				(overall
					(> (fuel-level) 1))
				(at start (at ?ube ?loc-from)))
			:effect (and (at end (at ?ube ?loc-to))
				(at end (not (at ?ube ?loc-from))
					(decrease
						(fuel-level ?ube)
						(* #t (* (time-surge) (* (speed ?ube) (0.1)))))))
		)))