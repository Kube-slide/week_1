extends Node2D
@export var rotateStrength : float = 1
var playerInputs : float = 0
@export var rotateSmoothing : float = 2

func _physics_process(delta):
	playerInputs = lerpf(playerInputs, Input.get_action_strength("Rotate_right") - Input.get_action_strength("Rotate_left"), delta * rotateSmoothing)
	rotate(deg_to_rad(playerInputs) * rotateStrength) 
