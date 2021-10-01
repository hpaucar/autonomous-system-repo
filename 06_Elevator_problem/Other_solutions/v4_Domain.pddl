(define (domain v4_Domain)
    (:requirements :strips :adl :typing)
    (:types
        passenger - object
        floor - object
        elevator - object
    )

    (:predicates
        (origin ?person - passenger ?floor - floor ?elevator - elevator)
        ;; entry of ?person is ?floor is ?elevator
        ;; inertia

        (destin ?person - passenger ?floor - floor ?elevator - elevator)
        ;; exit of ?person is ?floor is ?elevator
        ;; inertia

        (above ?floor1 - floor ?floor2 - floor)
        ;; ?floor2 is located above of ?floor1

        (boarded ?person - passenger)
        ;; true if ?person has boarded the lift

        (served ?person - passenger)
        ;; true if ?person has alighted as her destination

        (lift_at ?floor - floor ?e - elevator)
        ;; current position of the lift is at ?floor at ?elevator
    )

    ;;stop

    (:action stop
        :parameters (?f - floor ?e - elevator)
        :precondition (lift_at ?f ?e)
        :effect (and
            (forall
                (?p - passenger)
                (when
                    (and (boarded ?p) (destin ?p ?f ?e))
                    (and (not (boarded ?p)) (served ?p)))
            )
            (forall
                (?p - passenger)
                (when
                    (and (origin ?p ?f ?e) (not (served ?p)))
                    (boarded ?p)))
            
            )
    )

    ;;drive up

    (:action up
        :parameters (?f1 - floor ?f2 - floor ?e1 - elevator)
        :precondition (and (lift_at ?f1 ?e1) (above ?f1 ?f2))
        :effect (and (lift_at ?f2 ?e1) (not (lift_at ?f1 ?e1)))
    )

    ;;drive down

    (:action down
        :parameters (?f1 - floor ?f2 - floor ?e1 - elevator)
        :precondition (and (lift_at ?f1 ?e1) (above ?f2 ?f1))
        :effect (and (lift_at ?f2 ?e1) (not (lift_at ?f1 ?e1)))
    )
)