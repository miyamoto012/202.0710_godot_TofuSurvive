extends CharacterBody2D

@onready var move_component = $MoveComponent


func _process(delta):
	move_component.set_velocity_to_player(self)
	move_component.move(self)
