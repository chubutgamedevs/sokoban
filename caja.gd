extends KinematicBody2D

var celda = 32
var pushing = false
onready var tween = Tween.new()

func _ready():
	add_child(tween)

func _process(delta):
	
	pass
	
func push(direction):
	if pushing:
		return
	
	if test_move(transform, direction * celda):
		return

	pushing = true
	tween.interpolate_property(
		self, "position", position, position + direction * celda, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	tween.start()
	yield(tween, "tween_completed")
	pushing = false

func _on_Tween_tween_all_completed():
	pushing = false
