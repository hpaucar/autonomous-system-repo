(define (domain sorting_by_reversal) 
    (:requirements :strips :equality)

    (:predicates 
    (next ?x ?y) ; ?y is after ?x in clockwise order 
    (idle)   ; no ongoing reversal operation
    (is_first ?x) ; the "first" element of the current reversal 
    (is_last ?x)) ; the "last" element of the current reversal
    
    ;; Begin a new reversal of the segment between ?first and ?last: 
    (:action begin_reversal 
     :parameters (?first ?last) 
     :precondition (idle) 
     :effect (and   (not (idle)) 
                    (is_first ?first) 
                    (is_last ?last))
    )

    ;; Move one element, and update is_first: 
    (:action move_element 
        :parameters (?before_first ?first ?after_first ?last ?after_last) 
        :precondition (and  (is_first ?first) 
                            (is_last ?last) 
                            (not (= ?first ?last)) 
                            (next ?before_first ?first) 
                            (next ?first ?after_first) 
                            (next ?last ?after_last))
        :effect (and    (not    (next ?before_first ?first)) 
                        (not    (next ?first ?after_first)) 
                        (next ?before_first ?after_first) 
                        (not    (next ?last ?after_last)) 
                        (next ?last ?first) 
                        (next ?first ?after_last)
                        (not (is_first ?first)) ; update is_first 
                        (is_first ?after_first))
    )
    ;; End the reversal when "first" and "last" are the same:
    (:action end_reversal 
        :parameters (?element) 
        :precondition (and  (is_first ?element) 
                            (is_last ?element))
        :effect (and (not (is_first ?element)) 
                    (not (is_last ?element)) 
                    (idle))
    ) 
)