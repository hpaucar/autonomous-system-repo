;Header and description

(define (domain VRP)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
    )

    (:durative-action load
        :parameters (?f - freight ?v - vehicle ?l - location)
        :duration(= ?duration (loadTime ?f))
        :condition (and
            (over all(using ?v))
            (at start(at ?f ?l))
            (at start(at2 ?v ?l))
            (at start(>= (maxLoad) (+ (load ?v)(weight ?f)))))
        :effect (and
            (at end(in ?f ?v))
            (at start(not (at ?f ?l)))
            (at end(increase (load ?v) (weight ?f))))
    )


;define actions here

(:action load
    :parameters (?f - freight ?v - vehicle ?l - location)
    :precondition (and
        (using ?v)
        (at ?f ?l)
        (at2 ?v ?l)
        (>= (maxLoad) (+(load ?v) (weight ?f))))
    :effect (and
        (in ?f ?v)
        (not (at ?f ?l))
        (increase (cargo ?v) (weight ?f)))
)
)