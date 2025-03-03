extends Node3D

var playback : AnimationNodeStateMachinePlayback
var is_open := false

func _ready() -> void:
	playback = $AnimationTree.get("parameters/playback")

func toggle():
	is_open = not is_open
	print("ciao")
	if is_open:
		playback.travel("open_door")
	else:
		playback.travel("RESET")


func _on_button_interact() -> void:
	print("ciao")
