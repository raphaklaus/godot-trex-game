extends Node2D

var cactus = preload("res://cactus.tscn")
var cactus_instance

var enemy = preload("res://enemy.tscn")
var enemy_instance

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cactuses = []
var enemies = []

var next_to_spawn = "cactus"
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
			
	for enemy in enemies:
		var width = enemy.get_node("Sprite").region_rect.size.x
		if enemy.get_global_position().x < -width:
			enemy.queue_free()
			enemies.erase(enemy)

func _on_player_game_over():
	spawn = false
	for cactus in cactuses:
		cactus.stop()
	
	# TODO: Unify this loop
	for enemy in enemies:
		enemy.stop()

func _on_spawn_timer_timeout():
	if spawn and randf() > 0.6:
		if next_to_spawn == "cactus":
			generate_cactus()
		else:
			generate_enemy()
		
		next_to_spawn = select_next()

func generate_starting_position():
	if randf() < 0.4:
		return 25
	elif randf() < 0.6:
		return -15
	else:
		return -10
		
func generate_cactus():
	cactus_instance = cactus.instance()
	cactus_instance.init(Vector2(900, 65), "big")
	cactuses.append(cactus_instance)
	add_child(cactus_instance)

func generate_enemy():
	enemy_instance = enemy.instance()
	enemy_instance.init(generate_starting_position())
	enemies.append(enemy_instance)
	add_child(enemy_instance)
	
func select_next():
	if randf() > 0.5:
		return "cactus"
	else:
		return "enemy"
