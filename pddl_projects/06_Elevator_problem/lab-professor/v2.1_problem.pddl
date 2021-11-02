; Fazer o analise com o Dominio V1, isto para ver a eficiencia do FORALL
(define (problem elevador-problema-v2)
;  (:domain elevador-dominio-v1)
  (:domain elevador-dominio-v2)
  (:objects
    a1 a2 a3 a4 a5 - andar
    p1 p2 p3 p4 p5 p6 p7 - passageiro
    e1 - elevador
  )

  (:init
    (proximo a1 a2)
    (proximo a2 a3)
    (proximo a3 a4)
    (proximo a4 a5)
    (elevador-no-andar e1 a1)
    
    (passageiro-no-andar p1 a1)
    (passageiro-no-andar p2 a1)
    (passageiro-no-andar p3 a1)
    (passageiro-no-andar p4 a1)
    (passageiro-no-andar p5 a1)
    (passageiro-no-andar p6 a1)
    (passageiro-no-andar p7 a1)
  )

  (:goal
    (and 
      (passageiro-no-andar p1 a5)
      (passageiro-no-andar p2 a5)
      (passageiro-no-andar p3 a5)
      (passageiro-no-andar p4 a5)
      (passageiro-no-andar p5 a5)
      (passageiro-no-andar p6 a5)
      (passageiro-no-andar p7 a5)     
     )
  )
)