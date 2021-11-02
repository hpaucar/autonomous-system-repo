(define (domain airline_p01)
    (:requirements :typing :fluents :negative-preconditions :conditional-effects)
    (:types
        city group plane
    )

    (:predicates
        ; Planes
        (plane_at ?p - plane ?x - city)

        ; People groups
        (group_at ?g - group ?x - city)
        (group_want ?g - group ?y - city)
        (group_in_plane ?g - group ?p - plane)
        (group_just_unboarded ?g - group ?p - plane)
        (deadline_reached ?p - plane) ; This plane can't fly anymore
    )

    (:functions
        (city_distance ?x ?y - city) ; Distance between cities

        (group_number ?g - group) ; Number of people in group
        (group_time ?g - group) ; Group stopwatch
        (group-flights-count ?g - group) ; How many times group ?g was unboarded

        (plane_seats ?p - plane) ; Number of seats in place
        (plane_onboard ?p - plane) ; Number of group in plane
        (plane_time ?p - plane) ; Plane stopwatch

        ; Global
        (obj)
        (zero)
        (one)
        (deadline)
        (happy_people)
        (tot_people)
        (tot_time)
        (tot_flights)
    )

    (:action fly
        :parameters (?p - plane ?x ?y - city) ; Fly plane p from city x to city y
        :precondition (and 
            (plane_at ?p ?x)
            (not (deadline_reached ?p))
        )
        :effect (and 
            (plane_at ?p ?y)
            (not (plane_at ?p ?x))
            (increase (plane_time ?p) (city_distance ?x ?y))
            (increase (tot_time) (city_distance ?x ?y))
            (when
                (>= (plane_time ?p) (deadline))
                (deadline_reached ?p))
            (increase (tot_flights) 1)
        )
    )

    (:action board
        :parameters(?g - group ?p - plane ?x - city) ; Board group g at plane p in city x
        :precondition (and 
            (not (deadline_reached ?p))
            (group_at ?g ?x)
            (not (group_want ?g ?x))
            (not (group_just_unboarded ?g ?p))
            (plane_at ?p ?x)
            (>= (- (plane_seats ?p) (plane_onboard ?p)) (group_number ?g))
        )
        :effect (and 
            (increase (plane_onboard ?p) (group_number ?g))
            (not (group_at ?g ?x))
            (group_in_plane ?g ?p)
            (when
                (> (group_time ?g) (plane_time ?p))
                (assign (plane_time ?p) (group_time ?g))
            )
        )
    )

    (:action unboard
        :parameters(?g - group ?p - plane ?x - city) ; Unboard group g from plane p in city x
        :precondition (and 
            (group_in_plane ?g ?p)
            (plane_at ?p ?x)
        )
        :effect (and 
            (decrease (plane_onboard ?p) (group_number ?g))
            (group_at ?g ?x)
            (group_just_unboarded ?g ?p)
            (not (group_in_plane ?g ?p))
            (when
                (group_want ?g ?x)
                (increase (happy_people) (group_number ?g))
            )
            (assign (group_time ?g) (plane_time ?p))
        )
    )
)