extends CollisionObject3D
class_name interactible

@export var int_name = "nome"
signal interact
#func interact(body):
	#print(body.name, "interacts", name)

#
#func _on_interact() -> void:
	#print("segnale")
