; Exercício 1: Guindaste robótico
; Primierio vamos definir quais vão ser nossos objetos
; Do texto temos: guidance, container, caminhao, plataforma (ponto A)
; Header and description

(define (domain domain_guindaste_v4)

    (:requirements :typing :negative-preconditions :conditional-effects)

    (:types
        caminhao container plataf guindaste
    )

    (:predicates
        (container-no-plataf ?co - container ?pla - plataf)
        (container-no-caminhao ?co - container ?cam - caminhao)
        (container_no_guindaste ?co - container ?gui - guindaste)
        
        (caminhao-no-plataf ?cam - caminhao ?pla - plataf)        
        
        (guindaste_livre)        
        (guindaste_na_plataf ?gui - guindaste ?pla - plataf)
    )

    (:action guind_pega_cont
        :parameters (?co - container ?pla - plataf ?gui - guindaste)
        :precondition (and
            (guindaste_livre)
            (container-no-plataf ?co ?pla)
            (guindaste_na_plataf ?gui ?pla)
        )
        :effect (and
            (not (guindaste_livre))
            (container_no_guindaste ?co ?gui)
        )
    )

    (:action carregar_caminhao
        :parameters (?co -container ?numplataf -plataf ?cam - caminhao ?gui - guindaste)
        :precondition (and
            (caminhao-no-plataf ?cam ?numplataf) ;O caimnhao e o Guindaste deven estar os dois na mesma plataforma
            (guindaste_na_plataf ?gui ?numplataf) ; idem          
            (container_no_guindaste ?co ?gui)
            (not (guindaste_livre))
        )
        :effect (and
            (not (container-no-plataf ?co ?numplataf))
            (container-no-caminhao ?co ?cam)
            (guindaste_livre)
        )
    )
)