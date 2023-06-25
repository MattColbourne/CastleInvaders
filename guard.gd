extends CharacterBody2D


var decoy = null
var speed = 20
var walkDirection = Vector2(0,0)
var lookAtDirection = null
var lookAtDecoy = false
# Called when the node enters the scene tree for the first time.
func _ready():
	changeDirection()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if decoy != null and lookAtDecoy == false:
		lookAtDecoy = true
		walkDirection = Vector2(0,0)
		$directionTimer.stop()
	if lookAtDecoy == true:
		if is_instance_valid(decoy):
			turnTo(decoy.global_position,deg_to_rad(6))
		else:
			decoy = null
			$directionTimer.start()
			lookAtDecoy = false
	
	
	var next_path_position = $NavigationAgent2D.get_next_path_position()
	var new_velocity = next_path_position - global_position
	new_velocity = new_velocity.normalized() * speed
	velocity = new_velocity
	move_and_slide()
	$NavigationAgent2D.target_position = global_position+walkDirection

func _process(delta):
	if lookAtDirection != null and lookAtDecoy == false:
		look(lookAtDirection,delta)

func _on_area_2d_body_entered(body):
	if body.name == "player":
		#dies
		playerCaught()
	elif body.name == "playerDecoy":
		decoy = body

func playerCaught() -> void:
	$EnemyVision.modulate = Color(255,0,0)
	$EnemyVision3.modulate = Color(255,0,0)
	$caughtTransition.caught()
	#get_tree().paused = true
	
	
	
func turnTo(point,turnSpeed) -> void:
	var spotToTurn = get_angle_to(point)
	if abs(spotToTurn) < turnSpeed:
		rotation += spotToTurn
	else:
		if spotToTurn>0: 
			rotation += turnSpeed #clockwise
		if spotToTurn<0: 
			rotation -= turnSpeed #anti-clockwise

func look(direction,delta):
	match direction:
		"right":
			turnTo(global_position+Vector2(1,0),deg_to_rad(1))
		"left":
			turnTo(global_position+Vector2(-1,0),deg_to_rad(1))
		"up":
			turnTo(global_position+Vector2(0,-1),deg_to_rad(1))
		"down":
			turnTo(global_position+Vector2(0,1),deg_to_rad(1))

	
	
func changeDirection():
	var direction = randi_range(0,3)
	$directionTimer.wait_time = randi_range(5,10)
	#$directionTimer.wait_time = 5
	match direction:
		0:
			walkDirection = Vector2(1,0)
			lookAtDirection = "right"
			#print("right")
		1:
			walkDirection = Vector2(-1,0)
			lookAtDirection = "left"
			#print("left")
		2:
			walkDirection = Vector2(0,1)
			lookAtDirection = "down"
			#print("down")
		3:
			walkDirection = Vector2(0,-1)
			lookAtDirection = "up"
			#print("up")

func _on_direction_timer_timeout():
	changeDirection()
	
