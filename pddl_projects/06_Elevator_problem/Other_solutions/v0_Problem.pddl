;Elevator basic problem
(define (problem elevators_basic)

    (:domain v0_elevador_Dominio)

    (:objects
        a1 a2 a3 a4 a5 - andar
        e1 - elevador
        p1 - passageiro
    )

    (:init
        (proximo a1 a2)
        (proximo a2 a3)
        (proximo a3 a4)
        (proximo a4 a5)

        (elevador_no_andar e1 a1)
        (passageiro_no_andar p1 a1))

    (:goal
        (and
            (passageiro_no_andar p1 a5)
        )
    )
)