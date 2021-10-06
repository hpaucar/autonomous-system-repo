; Exercício 1: Guindaste robótico
; Primierio vamos definir quais vão ser nossos objetos
; Do texto temos: guidance, container, caminhao, plataforma (ponto A)

(define (domain domain_guindaste_v1)

;remove requirements that are not needed
(:requirements :typing)

(:types 
    guindaste container caminhao plataforma - object
)


(:predicates ;todo: define predicates here
    (caminhao_na_plat ?ca - caminhao ?p1 - plataforma)
    (guindaste_na_plat ?gui - guindaste ?p1 - plataforma)
    (container_no_guindaste ?con - container)
    (container_no_caminhao ?con - container ?cam - caminhao)    
    (container_na_plat ?con - container ?pla - plataforma)
    (guindaste_livre)
)

(:action mover_fazia_guindaste
    :parameters (?ca - caminhao ?pB ?pA - plataforma)
    :precondition (and 
        (caminhao_na_plat ?ca ?pB))
    :effect (and 
        (caminhao_na_plat ?ca ?pA)
        (not (caminhao_na_plat ?ca ?pB))
    )
)

(:action mover_fazia_base
    :parameters (?ca - caminhao ?pA ?pB - plataforma)
    :precondition (and 
        (caminhao_na_plat ?ca ?pA))
    :effect (and 
        (caminhao_na_plat ?ca ?pB)
        (not (caminhao_na_plat ?ca ?pA))
    )
)

(:action pegar_container
    :parameters (?con - container ?cam - caminhao ?gui - guindaste ?pla - plataforma)
    :precondition (and 
        (container_na_plat ?con ?pla)
        (guindaste_livre)
        (guindaste_na_plat ?gui ?pla)        
        (caminhao_na_plat ?cam ?pla)        
    )
    :effect (and 
        (container_no_guindaste ?con)
        (not (guindaste_livre))
        (not (container_na_plat ?con ?pla))
    )
)

(:action soltar_container
    :parameters (?con - container ?cam - caminhao)
    :precondition (and 
        (container_no_guindaste ?con)
    )
    :effect (and 
        (container_no_caminhao ?con ?cam)
        (not (container_no_guindaste ?con))
        (guindaste_livre)
    )
)

(:action descarregar_containers
    :parameters (?con - container ?cam - caminhao ?pla - plataforma)
    :precondition (and 
        (caminhao_na_plat ?cam ?pla)
        (container_no_caminhao ?con ?cam)
    )
    :effect (and 
        (container_na_plat ?con ?pla)
        (not (container_no_caminhao ?con ?cam))
    )
)


)

