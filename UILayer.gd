extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timeUntilDecoy = get_parent().get_node("player").get_node("decoyCooldown").time_left
	if timeUntilDecoy > 0:
		$decoyReady.text = str(int(timeUntilDecoy)+1)
	else:
		$decoyReady.text = "Decoy Ready"
