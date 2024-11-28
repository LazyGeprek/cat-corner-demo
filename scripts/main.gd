extends Node

var score_label : Label

func _ready():
	score_label = $Score
	score_label.text = str($CatButton.current_score)
	$BGM.play()

func load_new_score():
	score_label.text = str($CatButton.current_score)
