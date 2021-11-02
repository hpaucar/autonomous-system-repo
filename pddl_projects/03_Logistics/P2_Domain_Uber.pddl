;Description of Domain to Uber problem.

(define (domain domain_uber_v1)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions)

(:types
    carro passageiro ubicacao
)

(:predicates ;todo: define predicates here
 ;   (embarcar ?car - carro ?pass - passageiro)
 ;   (desembarcar ?car - carro ?pass - passageiro)
    (passageiro_no_carro ?pass - passageiro ?car - carro)
    (passageiro_na_ubicacao ?pass - passageiro ?u - ubicacao)
    (carro_na_ubicacao ?car - carro ?u - ubicacao)
    (rota ?u1 ?u2 - ubicacao)
    (carro_viajando ?car)
    (carro_livre ?car)
    (passageiro_esperando ?pass - passageiro)
)

(:action viajando_fazia_passageiro
    :parameters (?car - carro ?u1  ?u2 - ubicacao ?pass - passageiro)
    :precondition (and 
        (passageiro_esperando ?pass)
        (rota ?u1 ?u2)        
        (carro_na_ubicacao ?car ?u1)
        (carro_livre ?car)
        ;(passageiro_na_ubicacao ?pass ?u1)
    )
    :effect (and 
        (not (carro_na_ubicacao ?car ?u1))
        (carro_na_ubicacao ?car ?u2)
    )
)

(:action viajando_com_passageiro
    :parameters (?car - carro ?u1  ?u2 - ubicacao ?pass - passageiro)
    :precondition (and 
        (passageiro_no_carro ?pass ?car)
        (rota ?u1 ?u2)        
        (carro_na_ubicacao ?car ?u1)
        ;(passageiro_na_ubicacao ?pass ?u1)
    )
    :effect (and 
        (not (carro_na_ubicacao ?car ?u1))
        (carro_na_ubicacao ?car ?u2)
    )
)


(:action embarcar
    :parameters (?pass - passageiro ?car - carro ?u - ubicacao)
    :precondition (and 
        (carro_livre ?car)
        (carro_na_ubicacao ?car ?u)
        (passageiro_na_ubicacao ?pass ?u) 
        (passageiro_esperando ?pass)       
    )
    :effect (and 
        (passageiro_no_carro ?pass ?car)
        (not (carro_livre ?car))
        (not (passageiro_esperando ?pass))
    )
)

(:action desembarcar
    :parameters (?pass - passageiro ?car - carro ?u - ubicacao)
    :precondition (and         
        (not (carro_livre ?car))
        (passageiro_no_carro ?pass ?car)
        (carro_na_ubicacao ?car ?u)             
    )
    :effect (and 
        (passageiro_na_ubicacao ?pass ?u)
        (not (passageiro_no_carro ?pass ?car))
        (carro_livre ?car)        
    )
)

)