extends CharacterBody3D

#Qué tan rápido se mueve el jugador en metros por segundo.
@export var speed = 14

#La aceleración hacia abajo cuando está en el aire, en metros por segundo al cuadrado.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	# Creamos una variable local para almacenar la dirección de entrada.
	var direction = Vector3.ZERO

	# Verificamos cada entrada de movimiento y actualizamos la dirección en consecuencia.
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		# Observe cómo estamos trabajando con los ejes x y z del vector.
		# En 3D, el plano XZ es el plano terrestre
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	# Setting the basis property will affect the rotation of the node.
		$Pivot.basis = Basis.looking_at(direction)
