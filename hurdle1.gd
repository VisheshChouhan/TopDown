extends Area2D


var screenSize
var speed = Game.HurdleSpeed

var hurdlePos := [3, 5]

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport().get_visible_rect().size
	print(screenSize.x)
	print(screenSize.y)
	
	var i = randi() % 2
	
	var multiplier = hurdlePos[i]
	
	
	
	position = Vector2(screenSize.x/8 * multiplier ,- screenSize.y/5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Game.GameState == Game.GameStatesArray[0] :
		position.y += speed*delta
	if Game.GameState == Game.GameStatesArray[1]:
		position.y -= speed*delta / 2
	
	if position.y > screenSize.y * 1.2:
		queue_free()
	pass


func _on_body_entered(body):
	if body.name == "Player":
		Game.GameState = Game.GameStatesArray[1]
		if Game.PlayerHP > Game.HighScore:
			Game.HighScore = Game.PlayerHP
		Utils.SaveGame()
			
		queue_free()

