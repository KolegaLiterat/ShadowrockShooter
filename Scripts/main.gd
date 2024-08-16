extends Node2D

@onready var screen_size = get_viewport().get_visible_rect().size
@onready var asteroid_scene = preload("res://Scenes/asteroid.tscn") 

@export var spawn_time = 1.0  # Time in seconds before first spawn
@export var force = 100.0  # Force applied to spawned object

var rng = RandomNumberGenerator.new()

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
	
	asteroid.position = Vector2(generate_random_position(0, screen_size.x),
								generate_random_position(0, screen_size.y))
	
	$Spawner.add_child(asteroid)
	
	asteroid.add_constant_force(
		Vector2(
			generate_random_force(0, 20), 
			generate_random_force(0, 20)), 
		Vector2(
			generate_random_force(0, 50), 
			generate_random_force(0, 50))
		)

func generate_random_position(min: int, max: int):
	return rng.randi_range(min, max)

func generate_random_force(min: float, max: float):
	return rng.randf_range(min, max)
	
