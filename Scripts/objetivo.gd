extends Node2D
var ocupado = false

func _ready():
	$Area2D.connect("body_entered",self,"body_entered")
	$Area2D.connect("body_exited",self,"body_exited")

func body_entered(body):
	if body.is_in_group("cajas"):
		ocupado = true
		$sfx.play()
		
		var objs = get_tree().get_nodes_in_group("objetivos")
		for obj in objs:
			if !obj.ocupado:
				return
		print ("ganaste")

func body_exited(body):
	if body.is_in_group("cajas"):
		ocupado = false
