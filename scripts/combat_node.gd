extends Node

# character variables
var sun : Sun = Main.get_sun()

# Called when the node enters the scene tree for the first time.
func _ready():
	sun.say_hi()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
