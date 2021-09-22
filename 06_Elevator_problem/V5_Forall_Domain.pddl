;Header and description

(define (domain forall_elevador_Dominio)

    ;remove requirements that are not needed
    (:requirements :typing :conditional-effects)

    (:types
        Elevador Passageiro Andar - object;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        elevador - Elevador
        passageiro - Passageiro
        andar - Andar
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

    (:action mover_baixo
        :parameters (?e - elevador ?atual ?prox - andar)
        :precondition (and
            (elevador_no_andar ?e ?atual)
            (proximo ?prox ?atual)
        )
        :effect (and
            (not (elevador_no_andar ?e ?atual))
            (elevador_no_andar ?e ?prox)
        )
    )

    (:action embarcar
        :parameters (?numAndar - andar ?e - elevador)
        :precondition (and (elevador_no_andar ?e ?numAndar))
        :effect (and (forall
                (?p - passageiro)
                (when
                    (passageiro_no_andar ?p ?numAndar)
                    (and (not (passageiro_no_andar ?p ?numAndar))
                        (passageiro_no_elevador ?p ?e))
                )))
    )

    (:action desembarcar
        :parameters (?numAndar - andar ?e - elevador)
        :precondition (and (elevador_no_andar ?e ?numAndar))
        :effect (and (forall
                (?p - passageiro)
                (when
                    (passageiro_no_elevador ?p ?e)
                    (and (not (passageiro_no_elevador ?p ?e))
                        (passageiro_no_andar ?p ?numAndar)))))

    )
    
    )