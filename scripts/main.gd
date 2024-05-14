extends Node

enum Characters {
	SUN,
	METEOR,
	MOON,
	SATELLITE
}

func get_sun() -> Character:
	return $Characters/Sun

func get_meteor() -> Character:
	return $Characters/Meteor

func get_moon() -> Character:
	return $Characters/Moon

func get_satellite() -> Character:
	return $Characters/Satellite

func get_character(c) -> Character:
	if c == Characters.SUN:
		return get_sun()
	if c == Characters.METEOR:
		return get_meteor()
	if c == Characters.MOON:
		return get_moon()
	if c == Characters.SATELLITE:
		return get_satellite()
	return null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

