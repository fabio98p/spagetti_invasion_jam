extends interactible

@onready var animation_player: AnimationPlayer = $Sketchfab_Scene/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interact() -> void:
	print("ciao")
	var animation = animation_player.get_animation("mixamo_com")
	if animation:
		animation_player.play("mixamo_com")
