extends Node

func get_sun() -> Character:
	return $Characters/Sun

func get_meteor() -> Character:
	return $Characters/Meteor

func get_moon() -> Character:
	return $Characters/Moon

func get_satellite() -> Character:
	return $Characters/Satellite

func get_character(c) -> Character:
	if c == Enums.Characters.SUN:
		return get_sun()
	if c == Enums.Characters.METEOR:
		return get_meteor()
	if c == Enums.Characters.MOON:
		return get_moon()
	if c == Enums.Characters.SATELLITE:
		return get_satellite()
	return null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

