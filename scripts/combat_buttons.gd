extends Node2D

@export var character : Character = null

enum BASIC_SCREEN {
	ATTACK,
	SKILLS,
	ITEMS,
	PASS
}
var basic_screen_pointer : BASIC_SCREEN = BASIC_SCREEN.ATTACK

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_type = get_parent().get_parent().input_type
	if input_type == Enums.COMBAT_INPUT_TYPE.BASE:
		$BasicScreen.visible = true
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
					# TODO
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