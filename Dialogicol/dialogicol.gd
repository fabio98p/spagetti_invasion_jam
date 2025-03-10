extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(on_dialogicol_signal)
	Dialogic.start("timeline_test")
	#Dialogic.VAR.response = "bella ciccio"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_dialogicol_signal(value):
	print(value)
