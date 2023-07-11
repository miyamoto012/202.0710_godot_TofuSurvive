extends Node

@export var move_speed: int = 40

var velocity := Vector2.ZERO


func set_velocity_to_player(character_body: CharacterBody2D)->void:
	var player_node = get_tree().get_first_node_in_group("player") as CharacterBody2D
	if player_node == null:
		return
	var direction = (player_node.global_position - character_body.global_position).normalized() 	
	velocity = move_speed * direction


func set_velocity(direction: Vector2)->void:
	velocity = direction * move_speed
	

func move(character_body: CharacterBody2D)->void:
	character_body.velocity = velocity
	character_body.move_and_slide()
