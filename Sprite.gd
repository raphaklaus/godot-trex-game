extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pixel_frame = 0
var stop = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not stop:
		region_rect = Rect2(pixel_frame, 104, 640, 26)
		pixel_frame += Global.game_speed * delta


func _on_player_game_over():
	stop = true
