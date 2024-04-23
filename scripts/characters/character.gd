class_name Character extends Node

# generic character with shared non-overriden properties
# properties
@export var chr_name : String = "default"

# evolution stats
@export var chr_level : int = 1
@export var chr_exp : int = 0

# survivability stats
@export var chr_max_health : int = 100
@export var chr_health : int
@export var chr_shield : int = 0
@export var chr_is_dead : bool = false

# regular combat stats
@export var chr_atk : int = 10
@export var chr_def : int = 10
@export var chr_crit_rate : float = 0.0
@export var chr_crit_dmg : float = 100.0
@export var chr_spd : float = 10.0

# advanced stats (for later features)
@export var chr_break_effect : float = 0.0
@export var chr_effect_hit_rate : float = 10.0
@export var chr_effect_res : float = 0.0
@export var chr_energy_rate : float = 100.0


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
	pass # Replace with function body.


# Called every frame. 'delta' is the elsiapsed time nce the previous frame.
func _process(delta):
	pass
