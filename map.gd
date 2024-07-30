extends Node2D

var ScreenSize
# Called when the node enters the scene tree for the first time.
func _ready():
	var screenSize = get_viewport().get_visible_rect().size
	var cl1Size = $StaticBody2D/CollisionShape2D.shape.extents
	#get_node("StaticBody2D").get_child("CollisionShape2D").posiion = Vector2(screenSize.x, screenSize.y)
	$StaticBody2D/CollisionShape2D.position = Vector2(screenSize.x/4 - cl1Size.x, screenSize.y/2)

	var cl2Size = $StaticBody2D/CollisionShape2D.shape.extents
	$StaticBody2D2/CollisionShape2D.position = Vector2(screenSize.x *.75 + cl2Size.x, screenSize.y/2)

	#var cl2Size = $StaticBody2D/CollisionShape2D.shape.extents
	$StaticBody2D3/CollisionShape2D.position = Vector2(screenSize.x *.5, screenSize.y/2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
