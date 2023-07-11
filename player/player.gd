extends CharacterBody2D

const MOVE_SPEED: float = 100.0
@onready var move_component = $MoveComponent


func _process(delta):
	move_component.set_velocity(get_movement_direction())
	move_component.move(self)


func get_movement_direction()->Vector2:
	var x_movement_vector = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement_vector = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement_vector, y_movement_vector).normalized()
	
	
func move(move_velocity: Vector2)->void:
	velocity = move_velocity
	move_and_slide()
