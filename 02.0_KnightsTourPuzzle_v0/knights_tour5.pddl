(define (problem knights5x5)
  (:domain knights-tour)
  (:objects 
     a1  b1  c1  d1  e1  
     a2  b2  c2  d2  e2  
     a3  b3  c3  d3  e3  
     a4  b4  c4  d4  e4  
     a5  b5  c5  d5  e5  
  )
  (:init 
    (NEIGHBOUR a1 c2)
    (NEIGHBOUR a1 b3)
    (NEIGHBOUR b1 a3)
    (NEIGHBOUR b1 d2)
    (NEIGHBOUR b1 c3)
    (NEIGHBOUR c1 a2)
    (NEIGHBOUR c1 b3)
    (NEIGHBOUR c1 e2)
    (NEIGHBOUR c1 d3)
    (NEIGHBOUR d1 b2)
    (NEIGHBOUR d1 c3)
    (NEIGHBOUR d1 e3)
    (NEIGHBOUR e1 c2)
    (NEIGHBOUR e1 d3)
    (NEIGHBOUR a2 c1)
    (NEIGHBOUR a2 c3)
    (NEIGHBOUR a2 b4)
    (NEIGHBOUR b2 a4)
    (NEIGHBOUR b2 d1)
    (NEIGHBOUR b2 d3)
    (NEIGHBOUR b2 c4)
    (NEIGHBOUR c2 a1)
    (NEIGHBOUR c2 a3)
    (NEIGHBOUR c2 b4)
    (NEIGHBOUR c2 e1)
    (NEIGHBOUR c2 e3)
    (NEIGHBOUR c2 d4)
    (NEIGHBOUR d2 b1)
    (NEIGHBOUR d2 b3)
    (NEIGHBOUR d2 c4)
    (NEIGHBOUR d2 e4)
    (NEIGHBOUR e2 c1)
    (NEIGHBOUR e2 c3)
    (NEIGHBOUR e2 d4)
    (NEIGHBOUR a3 c2)
    (NEIGHBOUR a3 c4)
    (NEIGHBOUR a3 b5)
    (NEIGHBOUR a3 b1)
    (NEIGHBOUR b3 a5)
    (NEIGHBOUR b3 a1)
    (NEIGHBOUR b3 d2)
    (NEIGHBOUR b3 d4)
    (NEIGHBOUR b3 c5)
    (NEIGHBOUR b3 c1)
    (NEIGHBOUR c3 a2)
    (NEIGHBOUR c3 a4)
    (NEIGHBOUR c3 b5)
    (NEIGHBOUR c3 b1)
    (NEIGHBOUR c3 e2)
    (NEIGHBOUR c3 e4)
    (NEIGHBOUR c3 d5)
    (NEIGHBOUR c3 d1)
    (NEIGHBOUR d3 b2)
    (NEIGHBOUR d3 b4)
    (NEIGHBOUR d3 c5)
    (NEIGHBOUR d3 c1)
    (NEIGHBOUR d3 e5)
    (NEIGHBOUR d3 e1)
    (NEIGHBOUR e3 c2)
    (NEIGHBOUR e3 c4)
    (NEIGHBOUR e3 d5)
    (NEIGHBOUR e3 d1)
    (NEIGHBOUR a4 c3)
    (NEIGHBOUR a4 c5)
    (NEIGHBOUR a4 b2)
    (NEIGHBOUR b4 a2)
    (NEIGHBOUR b4 d3)
    (NEIGHBOUR b4 d5)
    (NEIGHBOUR b4 c2)
    (NEIGHBOUR c4 a3)
    (NEIGHBOUR c4 a5)
    (NEIGHBOUR c4 b2)
    (NEIGHBOUR c4 e3)
    (NEIGHBOUR c4 e5)
    (NEIGHBOUR c4 d2)
    (NEIGHBOUR d4 b3)
    (NEIGHBOUR d4 b5)
    (NEIGHBOUR d4 c2)
    (NEIGHBOUR d4 e2)
    (NEIGHBOUR e4 c3)
    (NEIGHBOUR e4 c5)
    (NEIGHBOUR e4 d2)
    (NEIGHBOUR a5 c4)
    (NEIGHBOUR a5 b3)
    (NEIGHBOUR b5 a3)
    (NEIGHBOUR b5 d4)
    (NEIGHBOUR b5 c3)
    (NEIGHBOUR c5 a4)
    (NEIGHBOUR c5 b3)
    (NEIGHBOUR c5 e4)
    (NEIGHBOUR c5 d3)
    (NEIGHBOUR d5 b4)
    (NEIGHBOUR d5 c3)
    (NEIGHBOUR d5 e3)
    (NEIGHBOUR e5 c4)
    (NEIGHBOUR e5 d3)
    (knight-at a1)
    (visited a1)
  )
  (:goal 
    (and
      (visited a1)
      (visited b1)
      (visited c1)
      (visited d1)
      (visited e1)
      (visited a2)
      (visited b2)
      (visited c2)
      (visited d2)
      (visited e2)
      (visited a3)
      (visited b3)
      (visited c3)
      (visited d3)
      (visited e3)
      (visited a4)
      (visited b4)
      (visited c4)
      (visited d4)
      (visited e4)
      (visited a5)
      (visited b5)
      (visited c5)
      (visited d5)
      (visited e5)
    )
  )
)