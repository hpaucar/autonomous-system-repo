(define (problem problem_uber_v1) 
(:domain domain_uber_v1)
(:objects 
    c1 - carro 
    p1 p2 - passageiro
    A B C D E - ubicacao
)

(:init
    (rota A C) (rota C A)
    (rota C B) (rota B C)
    (rota B D) (rota D B)
    (rota D E) (rota E D)
    (rota A E) (rota E A)
    (rota C E) (rota E C)

    (passageiro_esperando p1) (passageiro_na_ubicacao p1 A)
    (passageiro_esperando p2) (passageiro_na_ubicacao p2 E)
    
    (carro_livre c1)
    (carro_na_ubicacao c1 D)
)

(:goal (and
    (passageiro_na_ubicacao p1 B)
    (passageiro_na_ubicacao p2 B)
    ;(carro_na_ubicacao c1 A) 
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
