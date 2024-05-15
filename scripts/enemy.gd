class_name Enemy extends Node

# generic character with shared non-overriden properties
# properties
@export var ene_name : String = "default"
@export var sprite : Texture
@export var emotion : Enums.Emotions = Enums.Emotions.NEUTRAL

# evolution stats
@export var ene_level : int = 1
@export var ene_exp : int = 0

# survivability stats
@export var ene_max_hp : int = 100
@export var ene_hp : int

# regular combat stats

## damage in regular attacks and physical skills
@export var ene_str : int
## damage in magic attack,
## effect of recovery skills
@export var ene_ma : int
## Defense against outside attacks, whether regular, Physical or Magic. 
@export var ene_en : int
## User's attack accuracy and evasion against enemy attacks,
## turn order
## affects odds for escaping from battle
@export var ene_ag : int
## critical rate,
## ailment infliction rate,
## success rate for instant kill skills,
## critical evasion rate,
## ailment evasion rate,
## instant death evasion rate,
## affects odds for escaping from battle
@export var ene_lu : int

func say_hi():
	print(ene_name + " has entered the combat")

func kill():
	print(ene_name + " is now dead")
	ene_hp = 0

func take_damage(amount : int):
	ene_hp -= amount
	print(ene_name + " took " + str(amount) + " damage, health is now " + str(ene_hp))

# Called when the node enters the scene tree for the first time.
func _ready():
	ene_hp = ene_max_hp
	pass # Replace with function body.
