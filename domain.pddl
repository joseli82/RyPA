(define (domain Actividad3)

;remove requirements that are not needed
(:requirements :strips :typing  :negative-preconditions :equality)

(:types ;Objetos
    vehiculo localizacion persona - object
)

(:predicates ;Propiedades de los objetos
    (enlace ?nodei - localizacion ?nodej - localizacion)
    (ubicacionVehiculo ?v1 - vehiculo ?nodek - localizacion)
    (ubicacionEnfermo ?p1 - persona ?nodem - localizacion)
    (vehiculoVacio ?v1 - vehiculo ?p1 - persona)
)

(:action Conducir
    ; constructor con los objetos que ejecutan la acción (método)
    :parameters (?v - vehiculo ?nodoOrigen - localizacion ?nodoDestino - localizacion)
    :precondition (and 
        
        (enlace ?nodoOrigen ?nodoDestino) ;Que los nodos esten conectados
        (ubicacionVehiculo ?v ?nodoOrigen) ; que el vehiculo esté en el nodo origen
        
    )
    :effect (and 
        (ubicacionVehiculo ?v ?nodoDestino) ; Que el vehículo está en el nodo destino
        (not(ubicacionVehiculo ?v ?nodoOrigen)) ; Que el vehículo ya no se encuentra en el nodo de origen.
    )
)

(:action Cargar
    ; constructor con los objetos que ejecutan la acción (método)
    :parameters (?v - vehiculo ?nodoCarga - localizacion ?carga - persona)
    :precondition (and 
        
        (ubicacionEnfermo ?carga ?nodoCarga) ; Que el enfermo esté en el nodo de carga
        (ubicacionVehiculo ?v ?nodoCarga) ; Que la ambulancia esté en el nodo de carga
        (vehiculoVacio ?v ?carga) ; Que la ambulancia esté vacía
       
    )
    :effect (and 
       (not(ubicacionEnfermo ?carga ?nodoCarga)) ; Que la persona ya no está en el nodo de carga
       (not(vehiculoVacio ?v ?carga)) ; que la ambulancia ya no está vacía
    )
)

(:action Descargar
    ; constructor con los objetos que ejecutan la acción (método)
    :parameters (?v - vehiculo ?nodoDescarga - localizacion ?descarga - persona)
    :precondition (and 
        
        (not(vehiculoVacio ?v ?descarga)) ; Que la ambulancia no esté vacía
        (ubicacionVehiculo ?v ?nodoDescarga) ; Que la ambulancia esté en el nodo de descarga
       
    )
    :effect (and 
       (ubicacionEnfermo ?descarga ?nodoDescarga) ; El enfermo está en el hospital
       (vehiculoVacio ?v ?descarga) ; la ambulancia está vacía
       (ubicacionVehiculo ?v ?nodoDescarga) ; la ambulancia está en el hospital
    )
)


;define actions here

)