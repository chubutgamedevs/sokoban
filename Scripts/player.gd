extends KinematicBody2D

var motion = Vector2.ZERO
var speed = 200
var pushea = false

var estado = "idle"

func _process(delta):
	
	
	match estado:
		"idle" :
			if Input.is_action_pressed("up"):
				rotation_degrees = 0
				motion = Vector2.UP
				estado = "walk"
			if Input.is_action_pressed("down"):
				rotation_degrees = 180
				motion = Vector2.DOWN
				estado = "walk"
			if Input.is_action_pressed("left"):
				rotation_degrees = -90
				motion = Vector2.LEFT
				estado = "walk"
			if Input.is_action_pressed("right"):
				rotation_degrees = 90
				motion = Vector2.RIGHT
				estado = "walk"
		"walk" : 
			if Input.is_action_just_released("up") or Input.is_action_just_released("down") or Input.is_action_just_released("left") or Input.is_action_just_released("right"):
				estado = "idle"
				motion = Vector2.ZERO
		"push" :
			if Input.is_action_just_released("up") or Input.is_action_just_released("down") or Input.is_action_just_released("left") or Input.is_action_just_released("right"):
				estado = "idle"
				motion = Vector2.ZERO
#	motion = Vector2.ZERO
#	if Input.is_action_pressed("up"):
#		rotation_degrees = 0
#		motion = Vector2.UP
#		$AnimationPlayer.play("walk")
#	elif Input.is_action_pressed("down"):
#		rotation_degrees = 180
#		motion = Vector2.DOWN
#		$AnimationPlayer.play("walk")
#	elif Input.is_action_pressed("left"):
#		rotation_degrees = -90
#		motion = Vector2.LEFT
#		$AnimationPlayer.play("walk")
#	elif Input.is_action_pressed("right"):
#		rotation_degrees = 90
#		motion = Vector2.RIGHT
#		$AnimationPlayer.play("walk")
#	else:
#		$AnimationPlayer.play("idle")
	
	var collision = move_and_collide(motion * speed * delta)
	if collision:
		var node = collision.collider
		
		if node is KinematicBody2D:
			
			node.push(motion)
			estado = "push"
		else:
			estado = "idle"
	$AnimationPlayer.play(estado)
			
			
