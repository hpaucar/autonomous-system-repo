(define (problem mixed-f2-p1-u0-v0-g0-a0-n0-A0-B0-N0-F0-r0)
    (:domain v4_Domain)
    (:objects
        p0 p1 p2 - passenger
        f0 f1 f2 f3 f4 f5 f6 f7 - floor
        e0 e1 - elevator
    )

    (:init
        (above f0 f1)
        (above f0 f2)
        (above f0 f3)
        (above f0 f4)
        (above f0 f5)
        (above f0 f6)
        (above f0 f7)
        (above f1 f2)
        (above f1 f3)
        (above f1 f4)
        (above f1 f5)
        (above f1 f6)
        (above f1 f7)
        (above f2 f3)
        (above f2 f4)
        (above f2 f5)
        (above f2 f6)
        (above f2 f7)
        (above f3 f4)
        (above f3 f5)
        (above f3 f6)
        (above f3 f7)
        (above f4 f5)
        (above f4 f6)
        (above f4 f7)
        (above f5 f6)
        (above f5 f7)
        (above f6 f7)

        (origin p0 f4 e1)
        (destin p0 f5 e1)

        (origin p1 f3 e0)
        (destin p1 f0 e0)

        (origin p2 f3 e1)
        (destin p2 f6 e1)

        (lift_at f0 e0)
    )

    (:goal
        (forall
            (?p - passenger ?e - elevator)
            (served ?p))
    )

)