extends Node2D


#not yet implemented

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if Global.checkLevel(1) == true:
		var newGuard = load("res://guard.tscn")
		newGuard = newGuard.instantiate()
		newGuard.position = Vector2(419,300)
		add_child(newGuard)
	elif Global.caughtLevel>1:
		$guard.queue_free()
	Global.level = 1
	if Global.playing == false:
		Global.play()

func openGate():
	if get_node_or_null("doorCollider") != null:
		$doorCollider.queue_free()
		$doorMap.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "player":
		var nextLevel = load("res://level2.tscn")
		get_tree().change_scene_to_packed(nextLevel)
