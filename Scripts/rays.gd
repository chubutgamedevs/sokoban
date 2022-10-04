extends Node2D

var cuerpo

func _ready():
	pass

func colisiona(dir : Vector2):
	var str_dir = ""
	match dir:
		Vector2.UP:
			str_dir = "arriba"
		Vector2.DOWN:
			str_dir = "abajo"
		Vector2.LEFT:
			str_dir = "izquierda"
		Vector2.RIGHT:
			str_dir = "derecha"
		
	if get_node(str_dir).is_colliding():
		cuerpo =  get_node(str_dir).get_collider()
		return true
		
	return false

func get_collider():
	return cuerpo;
