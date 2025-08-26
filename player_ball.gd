extends CharacterBody2D

@export var gravitySpeed : float = 3.0
@export var basicRotationSpeed : float = 2.0
@onready var groundRay : RayCast2D = $"Ground detect"
var fallSpeed : float = 0
var moveDir : float = 0


func _physics_process(delta: float) -> void:
	if groundRay.is_colliding():
		print(fallSpeed)
		if abs(fallSpeed) > 5:
			velocity.y = snappedf(-fallSpeed, 1)
		fallSpeed = 0
	else:
		fallSpeed += gravitySpeed * delta
	var basicGravity : Vector2 = transform.y * (fallSpeed) #Basic gravity pre-turning
	moveDir = lerpf(moveDir, (Input.get_action_strength("Rotate_left") - Input.get_action_strength("Rotate_right")) * basicRotationSpeed, 2.5 * delta)
	rotate(moveDir)
	if !groundRay.is_colliding():
		velocity += basicGravity
	move_and_slide()
