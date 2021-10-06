(define (problem guindaste_problema_v2)
    (:domain domain_guindaste_v3)
    (:objects
        a b - plataf
        c1 c2 c3 - container
        cam - caminhao
        gui - guindaste
    )

    (:init
        (proximo b a) (proximo a b) 
        (caminhao-no-plataf cam b)

        (guindaste_na_plataf gui a)
        (guindaste_livre)

        (container-no-plataf c1 a)
        (container-no-plataf c2 a)
        (container-no-plataf c3 a)
    )

    (:goal
        (and 
            (container-no-plataf c1 b)
            (container-no-plataf c2 b)
            (container-no-plataf c3 b)))
)