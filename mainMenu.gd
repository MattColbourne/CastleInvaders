extends Node2D

var level = preload("res://level1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		get_tree().change_scene_to_packed(level)
		Global.time = 0


