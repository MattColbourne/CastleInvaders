extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/winLabel.text = "Congratulations! You successfully invaded the castle and got the diamond in "+str(snapped(Global.time/60,0.01))+" minutes!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter"):
		var mainMenu = load("res://mainMenu.tscn")
		get_tree().change_scene_to_packed(mainMenu)
