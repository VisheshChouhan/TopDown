extends Node2D

var hurdle1 = preload("res://hurdle1.tscn")
var obs 
var timerTime 
var timer 
var dificulty 


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Utils.SaveGame()
	Utils.LoadGame()
	
	Game.GameState = Game.GameStatesArray[0] 
	timerTime = 100
	timer = timerTime
	dificulty = 0
	var screenSize = get_viewport().get_visible_rect().size
	
	## To align Game over on screen
	var labelSize = $CanvasLayer2/Label.size 
	$CanvasLayer2/Label.position = Vector2(screenSize.x/2 - labelSize.x/2, screenSize.y/3 - labelSize.y/2)
	
	# To align Restart button on screen
	var buttonSize = $CanvasLayer2/Button.size 
	$CanvasLayer2/Button.position = Vector2(screenSize.x/2 - buttonSize.x/2, screenSize.y/1.5 - buttonSize.y/2)
	
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	obs = hurdle1.instantiate()
	if timer <= 0 and Game.GameState == Game.GameStatesArray[0]:
		add_child(obs)
		timer = timerTime - 1 * dificulty

	if Game.GameState == Game.GameStatesArray[0]:
		Game.PlayerHP += 1
		
	if Game.HurdleSpeed<2000 && Game.PlayerHP%100 == 0:
		Game.HurdleSpeed += 40
		dificulty += 1.5
	timer -=1
	
	print(Game.GameState)
	print("timer ",timer)
	
	
	if Game.GameState == Game.GameStatesArray[1]:
		$CanvasLayer2.show()
	else:
		$CanvasLayer2.hide()


func _on_button_pressed():
	$CanvasLayer2.hide()

	Utils.LoadGame()
	
	Game.GameState = Game.GameStatesArray[0] 
	Game.PlayerHP = 0
	timerTime = 100
	timer = timerTime
	dificulty = 0
