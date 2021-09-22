;Header and description

(define (domain v0_elevador_Dominio)

    ;remove requirements that are not needed
    (:requirements :typing )

    (:types
        elevador passageiro andar - object;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    )

    (:predicates ;todo: define predicates here
        (passageiro_no_andar ?p - passageiro ?a - andar)
        (passageiro_no_elevador ?p - passageiro ?e - elevador)
        (elevador_no_andar ?e - elevador ?a - andar)
        (proximo ?a1 - andar ?a2 - andar)
    )

    (:action mover_acima
        :parameters (?e - elevador ?atual ?prox - andar)
        :precondition (and
            (elevador_no_andar ?e ?atual)
            (proximo ?atual ?prox)
        )
        :effect (and
            (not (elevador_no_andar ?e ?atual))
            (elevador_no_andar ?e ?prox)
        )
    )

    (:action entrar
        :parameters (?p - passageiro ?numAndar - andar ?e - elevador)
        :precondition (and
            (elevador_no_andar ?e ?numAndar)
            (passageiro_no_andar ?p ?numAndar)
        )
        :effect (and
            (not (passageiro_no_andar ?p ?numAndar))
            (passageiro_no_elevador ?p ?e)
        )
    )

    (:action sair
        :parameters (?p - passageiro ?numAndar - andar ?e - elevador)
        :precondition (and
            (elevador_no_andar ?e ?numAndar)
            (passageiro_no_elevador ?p ?e)
        )
        :effect (and
            (not (passageiro_no_elevador ?p ?e))
            (passageiro_no_andar ?p ?numAndar)
        )
    )

)