extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var is_scoring = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_scoring:
		text = str(score).pad_zeros(5)


func _on_player_game_over():
	is_scoring = false

func _on_Timer2_timeout():
	if is_scoring:
		score += 1
