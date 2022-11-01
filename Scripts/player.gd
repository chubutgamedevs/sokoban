extends KinematicBody2D

var motion = Vector2.ZERO
var direccion = "down"
export var speed = 200
var pushea = false

var estado = "idle"

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	match estado:
		"idle" :
			
			if Input.is_action_pressed("up"):
#				rotation_degrees = 0
				motion = Vector2.UP
				estado = "walk"
				direccion = "up"
			if Input.is_action_pressed("down"):
#				rotation_degrees = 180
				motion = Vector2.DOWN
				estado = "walk"
				direccion = "down"
			if Input.is_action_pressed("left"):
#				rotation_degrees = -90
				motion = Vector2.LEFT
				estado = "walk"
				direccion = "left"
			if Input.is_action_pressed("right"):
#				rotation_degrees = 90
				motion = Vector2.RIGHT
				estado = "walk"
				direccion = "right"
		"walk" : 
			if Input.is_action_just_released("up") or Input.is_action_just_released("down") or Input.is_action_just_released("left") or Input.is_action_just_released("right"):
				estado = "idle"
				motion = Vector2.ZERO
				position.x = round(position.x/16)*16
				position.y = round(position.y/16)*16
		"push" :
			if Input.is_action_just_released("up") or Input.is_action_just_released("down") or Input.is_action_just_released("left") or Input.is_action_just_released("right"):
				estado = "idle"
				motion = Vector2.ZERO
				position.x = round(position.x/16)*16
				position.y = round(position.y/16)*16

	
	var collision = move_and_collide(motion * speed * delta)
	if collision:
		var node = collision.collider
		
		if node is KinematicBody2D:
			
			node.push(motion)
#			estado = "push"
		else:
			estado = "idle"
	$AnimationPlayer.play(estado)
	$animspr.play(estado+"_"+direccion)
			
			


