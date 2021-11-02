; Sorting By Reversal

(define (problem Sorting_by_reversal_problem)
    (:domain sorting_by_reversal)

    (:objects        
        n1 n2 n3 n4
    )

    (:init
        (is_first n1)
        (is_last n1)
        (next n1 n3) (next n3 n4) (next n4 n2) (next n4 n2) (next n2 n1)
    )

    (:goal
        (and
           (is_first n1)
           (is_last n1)
           (next n1 n2) 
           (next n2 n3) 
           (next n3 n4) 
        )
    )
)