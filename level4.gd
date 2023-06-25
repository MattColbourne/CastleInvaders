extends Node2D

var buttonArray = [1,2,3]
var openedDoor = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.checkLevel(4) == true:
		var newGuard = load("res://guard.tscn")
		newGuard = newGuard.instantiate()
		newGuard.position = Vector2(341,75)
		newGuard.scale = Vector2(0.5,0.5)
		add_child(newGuard)
		newGuard = load("res://guard.tscn")
		newGuard = newGuard.instantiate()
		newGuard.position = Vector2(797,186)
		add_child(newGuard)
		newGuard = load("res://guard.tscn")
		newGuard = newGuard.instantiate()
		newGuard.position = Vector2(411,611)
		newGuard.scale = Vector2(0.75,0.75)
		add_child(newGuard)
	elif Global.caughtLevel>4:
		$guard2.queue_free()
		$guard4.queue_free()
	Global.level = 4
	if Global.playing == false:
		Global.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(Vector2i($player.global_position))
	if $TileMap.get_cell_atlas_coords(0,$TileMap.local_to_map($player.global_position)) == Vector2i(2,0):
		$player.onFire()
	else:
		$player.notOnFire()
func openDoor() -> void:
	$doorMap.visible = false
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
