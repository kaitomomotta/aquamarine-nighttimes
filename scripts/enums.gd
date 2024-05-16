extends Node

enum Characters {
	SUN = 0,
	METEOR = 1,
	MOON = 2,
	SATELLITE = 3
}

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
	ENEMY3
}

enum COMBAT_INPUT_TYPE {
	BASE,
	DIALOGUE,
	SELECTING_SKILL,
	SELECTING_ALLY,
	SELECTING_ENEMY
}
