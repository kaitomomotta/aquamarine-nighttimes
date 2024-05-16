class_name Character extends Node

# generic character with shared non-overriden properties
# properties
@export var chr_name : String = "default"
@export var chr_enum : Enums.Characters
@export var sprite : Texture
@export var emotion : Enums.Emotions = Enums.Emotions.NEUTRAL

# evolution stats
@export var chr_level : int = 1
@export var chr_exp : int = 0

# survivability stats
@export var chr_max_hp : int = 100
@export var chr_hp : int

@export var chr_max_sp : int = 100
@export var chr_sp : int

# regular combat stats

## damage in regular attacks and physical skills
@export var chr_str : int
## damage in magic attack,
## effect of recovery skills
@export var chr_ma : int
## Defense against outside attacks, whether regular, Physical or Magic. 
@export var chr_en : int
## User's attack accuracy and evasion against enemy attacks,
## turn order
## affects odds for escaping from battle
@export var chr_ag : int
## critical rate,
## ailment infliction rate,
## success rate for instant kill skills,
## critical evasion rate,
## ailment evasion rate,
## instant death evasion rate,
## affects odds for escaping from battle
@export var chr_lu : int

func say_hi():
	print(chr_name + " has entered the chat")

func kill():
	print(chr_name + " is now dead")
	chr_hp = 0

func take_damage(amount : int):
	chr_hp -= amount
	print(chr_name + " took " + str(amount) + " damage, health is now " + str(chr_hp))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
