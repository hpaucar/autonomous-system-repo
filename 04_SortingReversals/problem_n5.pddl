; Sorting By Reversal

(define (problem Sorting_by_reversal_problem)
    (:domain sorting_by_reversal)

    (:objects
        ; the only thing is the `world`
        n1 n2 n3 n4 n5
    )

    (:init
        ; Let's assume that the world can hear us
        (is_first n1)
        (is_last n1)
        (next n1 n5) (next n5 n3) (next n3 n4) (next n4 n2) (next n2 n1)
    )

    (:goal
        (and
            ; The only goal is to reach a state where we said 'hello'
           (is_first n1)
           (is_last n1)
           (next n1 n2) 
           (next n2 n3) 
           (next n3 n4) 
           (next n4 n5)            
        )
    )
)