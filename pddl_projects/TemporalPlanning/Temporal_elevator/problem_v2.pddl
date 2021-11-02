
(define (problem elevators_problem_v2)
    (:domain temporal_elevators_v1)

    (:objects
        n1 n2 n3 n4 n5 - num
        p1 p2 p3 - passenger
        e1 e2 - elevator
    )

    (:init ;; Same fluents as the classical planning example 
        (next n1 n2) (next n2 n3) (next n3 n4) (next n4 n5)
        
        (lift-at e1 n1)
        (lift-at e2 n5)

        (passenger-at p1 n2)
        (passenger-at p2 n2)
        (passenger-at p3 n4)
        ;; Define how fast each of the passengers move (in seconds)
        (= (person_speed p1) 2)
        (= (person_speed p2) 3)
        (= (person_speed p3) 2)
        ;; Define the speed of the elevators (in meters / second)
        (= (elevator_speed e1) 2)
        (= (elevator_speed e2) 3)
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
            (passenger-at p1 n1) 
            (passenger-at p2 n1) 
            (passenger-at p3 n1)))

    (:metric minimize
        (total-time))
)

;;;; Solution Found
; States evaluated: 5112
; Cost: 9.001
; Time 4.82
;; Elevator_2, p3. Max 8.668
;; 0.000: (move-down e2 n5 n4)  [1.000]
;; 1.000: (board p3 n4 e2)  [2.000]
;; 3.000: (move-down e2 n4 n3)  [1.333]
;; 4.334: (move-down e2 n3 n2)  [1.333]
;; 5.668: (move-down e2 n2 n1)  [1.000]
;; 6.668: (leave p3 n1 e2)  [2.000]

;; Elevator_1, p1, p2. Max 9.001 <================= Max Time
;; 0.000: (move-up e1 n1 n2)  [1.500]
;; 1.500: (board p1 n2 e1)  [2.000] <==Same Time
;; 1.501: (board p2 n2 e1)  [3.000] <==Same Time
;; 4.501: (move-down e1 n2 n1)  [1.500]
;; 6.001: (leave p2 n1 e1)  [3.000] <==Same Time
;; 6.001: (leave p1 n1 e1)  [2.000] <==Same Time