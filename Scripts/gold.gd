extends RigidBody2D

var can_be_aquired = false

@onready var screen_size = get_viewport().get_visible_rect().size
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if position.x + 10 > screen_size.x or position.x - 10 < 0:
		if $"Gold Catch".playing == false:
			queue_free()
	
	if position.y + 10 > screen_size.y or position.y - 10 < 0:
		if $"Gold Catch".playing == false:
			queue_free()

func _on_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		
		if can_be_aquired == false:
			Globals.Score += 1
			$"Gold Catch".play()
		
		visible = false
		$Collision.disabled = true
		
		
func _on_gold_catch_finished():
	queue_free()
