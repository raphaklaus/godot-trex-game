extends Node2D

var cactus = preload("res://cactus.tscn")
var cactus_instance
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cactuses = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
export var spawn = true
# Called every frame. 'delta' is the elapsed time since the previous frame.

#func _physics_process(delta):
#	print_debug(cactuses)

func _on_destroy_timer_timeout():
	for cactus in cactuses:
		var width = cactus.get_node("Sprite").region_rect.size.x
		if cactus.get_global_position().x < -width:
			cactus.queue_free()
			cactuses.erase(cactus)



func _on_player_game_over():
	spawn = false
	for cactus in cactuses:
		cactus.stop()

func _on_spawn_timer_timeout():
	if spawn:
		if randf() > 0.5:
			cactus_instance = cactus.instance()
			cactus_instance.init(Vector2(900, 65), "big")
			cactuses.append(cactus_instance)
			add_child(cactus_instance)
