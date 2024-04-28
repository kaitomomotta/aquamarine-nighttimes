extends Node

# character variables
var ally1 : Character = Main.get_sun()
var ally2 : Character = Main.get_meteor()
var ally3 : Character = Main.get_moon()
var ally4 : Character = Main.get_satellite()

## list of all present allies
var allies = []

## list of all present enemies
var enemies = []

## list of both present allies and present enemies
var entities = []

func print_entities() -> void:
	print("ALL PRESENT ENTITIES:")
	for i in entities:
		if i is Character:
			var k : Character = i as Character
			print("Character : " + k.chr_name)
		elif i is Enemy:
			var k : Enemy = i as Enemy
			print("Enemy : " + k.ene_name)

## custom sort function according to agility for entities list
func custom_agility_sort(a, b):
	var ares : int
	var bres : int
	if a is Character: 
		ares = (a as Character).chr_ag
	else:
		ares = (a as Enemy).ene_ag
	if b is Character:
		bres = (b as Character).chr_ag
	else:
		bres = (b as Enemy).ene_ag
	return ares > bres

# Called when the node enters the scene tree for the first time.
func _ready():
	# build allies list
	allies = [ally1, ally2, ally3, ally4]
	
	# build enemies list
	for i in $Enemies.get_children():
		enemies.append(i as Enemy)
	
	entities += allies
	entities += enemies

	# sort allies and enemies according to their agility
	entities.sort_custom(custom_agility_sort)
	print_entities()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
