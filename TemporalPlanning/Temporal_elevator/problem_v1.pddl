
(define (problem elevators_problem_v1)
    (:domain temporal_elevators_v1)

    (:objects
        n1 n2 n3 n4 n5 - num
        p1 - passenger
        e1 - elevator
    )

    (:init ;; Same fluents as the classical planning example 
        (next n1 n2) (next n2 n3) (next n3 n4) (next n4 n5)
        
        (lift-at e1 n1)
        

        (passenger-at p1 n1)
        ;; Define how fast each of the passengers move (in seconds)
        (= (person_speed p1) 2)
        ;; Define the speed of the elevators (in meters / second)
        (= (elevator_speed e1) 2)
        ;; Define the distance between the floors (in meters)
        (= (floor_distance n1 n2) 3)
        (= (floor_distance n2 n3) 4)
        (= (floor_distance n3 n4) 4)
        (= (floor_distance n4 n5) 3)
        (= (floor_distance n5 n4) 3)
        (= (floor_distance n4 n3) 4)
        (= (floor_distance n3 n2) 4)
        (= (floor_distance n2 n1) 3))

    (:goal
        (and 
            (passenger-at p1 n5)))
        
    (:metric minimize
        (total-time))    
)

;;;; Solution Found
; States evaluated: 17
; Cost: 11.003
; Time 0.00
;; 0.000: (board p1 n1 e1)  [2.000]
;; 2.000: (move-up e1 n1 n2)  [1.500]
;; 3.501: (move-up e1 n2 n3)  [2.000]
;; 5.502: (move-up e1 n3 n4)  [2.000]
;; 7.503: (move-up e1 n4 n5)  [1.500]
;; 9.003: (leave p1 n5 e1)  [2.000]
    