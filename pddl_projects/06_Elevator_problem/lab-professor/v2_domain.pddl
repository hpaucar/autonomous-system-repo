(define (domain elevador-dominio-v2)

  (:requirements :typing :conditional-effects)

  (:types
    elevador passageiro andar
  )

  (:predicates
    (passageiro-no-andar ?p -passageiro ?a -andar)
    (passageiro-no-elevador ?p -passageiro ?e -elevador)
    (elevador-no-andar ?e -elevador ?a -andar)
    (proximo ?n1 - andar ?a2 - andar)
  )

  (:action move-acima
    :parameters (?e - elevador ?atual ?prox - andar)
    :precondition (and (elevador-no-andar ?e ?atual) (proximo ?atual ?prox))
    :effect (and (not (elevador-no-andar ?e ?atual))(elevador-no-andar ?e ?prox))
  )

  (:action move-abaixo
    :parameters (?e -elevador ?atual ?prox - andar)
    :precondition (and (elevador-no-andar ?e ?atual)(proximo ?prox ?atual))
    :effect (and (not (elevador-no-andar ?e ?atual))(elevador-no-andar ?e ?prox))
  )

  (:action embarcar
    :parameters (?numAndar -andar ?e -elevador)
    :precondition (and (elevador-no-andar ?e ?numAndar))
    :effect (and (forall
        (?p - passageiro)
        (when
          (passageiro-no-andar ?p ?numAndar)
          (and (passageiro-no-elevador ?p ?e)
            (not (passageiro-no-andar ?p ?numAndar))))))
  )

  (:action desembarcar
    :parameters (?numAndar -andar ?e -elevador)
    :precondition (and (elevador-no-andar ?e ?numAndar))
    :effect (and (forall
        (?p - passageiro)
        (when
          (passageiro-no-elevador ?p ?e)
          (and (passageiro-no-andar ?p ?numAndar)
               (not (passageiro-no-elevador ?p ?e))))))
  )
)