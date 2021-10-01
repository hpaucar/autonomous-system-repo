(define (problem guindaste_problema_v2)
    (:domain domain_guindaste_v2)
    (:objects
        pa pb - plataf
        c1 c2 c3 - container
        cam - caminhao
        gui - guindaste
    )

    (:init
        (proximo pb pa)
        (caminhao-no-plataf cam pb)

        (guindaste_na_plataf gui pa)
        (guindaste_livre)

        (container-no-plataf c1 pa)
        (container-no-plataf c2 pa)
        (container-no-plataf c3 pa)
    )

    (:goal
        (and (container-no-plataf c1 pb)
            (container-no-plataf c2 pb)
            (container-no-plataf c3 pb))
    )
)