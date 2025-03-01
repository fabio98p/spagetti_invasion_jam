extends RayCast3D
@onready var label: Label = $Label
func _ready() -> void:
	label.text= ""
func _process(delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		if collider is interactible:
			label.text = "ciao" + collider.int_name
	else:
		label.text = ""
