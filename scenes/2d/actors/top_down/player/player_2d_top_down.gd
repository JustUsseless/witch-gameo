extends Actor2DTopDown


func _physics_process(delta: float) -> void:
	var input := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).normalized()
	
	if can_accelerate:
		if input:
			velocity = velocity.move_toward(input * speed, acceleration * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	else:
		velocity = input * speed
	velocity = move_and_slide(velocity)
