extends KinematicBody2D

var pushing = false
onready var tween = get_parent().get_node("Tween")

func push(direction):
	if pushing:
		return
	if test_move(transform, direction * 64):
		return

	pushing = true
	tween.interpolate_property(
		self, "position", position, position + direction * 64, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	tween.start()

func _on_Tween_tween_all_completed():
	pushing = false
