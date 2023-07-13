extends Node
class_name  HealthComponent


@export var max_health: float = 10.0
var current_health: float


func _ready():
	current_health = max_health
	
	
func damage(damage_amount: float):
	current_health = max(current_health - damage_amount, 0.0)
	print(current_health)
