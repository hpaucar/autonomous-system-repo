(define (domain elevador-dominio-v4b)

  (:requirements :typing :preferences :disjunctive-preconditions)

  (:types
    elevador passageiro andar num
  )

  (:predicates
    (passageiro-no-andar ?p -passageiro ?a -andar)
    (passageiro-no-elevador ?p -passageiro ?e -elevador)
    (elevador-no-andar ?e -elevador ?a -andar)
    (proximo ?a1 - andar ?a2 - andar)
    (lotacao-atual ?e -elevador ?lotacaoN - num)
    (proximo2 ?n1 -num ?n2 - num)
  )

  (:action move-acima
    :parameters (?e - elevador ?atual ?prox - andar)
    :precondition (and(elevador-no-andar ?e ?atual) (proximo ?atual ?prox))
    :effect (and(not(elevador-no-andar ?e ?atual))(elevador-no-andar ?e ?prox))
  )

  (:action move-abaixo
    :parameters (?e -elevador ?atual ?prox - andar)
    :precondition (and(elevador-no-andar ?e ?atual)(proximo ?prox ?atual))
    :effect (and (not (elevador-no-andar ?e ?atual)) (elevador-no-andar ?e ?prox))
  )

  (:action entrar
    :parameters (?p -passageiro ?numAndar -andar ?e -elevador ?lotacaoN1 -num ?lotacaoN2 - num)

    :precondition (and(elevador-no-andar ?e ?numAndar) (passageiro-no-andar ?p ?numAndar)
      (proximo2 ?lotacaoN1 ?lotacaoN2)
      (lotacao-atual ?e ?lotacaoN1)
      (preference maxLoad
        (or (lotacao-atual ?e n0)
          (lotacao-atual ?e n1)
          (lotacao-atual ?e n2))))
    :effect (and(not(passageiro-no-andar ?p ?numAndar)) (passageiro-no-elevador ?p ?e)
      (not(lotacao-atual ?e ?lotacaoN1)) (lotacao-atual ?e ?lotacaoN2))
  )

  (:action sair
    :parameters (?p -passageiro ?numAndar -andar ?e -elevador ?lotacaoN1 -num ?lotacaoN0 - num)
    ;;?n0 ?n1 ?n2 - num)
    :precondition ( and(elevador-no-andar ?e ?numAndar)(passageiro-no-elevador ?p ?e)
      (proximo2 ?lotacaoN0 ?lotacaoN1)
      (lotacao-atual ?e ?lotacaoN1)
      (preference maxLoad
        (or (lotacao-atual ?e n0)
          (lotacao-atual ?e n1)
          (lotacao-atual ?e n2))))

    :effect (and (passageiro-no-andar ?p ?numAndar) (not(passageiro-no-elevador ?p ?e))
      (not(lotacao-atual ?e ?lotacaoN1)) (lotacao-atual ?e ?lotacaoN0))
  )

)