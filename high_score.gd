extends Label

var show_high_score = false

func _ready():
	visible = false
	create_save()
	print_debug(OS.get_user_data_dir())

func _on_player_game_over():
	visible = true
	var current_high_score = load_data()
	if Global.game_score > current_high_score:
		save_data(Global.game_score)

	text = "HIGH SCORE: " + str(load_data()).pad_zeros(5)
	
#func check_score(score):
#	#

func create_save():
	var score = File.new()
	if not score.file_exists("user://score.save"):
		score.open("user://score.save", File.WRITE)
		score.store_line("0")
		score.close()

func save_data(new_score):
	var score_file = File.new()
	score_file.open("user://score.save", File.WRITE)
	score_file.store_line(str(new_score))
	score_file.close()

func load_data():
	var score_file = File.new()
	score_file.open("user://score.save", File.READ)
	
	return int(score_file.get_line())
