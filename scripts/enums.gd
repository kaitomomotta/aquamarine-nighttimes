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
	HAPPY_THOUGHTS,
	COMBO_ING,
	ENLIGHTMENT,
	RUNAWAY,
	SAD_SONG,
	CHILL_OUT,
	SEDUCTION,
	SCARY_LOOK,
	MINOR_INCONVENIENCE,
	ONE_TWO_SWEEP,
	RAMPAGE,
	FOCUS,
	PARACETAMOL,
	PILL_BOMB,
	THERAPY,
	CRASH_CART,
}

func skill_to_str(skill: SKILLS) -> String:
	match skill:
		SKILLS.BASIC_ATTACK:
			return "BASIC ATTACK"
		SKILLS.HEAL:
			return "HEAL"
		SKILLS.HAPPY_THOUGHTS:
			return "HAPPY THOUGHTS"
		SKILLS.COMBO_ING:
			return "COMBO-ING"
		SKILLS.ENLIGHTMENT:
			return "ENLIGHTMENT"
		SKILLS.RUNAWAY:
			return "RUN-AWAY"
		SKILLS.SAD_SONG:
			return "SAD SONG"
		SKILLS.CHILL_OUT:
			return "CHILL OUT"
		SKILLS.SEDUCTION:
			return "SEDUCTION"
		SKILLS.SCARY_LOOK:
			return "SCARY LOOK"
		SKILLS.MINOR_INCONVENIENCE:
			return "MINOR INCONVENIENCE"
		SKILLS.ONE_TWO_SWEEP:
			return "ONE-TWO SWEEP"
		SKILLS.RAMPAGE:
			return "RAMPAGE"
		SKILLS.FOCUS:
			return "FOCUS"
		SKILLS.PARACETAMOL:
			return "PARACETAMOL"
		SKILLS.PILL_BOMB:
			return "PILL BOMB"
		SKILLS.THERAPY:
			return "THERAPY"
		SKILLS.CRASH_CART:
			return "CRASH CART"
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
	return 2
