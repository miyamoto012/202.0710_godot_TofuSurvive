extends CharacterBody2D

const MOVE_SPEED: float = 100.0
@onready var move_component = $MoveComponent
@onready var enemy_collision_area_2d = $EnemyCollisionArea2D
@onready var health_component = $HealthComponent
@onready var damage_interval_timer = $DamageIntervalTimer

#接触している敵の数
var number_colliding_bodies := 0

func _ready():
	enemy_collision_area_2d.body_entered.connect(on_body_entered)
	enemy_collision_area_2d.body_exited.connect(on_body_exited)
	damage_interval_timer.timeout.connect(on_damage_interval_timer_timeout)
	
	
func _process(delta):
	move_component.set_velocity(get_movement_direction())
	move_component.move(self)
	check_deal_damage()
	

func get_movement_direction()->Vector2:
	var x_movement_vector = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement_vector = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement_vector, y_movement_vector).normalized()
	
	
func move(move_velocity: Vector2)->void:
	velocity = move_velocity
	move_and_slide()


func check_deal_damage()->void:
	if number_colliding_bodies == 0 || !damage_interval_timer.is_stopped():
		return
	damage_interval_timer.start()
	health_component.damage(1)
	
	
func on_body_entered(enemy_body: Node2D)->void:
	number_colliding_bodies += 1
	check_deal_damage()
	
	
func on_body_exited(enemy_body: Node2D)->void:
	number_colliding_bodies += -1	


func on_damage_interval_timer_timeout():
	check_deal_damage()
