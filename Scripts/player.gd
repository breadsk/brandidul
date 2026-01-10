extends CharacterBody2D

var velocidad = 100
var salto = 200
var gravedad = 400

#bucle que se repite cada delta tiempo
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("derecha"):
		velocity.x = velocidad
		
	elif Input.is_action_pressed("izquierda"):
		velocity.x = -velocidad
	else:
		velocity.x = 0
	
	move_and_slide()	
