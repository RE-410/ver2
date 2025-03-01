extends CharacterBody3D
class_name Player
## This script should be applied to the "Player" instance in every overworld scene.
## This allows the player to control the character's movement.

const SPEED := 5.0
const TURN_SPEED := 8.0
@onready var Model = $PlayerModel

func _physics_process(delta: float) -> void:
	var direction
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# While not in a cutscene, get the input direction and handle the movement/deceleration.
	if not Globals.in_cutscene:
		var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
		direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction: #If there is an input, accelerate in that direction.
		Model.rotation.y = lerp_angle(Model.rotation.y, atan2(-velocity.x, -velocity.z), delta * TURN_SPEED) # Smoothly turns the model.
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else: # else, decelerate.
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
