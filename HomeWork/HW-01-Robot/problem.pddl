(define (problem robot_test)

(:domain dock_worker_robot)

(:objects
    ; the only thing is the `world`
    loc1 loc2 - Location
    robot - Robot
    crane - Crane
    pile - Pile
    cont pallet - Container
)

(:init
    ;
    (attached pile loc1)
    (in cont pile)
    (top cont pile)
    (on cont pallet)
    (belong crane loc1)
    (empty crane)
    (adjacent loc1 loc2)
    (adjacent loc2 loc1)
    (at robot loc2)
    (occupied loc2)
    (unloaded robot)
)

(:goal
    (and
        ; 
        (not (unloaded robot))
        (at robot loc2)
    )
)
)