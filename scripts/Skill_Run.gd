extends Node

func run_skill(skill : Enums.SKILLS, target : Enums.TARGET, source):
	var attack
	if source is Character:
		var character = source as Character
		attack = character.chr_str
	match skill:
		Enums.SKILLS.BASIC_ATTACK:
			#TODO
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
