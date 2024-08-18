extends CharacterBody2D

@onready var screen_size = get_viewport().get_visible_rect().size

@export var speed = 400  # Movement speed in pixels/sec
@export var rotation_speed = 1.5  # Rotation speed in radians/sec\
@export var projectile_scene: PackedScene

var shoot_cooldown = 0.5  # Cooldown duration in seconds
var time_since_last_shot = 0

func _process(delta):
	time_since_last_shot += delta
	
	print(time_since_last_shot)
	
	if Input.is_action_just_pressed("shoot") and time_since_last_shot >= shoot_cooldown:  # Ensure you have defined "shoot" in the Input Map
		shoot()
		time_since_last_shot = 0.0 

func _physics_process(delta):
	var move_input = Input.get_axis("up", "down")  # Get forward/backward input
	var rotation_direction = Input.get_axis("left", "right")  # Get rotation input	
	
	# Set the velocity based on the direction the character is facing
	velocity = transform.y * move_input * speed

	# Apply rotation based on the input
	rotation += rotation_direction * rotation_speed * delta

	# Move the character
	move_and_slide()
	clamp_position()
	
	if get_slide_collision_count() > 0:
		print("You're DEAD!")

func clamp_position():
	# Get the current position of the character
	var position = global_position

	# Clamp the x position
	position.x = clamp(position.x, 0, screen_size.x)

	# Clamp the y position
	position.y = clamp(position.y, 0, screen_size.y)

	# Update the global position
	global_position = position

func shoot():
	# Instance the projectile scene
	var projectile = projectile_scene.instantiate()
	var offset = Vector2(0, -50)
	$ShootSound.play()
	
	# Set the projectile's position to the player's position
	projectile.position = global_position + offset.rotated(rotation)
	
	# Set the projectile's rotation to match the player's rotation
	projectile.rotation = rotation
	
	# Add the projectile to the scene
	get_parent().add_child(projectile)
