
(define (problem VRPP)
    (:domain VRP)
    (:objects
        f1 - freight
        f2 - freight
        v1 - vehicle 
        v2 - vehicle 
        l1 - location
        l2 - location
        l3 - location
    )
    (:init
        (adjacent l1 l2)
        (adjacent l2 l1)
        (adjacent l1 l3)
        (adjacent l3 l1)
        (= (distance l1 l2) 22)
        (= (distance l2 l1) 22)
        (= (distance l1 l3) 25)
        (= (distance l3 l1) 25)
        (= (weight f1) 8)
        (= (weight f2) 9)
        (= (load v1) 0)
        (= (load v2)0)
        (at 0
            (available f1))
        (at 100
            (not (available f1)))
        (at 0
            (available f2))
        (at 100
            (not (available f2)))
        (= (maxLoad) 10)
        (= (totalCost) 0)
        (at f1 l2)
        (at f2 l3)
        (at2 v1 l1)
        (at2 v2 l1)
        (destination f1 l1)
        (destination f2 l1)
    )
    (:goal
        (and (at f1 l1) (at f2 l1) (at2 v1 l1) (at2 v2 l1))
    )
    (:metric minimize
        (totalCost)
    )
)