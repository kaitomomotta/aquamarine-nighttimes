extends Node

enum COMBAT_STATUS {
	STARTING = 0,
	CONTINUING,
	WON,
	LOSS
}

@export var combat_status : COMBAT_STATUS = COMBAT_STATUS.STARTING

# character variables
var ally1 : Character = Main.get_sun()
var ally2 : Character = Main.get_meteor()
var ally3 : Character = Main.get_moon()
var ally4 : Character = Main.get_satellite()

## list of all present allies
@export var allies = []

## list of all present enemies
@export var enemies = []

var active_entity

func get_enemies():
	return enemies

## the index of the active entity in entities list
var entity_index = 0

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
		if i is Enemy:
			enemies.append(i as Enemy)
	
	entities += allies
	entities += enemies

	# sort allies and enemies according to their agility
	entities.sort_custom(custom_agility_sort)
	print_entities()

	# start the combat
	combat_status = COMBAT_STATUS.CONTINUING
	active_entity = entities[0]
	$Combat_Interface.update_pointer_position(active_entity)

func next_turn() -> int:
	if active_entity is Character: 
		print ("ended character " + (active_entity as Character).chr_name + "'s turn")
	if active_entity is Enemy:
		print("ended enemy " + (active_entity as Enemy).ene_name + "'s turn")
	for i in range(len(entities)):
		if entities[i] == active_entity:
			if i == len(entities) - 1:
				active_entity = entities[0]
				$Combat_Interface.update_pointer_position(active_entity)
				return 0
			active_entity = entities[i+1]
			$Combat_Interface.update_pointer_position(active_entity)
			return i+1
	return -1
	
func check_all_enemies_dead() -> bool:
	for i in $Enemies.get_children():
		if (i as Enemy).ene_hp > 0:
			return false
	return true

func check_all_allies_dead() -> bool:
	for i in allies:
		if (i as Character).chr_hp > 0:
			return false
	return true

var input_type : Enums.COMBAT_INPUT_TYPE = Enums.COMBAT_INPUT_TYPE.BASE
var target : Enums.TARGET = Enums.TARGET.NONE
var skill : Enums.SKILLS = Enums.SKILLS.NONE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if combat_status == COMBAT_STATUS.CONTINUING:
		# check if no need to continue combat
		if check_all_allies_dead():
			combat_status = COMBAT_STATUS.LOSS
		if check_all_enemies_dead():
			combat_status = COMBAT_STATUS.WON
			
		if active_entity is Enemy:
			# TODO implement enemy logic
			next_turn()
		
		#check input types, go back to base afterwards
		match input_type:
			Enums.COMBAT_INPUT_TYPE.BASE:
				return
			Enums.COMBAT_INPUT_TYPE.DIALOGUE:
				# TODO
				$Skill_Run.run_skill(skill, target, active_entity)
				input_type = Enums.COMBAT_INPUT_TYPE.FINISHED
				return
			Enums.COMBAT_INPUT_TYPE.SELECTING_SKILL:
				# TODO
				return
			Enums.COMBAT_INPUT_TYPE.SELECTING_ENEMY:
				# check for none or wrong input
				if target == Enums.TARGET.NONE or target == Enums.TARGET.ALLY1 or target == Enums.TARGET.ALLY2 or target == Enums.TARGET.ALLY3 or target == Enums.TARGET.ALLY4:
					target = Enums.TARGET.NONE
					return
				# TODO there is someone selected, perform the action
				$Skill_Run.run_skill(skill, target, active_entity)
				print("aaa")
				input_type = Enums.COMBAT_INPUT_TYPE.FINISHED
				return
			Enums.COMBAT_INPUT_TYPE.SELECTING_ALLY:
				# check for none or wrong input
				if target == Enums.TARGET.NONE or target == Enums.TARGET.ENEMY1 or target == Enums.TARGET.ENEMY2 or target == Enums.TARGET.ENEMY3:
					target = Enums.TARGET.NONE
					return
				# TODO there is someone selected, perform the action
				return
			Enums.COMBAT_INPUT_TYPE.FINISHED:
				next_turn()
				input_type = Enums.COMBAT_INPUT_TYPE.BASE
				target = Enums.TARGET.NONE
				return
		return
	print("combat is finished")
