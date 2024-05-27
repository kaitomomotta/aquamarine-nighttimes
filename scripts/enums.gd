extends Node

enum Characters {
	SUN = 0,
	METEOR = 1,
	MOON = 2,
	SATELLITE = 3
}

func int_to_character(ch : int) -> TARGET:
	match ch:
		0:
			return TARGET.ALLY1
		1:
			return TARGET.ALLY2
		2:
			return TARGET.ALLY3
		3:
			return TARGET.ALLY4
	return TARGET.ALL_ALLIES
	

enum Emotions {
	NEUTRAL = 0,
	HAPPY,
	ECSTATIC,
	SAD,
	DEPRESSED,
	ANGRY,
	ENRAGED
}

func emotion_to_str(e : Emotions):
	if e == Emotions.NEUTRAL:
		return "NEUTRAL"
	if e == Emotions.HAPPY:
		return "HAPPY"
	if e == Emotions.ECSTATIC:
		return "ECSTATIC"
	if e == Emotions.SAD:
		return "SAD"
	if e == Emotions.DEPRESSED:
		return "DEPRESSED"
	if e == Emotions.ANGRY:
		return "ANGRY"
	if e == Emotions.ENRAGED:
		return "ENRAGED"

enum TARGET {
	NONE = 0,
	ALLY1,
	ALLY2,
	ALLY3,
	ALLY4,
	ENEMY1,
	ENEMY2,
	ENEMY3,
	ALL_ALLIES,
	ALL_ENEMIES
}

func target_enemy_to_enum(i):
	if i == 0: 
		return TARGET.ENEMY1
	if i == 1:
		return TARGET.ENEMY2
	if i == 2:
		return TARGET.ENEMY3
	return TARGET.NONE

enum COMBAT_INPUT_TYPE {
	BASE,
	DIALOGUE,
	SELECTING_SKILL,
	SELECTING_ALLY,
	SELECTING_ENEMY,
	FINISHED
}

enum SKILLS {
	NONE = 0,
	BASIC_ATTACK,
	HEAL,
	MAKE_HAPPY,
}

func skill_to_str(skill: SKILLS) -> String:
	match skill:
		SKILLS.BASIC_ATTACK:
			return "Basic Attack"
		SKILLS.HEAL:
			return "Heal"
		SKILLS.MAKE_HAPPY:
			return "Make Happy"
	return "None"

## returns 0 if we need to target an enemy,
## returns 1 if we need to target an ally
## returns 2 if both are ok
func skill_selecting_type(skill: SKILLS) -> int:
	match skill:
		SKILLS.BASIC_ATTACK:
			return 0
		SKILLS.HEAL:
			return 1
		SKILLS.MAKE_HAPPY:
			return 2
	return 2
