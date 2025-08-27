extends CharacterBody2D

@export var gravity : float = -9

func _physics_process(delta: float) -> void:
	if(is_on_floor()):
		velocity.y = -1
	else:
		velocity.y -= gravity * delta
	print(get_floor_angle())
	move_and_slide()
