; Exercício 1: Guindaste robótico
; Primierio vamos definir quais vão ser nossos objetos
; Do texto temos: guidance, container, caminhao, plataforma (ponto A)
; Header and description

(define (domain domain_guindaste_v3)

    (:requirements :typing :negative-preconditions :conditional-effects)

    (:types
        caminhao container plataf guindaste
    )

    (:predicates
        (container-no-plataf ?co - container ?pla - plataf)
        (container-no-caminhao ?co - container ?cam - caminhao)
        (container_no_guindaste ?co - container ?gui - guindaste)
        (caminhao-no-plataf ?cam - caminhao ?pla - plataf)
        (proximo ?p1 ?p2 - plataf)
        (guindaste_livre)
        (guindaste_na_plataf ?gui - guindaste ?pla - plataf)
    )

    (:action partir_caminhao
        :parameters (?cam - caminhao ?atual ?prox - plataf)
        :precondition (and(caminhao-no-plataf ?cam ?atual) (proximo ?atual ?prox))
        :effect (and(not(caminhao-no-plataf ?cam ?atual))(caminhao-no-plataf ?cam ?prox))
    )

    (:action voltar_caminhao
        :parameters (?cam - caminhao ?atual ?prox - plataf)
        :precondition (and (caminhao-no-plataf ?cam ?atual)(proximo ?prox ?atual))
        :effect (and (not (caminhao-no-plataf ?cam ?atual)) (caminhao-no-plataf ?cam ?prox))
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

;    (:action carregar_caminhao
;        :parameters (?co -container ?numplataf -plataf ?cam - caminhao ?gui - guindaste)
;        :precondition (and
;            (caminhao-no-plataf ?cam ?numplataf) ;O caimnhao e o Guindaste deven estar os dois na mesma plataforma
;            (guindaste_na_plataf ?gui ?numplataf) ; idem          
;            (container_no_guindaste ?co ?gui)
;            (not (guindaste_livre))
;        )
;        :effect (and
;            (not (container-no-plataf ?co ?numplataf))
;            (container-no-caminhao ?co ?cam)
;            (guindaste_livre)
;        )
;    )

    (:action carregar_caminhao_x2
        :parameters (?numplataf - plataf ?cam - caminhao ?gui - guindaste)
        :precondition (and
            (caminhao-no-plataf ?cam ?numplataf) ;O caimnhao e o Guindaste deven estar os dois na mesma plataforma
            (guindaste_na_plataf ?gui ?numplataf) ; idem             
            (not (guindaste_livre))
        )
        :effect (and (forall 
            (?co - container)
            (when 
                (and (container_no_guindaste ?co ?gui))
                (and 
                    (not (container-no-plataf ?co ?numplataf))
                    (container-no-caminhao ?co ?cam)
                    (guindaste_livre))))))

    (:action descarregar_caminhao
        :parameters (?co - container ?numplataf -plataf ?cam - caminhao)
        :precondition (and 
            (caminhao-no-plataf ?cam ?numplataf)
            (container-no-caminhao ?co ?cam))
        :effect (and 
            (container-no-plataf ?co ?numplataf) 
            (not (container-no-caminhao ?co ?cam)))
    )
)