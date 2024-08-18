extends RigidBody2D

@onready var screen_size = get_viewport().get_visible_rect().size

func _ready():
	pass # Replace with function body.
 
func _physics_process(delta): 
	if position.x + 10 > screen_size.x or position.x - 10 < 0:
		queue_free()
	
	if position.y + 10 > screen_size.y or position.y - 10 < 0:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("projectile"):
		$Collision.disabled = true
		$"Light Star".visible = true
		$Rock.visible = false
		freeze = true
			
		await get_tree().create_timer(0.2).timeout
		queue_free()
