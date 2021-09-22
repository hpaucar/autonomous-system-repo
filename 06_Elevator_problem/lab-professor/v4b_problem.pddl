(define (problem elevador-problema-v4b)
  (:domain elevador-dominio-v4b)
  (:objects
    a1 a2 a3 a4 a5 - andar
    p1 p2 p3 - passageiro
    e1 e2 - elevador
    n0 n1 n2 - num
  )

  (:init
    (proximo a1 a2)
    (proximo a2 a3)
    (proximo a3 a4)
    (proximo a4 a5)
    (proximo2 n0 n1)
    (proximo2 n1 n2)
    (elevador-no-andar e1 a1)
    (elevador-no-andar e2 a5)
    (passageiro-no-andar p1 a2)
    (passageiro-no-andar p2 a2)
    (passageiro-no-andar p3 a4)
    (lotacao-atual e1 n0)
    (lotacao-atual e2 n0)
  )

  (:goal
    (and (passageiro-no-andar p1 a1)
      (passageiro-no-andar p2 a1)
      (passageiro-no-andar p3 a1))
  )
)