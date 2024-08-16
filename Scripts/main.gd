extends Node2D

@onready var screen_size = get_viewport().get_visible_rect().size
@onready var asteroid_scene = preload("res://Scenes/asteroid.tscn") 

@export var spawn_time = 5.0  # Time in seconds before first spawn
@export var force = 100.0  # Force applied to spawned object

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = Vector2(screen_size.x * 0.5, screen_size.y * 0.5)
	$Spawner/SpawnTimer.wait_time = spawn_time
	$Spawner/SpawnTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var asteroid: RigidBody2D = asteroid_scene.instantiate()
	asteroid.position = Vector2(100, 100)
	add_child(asteroid)
	asteroid.add_constant_force(Vector2(10, 2), Vector2(50, 20))
