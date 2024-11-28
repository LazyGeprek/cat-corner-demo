extends Node

var score_label : Label
var current_score = 0
var auto_click = 1

func _ready():
	score_label = $Score
	score_label.text = str(current_score)
	$BGM.play()

func load_new_score():
	current_score += 1 
	score_label.text = str(current_score)

func _on_save_pressed():
	var main = self
	var scene = PackedScene.new()
	scene.pack(main)
	ResourceSaver.save(scene, "res://saves/save_game.tscn")
	print("saved")

func _on_load_pressed():
	if !FileAccess.file_exists("res://saves/save_game.tscn"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	else:
		var new_scene = ResourceLoader.load("res://saves/save_game.tscn", "", 0).instantiate()
		get_tree().get_root().add_child(new_scene)
		queue_free()
