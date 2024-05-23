extends Node2D

@export var character : Character = null

enum BASIC_SCREEN {
	ATTACK,
	SKILLS,
	ITEMS,
	PASS
}
var basic_screen_pointer : BASIC_SCREEN = BASIC_SCREEN.ATTACK

var selecting_enemy_cursor : int = 0
@onready var selecting_enemy_pointer : Sprite2D = $SelectingEnemyPointer

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_type = get_parent().get_parent().input_type
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
			get_parent().get_parent().skill = Enums.SKILLS.BASIC_ATTACK
			get_parent().get_parent().target = Enums.target_enemy_to_enum(selecting_enemy_cursor)
			get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.DIALOGUE
		if Input.is_action_just_pressed("ui_cancel"):
			get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.BASE
		return
	
	if input_type == Enums.COMBAT_INPUT_TYPE.DIALOGUE:
		var target = get_parent().get_parent().target
		var skill = get_parent().get_parent().skill
		print("target: " + str(target) + ", attack: " + str(skill))
		get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.FINISHED
	
	if input_type == Enums.COMBAT_INPUT_TYPE.BASE:
		$BasicScreen.visible = true
		$SelectingEnemyPointer.visible = false
		match basic_screen_pointer:
			BASIC_SCREEN.PASS:
				if Input.is_action_just_pressed("ui_accept"):
					# end turn because user chose to pass
					get_parent().get_parent().input_type = Enums.COMBAT_INPUT_TYPE.FINISHED
				if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
					basic_screen_pointer = BASIC_SCREEN.ITEMS
					$BasicScreen/Pointer.position = $BasicScreen/Items.position
				if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
					basic_screen_pointer = BASIC_SCREEN.SKILLS
					$BasicScreen/Pointer.position = $BasicScreen/Skills.position
			BASIC_SCREEN.ATTACK:
				if Input.is_action_just_pressed("ui_accept"):
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
					# TODO
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
