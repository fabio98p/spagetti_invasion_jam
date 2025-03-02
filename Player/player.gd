extends CharacterBody3D

@onready var head: Node3D = $Head
@onready var camera_3d: Camera3D = $Head/Camera3D

const SPEED = 3.0
const SPRINT = 5.0
const JUMP_VELOCITY = 4.5
const SESITIVITY = 0.003

#head bob
const BOB_FREQ = 3
const BOB_AMP = 0.05
var t_bob = 0.0


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SESITIVITY)
		camera_3d.rotate_x(-event.relative.y * SESITIVITY)
		camera_3d.rotation.x = clamp(camera_3d.rotation.x, deg_to_rad(-60), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if Input.is_action_pressed("sprint"):
			velocity.x = direction.x * SPRINT
			velocity.z = direction.z * SPRINT
		else:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
	else:
		velocity.x = lerp(velocity.x, direction.x * SPEED, delta * 9)
		velocity.z = lerp(velocity.z, direction.x * SPEED, delta * 9)
		
	#head bobbing
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera_3d.transform.origin = head_bobbing(t_bob)

	move_and_slide()

func head_bobbing(time)-> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos
