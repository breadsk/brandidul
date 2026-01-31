extends CharacterBody2D

var velocidad = 100
var salto = 200
var gravedad = 400

#bucle que se repite cada delta tiempo
func _physics_process(delta: float) -> void:
	
	velocity.y += gravedad*delta
	
	if Input.is_action_pressed("derecha"):
		velocity.x = velocidad
		
	elif Input.is_action_pressed("izquierda"):
		velocity.x = -velocidad
	else:
		velocity.x = 0
	
	#Verdadero o falso
	if is_on_floor():#Si estoy en el piso
		if Input.is_action_just_pressed("saltar"):#Y presiono saltar
			velocity.y = -salto
	
	move_and_slide()
	
	animaciones()
	
func animaciones():
	if velocity.x > 0:
		print("Va a la derecha")
		$Sprite2D.flip_h = false
		$AnimationPlayer.play("RUN")
	elif  velocity.x < 0:
		$Sprite2D.flip_h = true
		$AnimationPlayer.play("RUN")	
	else:
		$AnimationPlayer.play("IDLE")

	if velocity.y < 0:
		$AnimationPlayer.play("JUMP")
	elif velocity.y > 0:
		$AnimationPlayer.play("FALL")
