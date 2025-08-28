extends RigidBody2D
@export var spawnLoc : Node2D
@export var worldMap : Node2D
@export var levelManager : Node2D

@onready var deathTimer : Timer = $DeathTimer
var deathFlag : bool = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("reset"):
		_on_spike_body_entered(null)


func ResetPos() -> void:
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	visible = true
	set_deferred("freeze", false)
	deathFlag = false
	worldMap.resetRot = true
	worldMap.rotationEnabled = true
	global_position = spawnLoc.global_position
	levelManager.ClearStars()
	levelManager.InstantiateStars()


func _on_death_timer_timeout() -> void:
	ResetPos()

func _on_spike_body_entered(_body: Node2D) -> void:
	if !deathFlag:
		deathFlag = true
		linear_velocity = Vector2.ZERO
		angular_velocity = 0
		visible = false
		set_deferred("freeze", true)
		deathTimer.start()
		worldMap.rotationEnabled = false
