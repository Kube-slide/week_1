extends RigidBody2D
@export var spawnLoc : Node2D
@onready var deathTimer : Timer = $DeathTimer
@export var worldMap : Node2D
var deathFlag : bool = false

func _on_body_entered(body: Node) -> void:
	if body.collision_layer == 2 && !deathFlag:
		deathFlag = true
		linear_velocity = Vector2.ZERO
		angular_velocity = 0
		visible = !visible
		set_deferred("freeze", true)
		deathTimer.start()
		worldMap.rotationEnabled = false

func ResetPos() -> void:
	position = spawnLoc.global_position
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	visible = !visible
	set_deferred("freeze", false)
	deathFlag = false
	worldMap.ResetRotation()
	worldMap.rotationEnabled = true


func _on_death_timer_timeout() -> void:
	ResetPos()
