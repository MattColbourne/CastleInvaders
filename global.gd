extends AudioStreamPlayer

var time = 0
var level = -1
var caughtLevel = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	self.stream = load("res://themenew.wav")
	self.volume_db = -30


func checkLevel(levelNum) -> bool:
	if caughtLevel == levelNum:
		return true
	return false
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if Input.is_action_just_pressed("tab") and get_tree().current_scene.name != "main_menu":
		var mainMenu = load("res://mainMenu.tscn")
		time = 0
		level = -1
		caughtLevel = -1
		get_tree().change_scene_to_packed(mainMenu)
