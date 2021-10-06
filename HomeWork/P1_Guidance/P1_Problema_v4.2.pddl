(define (problem guindaste_problema_v42)
    (:domain domain_guindaste_v4)
    (:objects
        a - plataf
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - container
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
        (container-no-plataf c4 a)
        (container-no-plataf c5 a)
        (container-no-plataf c6 a)
        (container-no-plataf c7 a)
        (container-no-plataf c8 a)
        (container-no-plataf c9 a)
        (container-no-plataf c10 a)
        (container-no-plataf c11 a)
        (container-no-plataf c12 a)
    )

    (:goal
        (and 
            (container-no-caminhao c1 cam)
            (container-no-caminhao c2 cam)
            (container-no-caminhao c3 cam)
            (container-no-caminhao c4 cam)
            (container-no-caminhao c5 cam)
            (container-no-caminhao c6 cam)
            (container-no-caminhao c7 cam)
            (container-no-caminhao c8 cam)
            (container-no-caminhao c9 cam)
            (container-no-caminhao c10 cam)
            (container-no-caminhao c11 cam)
            (container-no-caminhao c12 cam)            
        ))
)