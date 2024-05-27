extends Node

func list_targets(target: Enums.TARGET):
	var enemies = get_parent().enemies
	var allies = get_parent().allies
	var res = []
	match target:
		Enums.TARGET.ENEMY1:
			res.append(enemies[0])
		Enums.TARGET.ENEMY2:
			res.append(enemies[1])
		Enums.TARGET.ENEMY3:
			res.append(enemies[2])
		Enums.TARGET.ALL_ENEMIES:
			res.append_array(enemies)
		Enums.TARGET.ALLY1:
			res.append(allies[0])
		Enums.TARGET.ALLY2:
			res.append(allies[1])
		Enums.TARGET.ALLY3:
			res.append(allies[2])
		Enums.TARGET.ALLY4:
			res.append(allies[3])
		Enums.TARGET.ALL_ALLIES:
			res.append_array(allies)
	return res

func run_skill(skill : Enums.SKILLS, target : Enums.TARGET, source):
	var attack
	var tar = []
	if source is Character:
		var character = source as Character
		attack = character.chr_str
	var targets = list_targets(target)
	match skill:
		Enums.SKILLS.BASIC_ATTACK:
			for i in targets:
				i.take_damage(attack)
		Enums.SKILLS.HEAL:
			for i in targets:
				i.heal(attack)
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
