(define (problem flights)
    (:domain airline_p01)
    (:objects
        A B C D - city
        g1 g2 g3 g4 g5 - group
        p1 - plane
    )
    (:init
        ; Cities
        (= (city_distance A B) 1)(= (city_distance B A) 1)
        (= (city_distance A C) 1)(= (city_distance C A) 1)
        (= (city_distance A D) 1)(= (city_distance D A) 1)        
        (= (city_distance B C) 1)(= (city_distance C B) 1)
        (= (city_distance B D) 1)(= (city_distance D B) 1)        
        (= (city_distance D C) 1)(= (city_distance C D) 1)
        
        ; People groups
        (= (group_number g1) 1)
        (group_at g1 A) (group_want g1 B)

        (= (group_number g2) 1)
        (group_at g2 B) (group_want g2 C)

;;        (= (group_number g3) 1)
;;        (group_at g3 B) (group_want g3 C)

;;        (= (group_number g4) 1)
;;        (group_at g4 C) (group_want g4 A)

;;        (= (group_number g5) 1)
;;        (group_at g5 C) (group_want g5 B)

        ; Planes
        (plane_at p1 B)
        (= (plane_seats p1) 1000)

        ; Starting Conditions
        (= (group_time g1) 0)
        (= (group_time g2) 0)
        (= (group_time g3) 0)
        (= (group_time g4) 0)
        (= (group_time g5) 0)

        (= (plane_onboard p1) 0)
        (= (plane_time p1) 0)

        (= (tot_people) 5)
        (= (deadline) 100000)
        (= (happy_people) 0)
        (= (tot_flights) 0)
        (= (obj) 1)
        (= (one) 1)
    )

    (:goal
        (= (happy_people) (tot_people))
    )
    (:metric minimize
        (tot_flights)
    )
)