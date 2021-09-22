(define (domain v3_elevator)
    (:requirements :typing)
    (:types
        floor locatable - object
        person elevator - locatable
    )
    (:predicates
        (at ?obj - locatable ?floor - floor)
        (isFull ?elev - elevator)
        (isEmpty ?elev - elevator)
        (in ?pers - person ?elev - elevator)
        (isWaiting ?pers - person)
        (isConnected ?flo1 ?flo2 - floor)
    )
    ;   (:functions (time_to_move ?flo_from ?flo_to - floor))
    (:action MOVE_UP
        :parameters (?elev - elevator ?flo_from - floor ?flo_to - floor)
        ;:duration (= 1)
        :precondition (and (at ?elev ?flo_from)
            (isConnected ?flo_from ?flo_to))
        ;(overall (?flo_to = ?flo_from + 1)))
        :effect (and 
            (not (at ?elev ?flo_from))
            (at ?elev ?flo_to))
    )
)