extends Node2D

@export var texture : Texture

func update_character_portrait(c : Enums.Characters):
	if c == Enums.Characters.SUN:
		$Portrait1/Sprite2D.texture = Main.get_sun().sprite
		$Portrait1/HPLabel.text = str(Main.get_sun().chr_hp) + " / " + str(Main.get_sun().chr_max_hp)
		$Portrait1/SPLabel.text = str(Main.get_sun().chr_sp) + " / " + str(Main.get_sun().chr_max_sp)
		$Portrait1/EmotionLabel.text = Enums.emotion_to_str(Main.get_sun().emotion)
	if c == Enums.Characters.METEOR:
		$Portrait2/Sprite2D.texture = Main.get_meteor().sprite
		$Portrait2/HPLabel.text = str(Main.get_meteor().chr_hp) + " / " + str(Main.get_meteor().chr_max_hp)
		$Portrait2/SPLabel.text = str(Main.get_meteor().chr_sp) + " / " + str(Main.get_meteor().chr_max_sp)
		$Portrait2/EmotionLabel.text = Enums.emotion_to_str(Main.get_meteor().emotion)		
	if c == Enums.Characters.MOON:
		$Portrait3/Sprite2D.texture = Main.get_moon().sprite
		$Portrait3/HPLabel.text = str(Main.get_moon().chr_hp) + " / " + str(Main.get_moon().chr_max_hp)
		$Portrait3/SPLabel.text = str(Main.get_moon().chr_sp) + " / " + str(Main.get_moon().chr_max_sp)
		$Portrait3/EmotionLabel.text = Enums.emotion_to_str(Main.get_moon().emotion)
	if c == Enums.Characters.SATELLITE:
		$Portrait4/Sprite2D.texture = Main.get_satellite().sprite
		$Portrait4/HPLabel.text = str(Main.get_satellite().chr_hp) + " / " + str(Main.get_satellite().chr_max_hp)
		$Portrait4/SPLabel.text = str(Main.get_satellite().chr_sp) + " / " + str(Main.get_satellite().chr_max_sp)
		$Portrait4/EmotionLabel.text = Enums.emotion_to_str(Main.get_satellite().emotion)
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	update_character_portrait(Enums.Characters.SUN)
	update_character_portrait(Enums.Characters.METEOR)
	update_character_portrait(Enums.Characters.MOON)
	update_character_portrait(Enums.Characters.SATELLITE)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
