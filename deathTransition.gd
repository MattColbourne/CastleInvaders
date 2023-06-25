extends Node2D

var isCaught = false
var caughtUI = preload("res://playerCaughtUI.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isCaught == true and Input.is_action_just_pressed("enter"):
		if get_parent().get_parent().get_node_or_null("playerCaughtUI") != null:
			get_parent().get_parent().get_node("playerCaughtUI").queue_free()
		get_tree().paused = false
		Global.caughtLevel = Global.level
		var startLevel = load("res://level1.tscn")
		get_tree().change_scene_to_packed(startLevel)

func caught() -> void:
	$caughtSound.play()
	isCaught = true
	get_parent().get_parent().add_child(caughtUI.instantiate())
