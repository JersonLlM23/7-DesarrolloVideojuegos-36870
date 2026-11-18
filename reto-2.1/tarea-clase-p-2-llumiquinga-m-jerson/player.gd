extends CharacterBody2D
@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("move_left", "move_right")
	#var direction_y := Input.get_axis("move_up", "move_down")
	velocity.x = direction_x * speed
	#velocity.y = direction_y * speed

	move_and_slide()
