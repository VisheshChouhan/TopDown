extends CharacterBody2D


const SPEED = 2000.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	var screenSize = get_viewport().get_visible_rect().size
	print(screenSize.x)
	print(screenSize.y)
	
	position = Vector2(screenSize.x/2, screenSize.y/10*8)


func _process(delta):
	if Game.GameState == Game.GameStatesArray[0]:
			velocity.x = Input.get_accelerometer().normalized().x * SPEED
	

func _physics_process(delta):
	velocity.y = 0
	if Game.GameState == Game.GameStatesArray[0]:
		move_and_slide()
	
	# Add the gravity.
	

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()


func _on_input_event(viewport, event, shape_idx):
	pass # Replace with function body.


func _on_player_area_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "Hurdle1":
		Game.GameState = Game.GameStatesArray[1]
		print("Object entered")
	 # Replace with function body.
