class_name Character extends Node

# properties
@export var chr_name : String = "default"

@export var chr_level : int = 1
@export var chr_exp : int = 0

@export var chr_max_health : int = 100
@export var chr_health : int
@export var chr_is_dead : bool = false

func say_hi():
	print(chr_name + " has entered the chat")

func kill():
	print(chr_name + " is now dead")
	chr_health = 0
	chr_is_dead = true

func take_damage(amount : int):
	chr_health -= amount
	print(chr_name + " took " + str(amount) + " damage, health is now " + str(chr_health))
	if chr_health <= 0:
		kill()

# Called when the node enters the scene tree for the first time.
func _ready():
	chr_health = chr_max_health
	say_hi()
	pass # Replace with function body.


# Called every frame. 'delta' is the elsiapsed time nce the previous frame.
func _process(delta):
	pass
