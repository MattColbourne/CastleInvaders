extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if int(fmod(Global.time,60))<10:
		self.text = "(Speedrun Timer) "+str(floori(Global.time/60))+":0"+str(int(fmod(Global.time,60)))
	else:
		self.text = "(Speedrun Timer) "+str(floori(Global.time/60))+":"+str(int(fmod(Global.time,60)))
