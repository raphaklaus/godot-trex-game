extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var stop = false

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.x = 1000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print_debug(global_position)
	if (global_position.x < -300):
		global_position.x = 700
	
	if not stop:
		position.x -= 50 * delta


func _on_player_game_over():
	print_debug("here")
	stop = true
