extends CharacterBody2D

@export var speed = 400  # Movement speed in pixels/sec
@export var rotation_speed = 1.5  # Rotation speed in radians/sec
@onready var screen_size = get_viewport().get_visible_rect().size

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

func clamp_position():
	# Get the current position of the character
	var position = global_position

	# Clamp the x position
	position.x = clamp(position.x, 0, screen_size.x)

	# Clamp the y position
	position.y = clamp(position.y, 0, screen_size.y)

	# Update the global position
	global_position = position
