(define (problem guindaste_problema_v41)
    (:domain domain_guindaste_v4)
    (:objects
        a - plataf
        c1 c2 c3 - container
        cam - caminhao
        gui - guindaste
    )

    (:init        
        (caminhao-no-plataf cam a)

        (guindaste_na_plataf gui a)
        (guindaste_livre)

        (container-no-plataf c1 a)
        (container-no-plataf c2 a)
        (container-no-plataf c3 a)
    )

    (:goal
        (and 
            (container-no-caminhao c1 cam)
            (container-no-caminhao c2 cam)
            (container-no-caminhao c3 cam)            
        ))
)