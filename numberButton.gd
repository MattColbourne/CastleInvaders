extends Node2D

@export var buttonNum = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$buttonNumLabel.text = str(buttonNum)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func pressButton() -> void:
	$buttonUpLight.visible = false
	$buttonNumLabel.add_theme_color_override("font_color",Color(0.6,0.8,0.6))
func _on_area_2d_body_entered(body):
	if body.name == "player":
		if get_parent().get_parent().openNumGate(buttonNum) == true:
			pressButton()
