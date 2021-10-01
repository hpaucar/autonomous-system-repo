; Container problem
; http://courses.csail.mit.edu/6.034s/handouts/spring12/Planning.pdf
(define (domain dock_worker_Robot)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    Location  ;there are several connected Locations
    Pile      ;is attached to a Location,
              ;it holds a pallet and a stack of Containers
    Robot     ;holds at most 1 Container,
              ;only 1 Robot per Location
    Crane     ;belongs to a Location to pickup Containers
    Container
  )

  (:predicates
    (adjacent ?l1 ?l2 - Location)       ;Location ?l1 is adjacent to ?l2
    (attached ?p - Pile ?l - Location)  ;Pile ?p attached to Location ?l
    (belong ?k - Crane ?l - Location)   ;Crane ?k belongs to Location ?l
    (at ?r - Robot ?l - Location)       ;Robot ?r is at Location ?l
    (occupied ?l - Location)            ;there is a Robot at Location ?l
    (loaded ?r - Robot ?c - Container)  ;Robot ?r is loaded with Container ?c
    (unloaded ?r - Robot)               ;Robot ?r is empty
    (holding ?k - Crane ?c - Container) ;Crane ?k is holding a Container ?c
    (empty ?k - Crane)                  ;Crane ?k is empty
    (in ?c - Container ?p - Pile)       ;Container ?c is within Pile ?p
    (top ?c - Container ?p - Pile)      ;Container ?c on top of Pile ?p
    (on ?c1 ?c2 - Container)            ;Container ?c1 is on Container ?c2
  )
  
  (:action move
    :parameters (?r - Robot ?from ?to - Location)
    :precondition (and
        (adjacent ?from ?to) 
        (at ?r ?from)
        (not (occupied ?to)))
    :effect (and
        (at ?r ?to) 
        (occupied ?to)
        (not (occupied ?from)) 
        (not (at ?r ?from)))
  )

(:action load
    :parameters (?k - Crane ?l - Location ?c - Container ?r - Robot)
    :precondition (and 
      (belong ?k ?l)
      (holding ?k ?c)
      (at ?r ?l)
      (unloaded ?r)
    )
    :effect (and 
      (empty ?k)
      (not (holding ?k ?c))
      (loaded ?r ?c)
      (not (unloaded ?r))
    )
)

(:action unload
  :parameters (?k - Crane ?l - Location ?c - Container ?r - Robot)
  :precondition (and
      (belong ?k ?l) 
      (at ?r ?l) 
      (loaded ?r ?c) 
      (empty ?k) 
  )
  :effect (and
      (empty ?k)
      (holding ?k ?c)
      (unloaded ?r)
      (loaded ?r ?c)    
  )
)

(:action put 
  :parameters (?k - Crane ?l - Location ?c - Container ?d - Container ?p - Pile) 
  :precondition (and
      (belong ?k ?l)
      (attached ?p ?l)
      (holding ?k ?c)
      (top ?d ?p)
    )
  :effect (and
      (not (holding ?k ?c))
      (empty ?k)
      (in ?c ?p)
      (top ?c ?p)
      (on ?c ?d)
      (not (top ?d ?p))    
  )
)

(:action take
    :parameters (?k - Crane ?l - Location ?c - Container ?d - Container ?p - Pile)
    :precondition (and
      (belong ?k ?l)
      (attached ?p ?l)
      (empty ?k)
      (top ?c ?p)
      (on ?c ?d)
    )
    :effect (and
      (holding ?k ?c)
      (not (empty ?k))
      (not (in ?c ?p))
      (not (top ?c ?p))
      (not (on ?c ?d))
      (top ?d ?p)
  )
)
)