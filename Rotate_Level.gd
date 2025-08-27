extends Node2D
@export var rotateStrength : float = 1
var playerInputs : float = 0
@export var rotateSmoothing : float = 2

func _physics_process(delta):
	if Input.get_accelerometer() == Vector3.ZERO:
		playerInputs = lerpf(playerInputs, Input.get_action_strength("Rotate_right") - Input.get_action_strength("Rotate_left"), delta * rotateSmoothing)
	else:
		playerInputs = lerpf(playerInputs, clamp(round(Input.get_accelerometer().x / 2), -1, 1), rotateSmoothing * delta)
		print("Rotation speed: " + str(playerInputs) + " | Device sensor: " + str(Input.get_accelerometer().length()))
	rotate(deg_to_rad(playerInputs) * rotateStrength) 
