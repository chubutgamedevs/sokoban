extends Area2D

var tween = Tween.new()
var puedo_mover = true

func _ready():
	pass

func mover(dir:Vector2):
	
	if !puedo_mover:
		return
	
	if $rays.colisiona(dir):
		print(dir)
		return
	
	puedo_mover = false
	
	
	tween.interpolate_property(self, "position",
			position, position + (dir * 32), .3,
			Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	
	yield(tween,"tween_completed")
	
	puedo_mover = true
