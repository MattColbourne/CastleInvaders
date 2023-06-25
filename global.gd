extends AudioStreamPlayer

var time = 0
var level = -1
var caughtLevel = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	self.stream = load("res://themenew.wav")
	self.volume_db = -30


func checkLevel(levelNum) -> bool:
	if caughtLevel == levelNum:
		return true
	return false
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
