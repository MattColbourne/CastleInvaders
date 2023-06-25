extends CharacterBody2D


const SPEED = 150

var decoyReady = false
var decoy = preload("res://playerDecoy.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity = Input.get_vector("left", "right", "up", "down") * SPEED
	move_and_slide()
	
	$pivot.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("left_click") and decoyReady == true:
		decoyReady = false
		var newDecoy = decoy.instantiate()
		newDecoy.global_position = self.global_position
		get_parent().add_child(newDecoy)
		$decoyCooldown.start()
		


func _on_decoy_cooldown_timeout():
	decoyReady = true
