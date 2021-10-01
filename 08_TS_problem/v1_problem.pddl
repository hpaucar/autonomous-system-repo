(define (problem problem_name)
    (:domain domain_name)
    (:objects
        A B C D E - field
        runner - player
    )

    (:init
        (neighbor A B)
        (neighbor B D)
        (neighbor A C)
        (neighbor D E)
        (neighbor C E)

        (on runner A)

        (= (cost_total) 0)

        (= (cost_step A B) 2)
        (= (cost_step B D) 2)
        (= (cost_step A C) 100)
        (= (cost_step D E) 2)
        (= (cost_step C E) 2)
    )

    (:goal
        (and
            (on runner E)
        )
    )
   
    (:metric minimize
        (cost_total)
    )
)