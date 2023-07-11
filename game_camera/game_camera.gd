extends Camera2D

func _ready():
	make_current()
	
	
func _process(delta):
	move_to_player()
	
	
func move_to_player():
	var player_node = get_tree().get_first_node_in_group("player") as CharacterBody2D
	if player_node == null:
		return
	offset = player_node.global_position
