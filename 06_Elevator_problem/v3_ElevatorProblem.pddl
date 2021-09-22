(define (problem situation1)
    (:domain v3_elevator)
    (:objects
        elevator1 - elevator
        floor1 - floor
        floor2 - floor
        floor3 - floor
    )
    (:init
        (at elevator1 floor1)
        (isConnected floor1 floor2)
        (isConnected floor2 floor3)
    )
    (:goal
        (at elevator1 floor3)
    )
)