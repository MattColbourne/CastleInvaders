extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PointLight2D.rotation_degrees+= delta*150


func _on_area_2d_body_entered(body):
	if body.name == "player":
		var winScreen = load("res://winScreen.tscn")
		get_tree().change_scene_to_packed(winScreen)
