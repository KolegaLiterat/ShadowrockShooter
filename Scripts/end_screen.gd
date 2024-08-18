extends Control

@onready var next_scene: PackedScene = preload("res://Scenes/main.tscn")
func _ready():
	$Score.text = str(Globals.Score)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_restart_pressed():
	Globals.IsPlayerAlive = true
	Globals.Score = 0
	get_tree().change_scene_to_packed(next_scene)
