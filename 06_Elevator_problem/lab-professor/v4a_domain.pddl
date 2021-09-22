(define (domain elevador-dominio-v4a)

  (:requirements :typing :preferences :disjunctive-preconditions)

  (:types
    elevador passageiro andar
  )

  (:predicates
    (passageiro-no-andar ?p -passageiro ?a -andar)
    (passageiro-no-elevador ?p -passageiro ?e -elevador)
    (elevador-no-andar ?e -elevador ?a -andar)
    (proximo ?a1 - andar ?a2 - andar)
    (lotacao-atual ?e -elevador ?lotacaoN - andar) ;capacidade atual do elevador
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
    :parameters (?p -passageiro ?numAndar -andar ?e -elevador ?lotacaoN1 -andar ?lotacaoN2 - andar ?n1 ?n2 ?n3 ?n4 ?n5 - andar)
    :precondition (and (elevador-no-andar ?e ?numAndar) (passageiro-no-andar ?p ?numAndar)
      (proximo ?lotacaoN1 ?lotacaoN2)
      (lotacao-atual ?e ?lotacaoN1)
      (preference maxLoad
        (or 
          (lotacao-atual ?e ?n1)
          (lotacao-atual ?e ?n2) 
          (lotacao-atual ?e ?n3)
          (lotacao-atual ?e ?n4) 
          (lotacao-atual ?e ?n5))))
    :effect (and 
      (not (passageiro-no-andar ?p ?numAndar)) 
      (passageiro-no-elevador ?p ?e)
      (not (lotacao-atual ?e ?lotacaoN1)) 
      (lotacao-atual ?e ?lotacaoN2))
  )

  (:action sair
    :parameters (?p -passageiro ?numAndar -andar ?e -elevador ?lotacaoN1 -andar ?lotacaoN0 - andar ?n1 ?n2 ?n3 ?n4 ?n5 - andar)
    :precondition ( and(elevador-no-andar ?e ?numAndar)(passageiro-no-elevador ?p ?e)
      (proximo ?lotacaoN0 ?lotacaoN1)
      (lotacao-atual ?e ?lotacaoN1)
      (preference maxLoad
        (or (lotacao-atual ?e ?n1)
          (lotacao-atual ?e ?n2) (lotacao-atual ?e ?n3)
          (lotacao-atual ?e ?n4) (lotacao-atual ?e ?n5))))

    :effect (and (passageiro-no-andar ?p ?numAndar) (not(passageiro-no-elevador ?p ?e))
      (not(lotacao-atual ?e ?lotacaoN1)) (lotacao-atual ?e ?lotacaoN0))
  )

)