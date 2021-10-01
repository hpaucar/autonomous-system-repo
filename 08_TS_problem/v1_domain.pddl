;Header and description

(define (domain domain_name)

    
    (:requirements :strips :typing :fluents :action-costs)
    
    (:types
        player field
    )

    (:predicates
        (on ?player - player ?loc - field)
        (neighbor ?start - field ?end - field)
    )

    (:functions
        (cost_total)
        (cost_step ?from - field ?to - field)
    )

    (:action move
        :parameters (?player - player ?from - field ?to - field)
        :precondition (and
            (on ?player ?from)
            (neighbor ?from ?to)
        )
        :effect (and
            (on ?player ?to)
            (not (on ?player ?from))
            (increase (cost_total) (cost_step ?from ?to))
        )
    )

)