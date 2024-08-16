extends Node2D

@onready var screen_size = get_viewport().get_visible_rect().size
# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = Vector2(screen_size.x * 0.5, screen_size.y * 0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
