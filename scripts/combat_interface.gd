extends Node2D

@export var texture : Texture

# Called when the node enters the scene tree for the first time.
func _ready():
	$Portrait1/Sprite2D.texture = Main.get_sun().sprite
	$Portrait2/Sprite2D.texture = Main.get_meteor().sprite
	$Portrait3/Sprite2D.texture = Main.get_moon().sprite
	$Portrait4/Sprite2D.texture = Main.get_satellite().sprite
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
