extends CharacterBody2D

var lookedOnce = false
var speed = 350
var thisVelocity = Vector2(1,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if lookedOnce == false:
		lookedOnce = true
		look_at(get_global_mouse_position())
	global_position += thisVelocity.rotated(rotation)*speed*delta
	if speed>0:
		speed-=(delta*200)
	else:
		speed = 0
	move_and_slide()

func _on_destroy_decoy_timer_timeout():
	self.queue_free()
