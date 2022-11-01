extends Area2D


var tween = Tween.new()
var puedo_mover = true


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(tween)
	
	tween.playback_process_mode = Tween.TWEEN_PROCESS_PHYSICS


func _physics_process(delta):
	if Input.is_action_pressed("up"):
		mover(Vector2.UP)
	if Input.is_action_pressed("down"):
		mover(Vector2.DOWN)
	if Input.is_action_pressed("left"):
		mover(Vector2.LEFT)
	if Input.is_action_pressed("right"):
		mover(Vector2.RIGHT)

func mover(dir:Vector2):

	if !puedo_mover:
		return
	
	if $rays.colisiona(dir):
		var col=$rays.get_collider()
		if col.is_in_group("cajas"):
			print("caja")

			col = col.get_parent()
			col.mover(dir)
			
		return
		
	
	puedo_mover = false
	
	
	tween.interpolate_property(self, "position",
			position, position + (dir * 32), .3,
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	
	yield(tween,"tween_completed")
	
	puedo_mover = true

	
