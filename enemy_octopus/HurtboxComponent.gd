extends Area2D

@export var health_component: HealthComponent


func _ready():
	area_entered.connect(on_area_entered)
	
	
func on_area_entered(player_ability_area: Area2D):
	if not player_ability_area is HitboxComponent:
		return

	if health_component == null:
		return

	health_component.damage(player_ability_area.damage)
	print(player_ability_area.damage)
