extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var game_speed
var game_score

# Called when the node enters the scene tree for the first time.
func _ready():
	start()

func start():
	game_score = 0
	game_speed = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
