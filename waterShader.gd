extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_water_effect_timer_timeout():
	self.texture.noise.seed += 1
	self.texture.noise.seed = wrapi(self.texture.noise.seed,0,500)
