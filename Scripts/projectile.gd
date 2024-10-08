extends RigidBody2D

@export var speed = 600  # Speed of the projectile
@export var lifetime = 2.0  # Time before the projectile is removed

func _ready():
	# Set a timer to queue free after the lifetime
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	# Move the projectile forward
	position += transform.y * speed * delta * -1

func _on_body_entered(body: Node2D):
	if body.is_in_group("asteroid"):
		queue_free()
