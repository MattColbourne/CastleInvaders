extends Node2D

var buttonArray = [1,2,3,4,5,6,7,8]
var openedDoor = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.checkLevel(3) == true:
		var newGuard = load("res://guard.tscn")
		newGuard = newGuard.instantiate()
		newGuard.position = Vector2(812,104)
		newGuard.scale = Vector2(0.5,0.5)
		add_child(newGuard)
		newGuard = load("res://guard.tscn")
		newGuard = newGuard.instantiate()
		newGuard.position = Vector2(1050,370)
		newGuard.scale = Vector2(0.5,0.5)
		add_child(newGuard)
		newGuard = load("res://guard.tscn")
		newGuard = newGuard.instantiate()
		newGuard.position = Vector2(445,137)
		newGuard.scale = Vector2(0.5,0.5)
		add_child(newGuard)
	elif Global.caughtLevel>3:
		$guard5.queue_free()
		$guard3.queue_free()
	Global.level = 3
	if Global.playing == false:
		Global.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $TileMap.get_cell_atlas_coords(0,$TileMap.local_to_map($player.global_position)) == Vector2i(2,0):
		#print("on lava")
		$player.onFire()
	else:
		$player.notOnFire()


func _on_area_2d_body_entered(body):
	if body.name == "player":
		var nextLevel = load("res://level4.tscn")
		get_tree().change_scene_to_packed(nextLevel)


func openDoor() -> void:
	$doorTileMap.visible = false
	$StaticBody2D.queue_free()
	openedDoor = true
	$doorSound.play()

func openNumGate(buttonNum) -> bool:
	if buttonArray.size()>0:
		if buttonNum == buttonArray[0]:
			buttonArray.remove_at(0)
			if buttonArray.size() == 0 and openedDoor == false:
				openDoor()
			return true
	return false
		
		
