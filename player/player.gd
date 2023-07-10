extends CharacterBody2D

const SPEED: float = 500.0


func _process(delta):
	var move_direction = get_movement_direction()
	var move_velocity = move_direction * SPEED
	move(move_velocity)


func get_movement_direction() -> Vector2:
	var x_movement_vector = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement_vector = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement_vector, y_movement_vector).normalized()
	
	
func move(move_velocity: Vector2)->void:
	velocity = move_velocity
	move_and_slide()
