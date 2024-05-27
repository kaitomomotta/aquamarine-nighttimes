extends Node2D

@export var character : Character = null

enum BASIC_SCREEN {
	ATTACK,
	SKILLS,
	ITEMS,
	PASS
}
var basic_screen_pointer : BASIC_SCREEN = BASIC_SCREEN.ATTACK

var selecting_ally_cursor : int = 0

var selecting_enemy_cursor : int = 0
@onready var selecting_enemy_pointer : Sprite2D = $SelectingEnemyPointer

var skill_pointer_index : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_enemy_pos_from_index(enemies, index) -> Vector2:
	if len(enemies) == 1:
		return Vector2(960,540)
	if len(enemies) == 2:
		if index == 0:
			return Vector2(700,540)
		return Vector2(1220, 540)
	if index == 0:
		return Vector2(650,600)
	if index == 1:
		return Vector2(960,300)
	return Vector2(1270, 600)
	
func get_ally_pos_from_index(index) -> Vector2:
	match index:
		0:
			return Vector2(-660,-127)
		1:
			return Vector2(-660,-600)
		2:
			return Vector2(660,-127)
	return Vector2(660,-600)

func get_skill_pos_from_index(skill_index) -> Vector2:
	match skill_index:
		0:
			return Vector2(-430,-40)
		1:
			return Vector2(-430, 40)
		2:
			return Vector2(430, -40)
		3:
			return Vector2(430, 40)
	return Vector2(0, 0)

func update_skills():
	var active = get_parent().get_parent().active_entity as Character
	var skills = active.get_selected_skills()
	$SkillScreen/Sprite2D/Label0.text = Enums.skill_to_str(skills[0])
	$SkillScreen/Sprite2D/Label1.text = Enums.skill_to_str(skills[1])
	$SkillScreen/Sprite2D/Label2.text = Enums.skill_to_str(skills[2])
	$SkillScreen/Sprite2D/Label3.text = Enums.skill_to_str(skills[3])

