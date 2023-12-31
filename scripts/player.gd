extends CharacterBody2D

@export 
var speed: int = 105

@onready
var animations = $AnimationPlayer

func handle_input():
	var move_direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = move_direction*speed
	
func update_animation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction: String = "down"
		
		if velocity.x < 0 and abs(velocity.x) > abs(velocity.y):
			direction = "left"
		if velocity.x > 0 and abs(velocity.x) > abs(velocity.y):
			direction = "right"
		if velocity.y < 0:
			direction = "up"
			
		animations.play("walk_" + direction)

func _physics_process(delta):
	handle_input()
	move_and_slide()
	update_animation()
