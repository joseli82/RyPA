(define (problem problem3) (:domain Actividad3)
(:objects 
    
    ambulancia - vehiculo
    enfermo1 - persona
    enfermo2 - persona
    L1 - localizacion
    L2 - localizacion
    L3 - localizacion
    L4 - localizacion

)

(:init
    ;todo: put the initial state's facts and numeric values here
    (enlace L1 L3)
    (enlace L3 L1)
    (enlace L3 L4)
    (enlace L4 L3)
    (enlace L4 L2)
    (enlace L2 L4)
    (ubicacionEnfermo enfermo1 L4)
    (ubicacionEnfermo enfermo2 L3)
    (ubicacionVehiculo ambulancia L2)
    (vehiculoVacio ambulancia enfermo1)
    (vehiculoVacio ambulancia enfermo2)
)

(:goal (and
    ;todo: put the goal condition here
    (ubicacionEnfermo enfermo1 L1)
    (ubicacionEnfermo enfermo2 L1)
    
    
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

