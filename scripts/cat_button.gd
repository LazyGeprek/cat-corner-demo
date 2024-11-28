extends StaticBody2D

var cat_scratcher = false
@onready var click_sound = $ClickSound
@onready var autoclick_sound = $AutoClickSound

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			cat_button_clicked()
			print("works")

func addScore():
	get_parent().current_score += get_parent().auto_click

func cat_button_clicked():
	get_parent().load_new_score()
	click_sound.play()


func _on_timer_timeout():
	addScore()
	autoclick_sound.play()
	get_parent().load_new_score()

func _on_cat_scratcher_pressed():
	$"../Timer".start()
	$"../CatScratcher".disabled = true
	$"../CatScratcher".hide()
	$"../CatScratcherUp".disabled = false
	$"../CatScratcherUp".show()

func _on_cat_scratcher_up_pressed():
	get_parent().auto_click *= 2
	$"../CatScratcherUp".disabled = true
	$"../CatScratcherUp".hide()