var coming_from_skill = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_type = get_parent().get_parent().input_type
	
	if input_type == Enums.COMBAT_INPUT_TYPE.SELECTING_ALLY:
		$BasicScreen.visible = false
		$SelectingAllyPointer.visible = true
		$SelectingAllyPointer.position = get_ally_pos_from_index(selecting_ally_cursor)
		#$SelectingEnemyPointer.position = get_enemy_pos_from_index(enemies,selecting_enemy_cursor) - Vector2(position)
		if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			if selecting_ally_cursor == 0 or selecting_ally_cursor == 1:
				selecting_ally_cursor += 2
			else:
				selecting_ally_cursor -= 2
		if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
			if selecting_ally_cursor == 0 or selecting_ally_cursor == 2:
				selecting_ally_cursor += 1
			else:
				selecting_ally_cursor -= 1
		if Input.is_action_just_pressed("ui_accept"):
			$SelectingAllyPointer.visible = false
			get_parent().get_parent().target = Enums.int_to_character(selecting_ally_cursor)
			get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.DIALOGUE
		if Input.is_action_just_pressed("ui_cancel"):
			$SelectingEnemyPointer.visible = false
			if coming_from_skill:
				get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.SELECTING_SKILL
			else:
				get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.BASE
		return
	
	if input_type == Enums.COMBAT_INPUT_TYPE.SELECTING_ENEMY:
		$BasicScreen.visible = false
		$SelectingEnemyPointer.visible = true
		var enemies = get_parent().get_parent().get_enemies()
		$SelectingEnemyPointer.position = get_enemy_pos_from_index(enemies,selecting_enemy_cursor) - Vector2(position)
		if Input.is_action_just_pressed("ui_right"):
			selecting_enemy_cursor += 1
			selecting_enemy_cursor %= len(enemies)
		if Input.is_action_just_pressed("ui_left"):
			selecting_enemy_cursor += len(enemies) - 1
			selecting_enemy_cursor %= len(enemies)
		if Input.is_action_just_pressed("ui_accept"):
			$SelectingEnemyPointer.visible = false
			get_parent().get_parent().target = Enums.target_enemy_to_enum(selecting_enemy_cursor)
			get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.DIALOGUE
		if Input.is_action_just_pressed("ui_cancel"):
			$SelectingEnemyPointer.visible = false
			if coming_from_skill:
				get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.SELECTING_SKILL
			else:
				get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.BASE
		return
	
	if input_type == Enums.COMBAT_INPUT_TYPE.SELECTING_SKILL:
		$BasicScreen.visible = false
		$SkillScreen.visible = true
		$SkillScreen/Pointer.position = get_skill_pos_from_index(skill_pointer_index)
		if Input.is_action_just_pressed("ui_accept"):
			$SkillScreen.visible = false
			coming_from_skill = true
			var active = get_parent().get_parent().active_entity as Character
			var skills = active.get_selected_skills()
			get_parent().get_parent().skill = skills[skill_pointer_index]
			var type = Enums.skill_selecting_type(skills[skill_pointer_index])
			if type == 0:
				get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.SELECTING_ENEMY
			else:
				get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.SELECTING_ALLY
		if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			if skill_pointer_index == 0 or skill_pointer_index == 1:
				skill_pointer_index += 2
			else:
				skill_pointer_index -= 2
		if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
			if skill_pointer_index == 0 or skill_pointer_index == 2:
				skill_pointer_index += 1
			else:
				skill_pointer_index -= 1
		if Input.is_action_just_pressed("ui_cancel"):
			get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.BASE
		
	
	if input_type == Enums.COMBAT_INPUT_TYPE.DIALOGUE:
		var target = get_parent().get_parent().target
		var skill = get_parent().get_parent().skill
		print("target: " + str(target) + ", attack: " + str(skill))
		get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.FINISHED
	
	if input_type == Enums.COMBAT_INPUT_TYPE.BASE:
		$SkillScreen.visible = false
		$BasicScreen.visible = true
		$SelectingEnemyPointer.visible = false
		$SelectingAllyPointer.visible = false
		match basic_screen_pointer:
			BASIC_SCREEN.PASS:
				if Input.is_action_just_pressed("ui_accept"):
					# end turn because user chose to pass
					skill_pointer_index = 0
					get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.FINISHED
				if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
					basic_screen_pointer = BASIC_SCREEN.ITEMS
					$BasicScreen/Pointer.position = $BasicScreen/Items.position
				if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
					basic_screen_pointer = BASIC_SCREEN.SKILLS
					$BasicScreen/Pointer.position = $BasicScreen/Skills.position
			BASIC_SCREEN.ATTACK:
				if Input.is_action_just_pressed("ui_accept"):
					coming_from_skill = false
					get_parent().get_parent().skill = Enums.SKILLS.BASIC_ATTACK
					get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.SELECTING_ENEMY
					pass
				if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
					basic_screen_pointer = BASIC_SCREEN.SKILLS
					$BasicScreen/Pointer.position = $BasicScreen/Skills.position
				if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
					basic_screen_pointer = BASIC_SCREEN.ITEMS
					$BasicScreen/Pointer.position = $BasicScreen/Items.position
			BASIC_SCREEN.SKILLS:
				if Input.is_action_just_pressed("ui_accept"):
					get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.SELECTING_SKILL
					update_skills()
					pass
				if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
					basic_screen_pointer = BASIC_SCREEN.ATTACK
					$BasicScreen/Pointer.position = $BasicScreen/Attack.position
				if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
					basic_screen_pointer = BASIC_SCREEN.PASS
					$BasicScreen/Pointer.position = $BasicScreen/Pass.position
			BASIC_SCREEN.ITEMS:
				if Input.is_action_just_pressed("ui_accept"):
					# TODO
					pass
				if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
					basic_screen_pointer = BASIC_SCREEN.PASS
					$BasicScreen/Pointer.position = $BasicScreen/Pass.position
				if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
					basic_screen_pointer = BASIC_SCREEN.ATTACK
					$BasicScreen/Pointer.position = $BasicScreen/Attack.position
	pass
