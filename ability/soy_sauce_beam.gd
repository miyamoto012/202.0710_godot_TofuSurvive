extends Node2D


func _ready():
	var tween := create_tween()
	tween.tween_property(self, "scale", Vector2(5.0, 1.0), 0.5)
	tween.tween_property(self, "scale:x", 2, 0.5)
	tween.play()
