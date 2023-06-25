extends Node2D

var buttonArray = [1,2,3,4,5]
var openedDoor = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.checkLevel(2) == true:
		var newGuard = load("res://guard.tscn")
		newGuard = newGuard.instantiate()
		newGuard.position = Vector2(289,601)
		add_child(newGuard)
		newGuard = load("res://guard.tscn")
		newGuard = newGuard.instantiate()
		newGuard.position = Vector2(1043,249)
		add_child(newGuard)
	elif Global.caughtLevel>2:
		$guard4.queue_free()
		$guard3.queue_free()
	Global.level = 2
	if Global.playing == false:
		Global.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "player":
		var nextLevel = load("res://level3.tscn")
		get_tree().change_scene_to_packed(nextLevel)
		
func openDoor() -> void:
	$doorTileMap.visible = false
	$StaticBody2D.queue_free()
	openedDoor = true
	$doorSound.play()
#returns true if button gets pressed
func openNumGate(buttonNum) -> bool:
	if buttonArray.size()>0:
		if buttonNum == buttonArray[0]:
			buttonArray.remove_at(0)
			if buttonArray.size() == 0 and openedDoor == false:
				openDoor()
			return true
	return false
		
		
