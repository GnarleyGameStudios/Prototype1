extends CharacterBody2D


# Declare member variables here. Examples:
var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func read_input():
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		direction = Vector2(0,-1)
		
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		direction = Vector2(0,1)
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		direction = Vector2(-1,0)
		
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		direction = Vector2(1,0)

	velocity = velocity.normalized()
	
func _physics_process(delta):
	read_input()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
