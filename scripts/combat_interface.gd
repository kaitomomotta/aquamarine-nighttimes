extends Node2D

var enemies = []

func update_enemies():
	enemies = get_parent().get_enemies()
	if len(enemies) > 0:
		var enemy1 = enemies[0] as Enemy
		$Enemies/Enemy1/Sprite2D.texture = enemy1.sprite
		$Enemies/Enemy1/HPLabel.text = str(enemy1.ene_hp) + "/" + str(enemy1.ene_max_hp)
		$Enemies/Enemy1.position = Vector2(960,540)
	if len(enemies) > 1:
		# there is a second enemy
		var enemy2 = enemies[1] as Enemy
		$Enemies/Enemy2/Sprite2D.texture = enemy2.sprite
		$Enemies/Enemy2/HPLabel.text = str(enemy2.ene_hp) + "/" + str(enemy2.ene_max_hp)
		$Enemies/Enemy1.position = Vector2(700,540)
		$Enemies/Enemy2.position = Vector2(1220, 540)
	if len(enemies) > 2:
		# there is a 3rd enemy
		var enemy3 = enemies[2] as Enemy
		$Enemies/Enemy3/Sprite2D.texture = enemy3.sprite
		$Enemies/Enemy3/HPLabel.text = str(enemy3.ene_hp) + "/" + str(enemy3.ene_max_hp)
		$Enemies/Enemy1.position = Vector2(650,600)
		$Enemies/Enemy2.position = Vector2(960,300)
		$Enemies/Enemy3.position = Vector2(1270, 600)
		

func update_pointer_position(active_entity):
	if active_entity is Character:
		match (active_entity as Character).chr_enum:
			Enums.Characters.SUN:
				$Pointer.position = Vector2(100, 900)
			Enums.Characters.METEOR:
				$Pointer.position = Vector2(1625, 350)
			Enums.Characters.MOON:
				$Pointer.position = Vector2(100, 350)
			Enums.Characters.SATELLITE:
				$Pointer.position = Vector2(1625, 900)

func update_character_portrait():
	$Portrait1/Sprite2D.sprite_frames = Main.get_sun().sprite
	$Portrait1/Sprite2D.play("neutral")
	$Portrait1/HPLabel.text = str(Main.get_sun().chr_hp) + " / " + str(Main.get_sun().chr_max_hp)
	$Portrait1/SPLabel.text = str(Main.get_sun().chr_sp) + " / " + str(Main.get_sun().chr_max_sp)
	$Portrait1/EmotionLabel.text = Enums.emotion_to_str(Main.get_sun().emotion)
	
	$Portrait2/Sprite2D.sprite_frames = Main.get_meteor().sprite
	$Portrait2/Sprite2D.play("neutral")
	$Portrait2/HPLabel.text = str(Main.get_meteor().chr_hp) + " / " + str(Main.get_meteor().chr_max_hp)
	$Portrait2/SPLabel.text = str(Main.get_meteor().chr_sp) + " / " + str(Main.get_meteor().chr_max_sp)
	$Portrait2/EmotionLabel.text = Enums.emotion_to_str(Main.get_meteor().emotion)	
		
	$Portrait3/Sprite2D.sprite_frames = Main.get_moon().sprite
	$Portrait3/Sprite2D.play("neutral")
	$Portrait3/HPLabel.text = str(Main.get_moon().chr_hp) + " / " + str(Main.get_moon().chr_max_hp)
	$Portrait3/SPLabel.text = str(Main.get_moon().chr_sp) + " / " + str(Main.get_moon().chr_max_sp)
	$Portrait3/EmotionLabel.text = Enums.emotion_to_str(Main.get_moon().emotion)
	
	$Portrait4/Sprite2D.sprite_frames = Main.get_satellite().sprite
	$Portrait4/Sprite2D.play("neutral")
	$Portrait4/HPLabel.text = str(Main.get_satellite().chr_hp) + " / " + str(Main.get_satellite().chr_max_hp)
	$Portrait4/SPLabel.text = str(Main.get_satellite().chr_sp) + " / " + str(Main.get_satellite().chr_max_sp)
	$Portrait4/EmotionLabel.text = Enums.emotion_to_str(Main.get_satellite().emotion)
	return



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_character_portrait()
	update_enemies()
	pass
