extends Node

# character variables
var ally1 : Character = Main.get_sun()
var ally2 : Character = Main.get_meteor()
var ally3 : Character = Main.get_moon()
var ally4 : Character = Main.get_satellite()

var enemies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# build allies list
	var allies = [ally1, ally2, ally3, ally4]
	for i in allies:
		i.say_hi()
	
	# build enemies list
	for i in $Enemies.get_children():
		enemies.append(i as Enemy)
	for i in enemies:
		i.say_hi()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
