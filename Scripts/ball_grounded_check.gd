extends RigidBody2D
@export var spawnLoc : Node2D
@onready var deathTimer : Timer = $DeathTimer
@export var worldMap : Node2D
@onready var floorColCheck = $ShapeCast2D
var deathFlag : bool = false

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("reset"):
		ResetPos()

func _physics_process(delta: float) -> void:
	if floorColCheck.collision_result != []:
		Engine.time_scale = 0.01
		print(floorColCheck.collision_result[0].point.y - position.y)
		global_position = global_position + Vector2(0, (floorColCheck.collision_result[0].normal.y * 2))
	else:
		Engine.time_scale = 1

func _on_body_entered(body: Node) -> void:
	if body.collision_layer == 2 && !deathFlag:
		deathFlag = true
		linear_velocity = Vector2.ZERO
		angular_velocity = 0
		visible = false
		set_deferred("freeze", true)
		deathTimer.start()
		worldMap.rotationEnabled = false

func ResetPos() -> void:
	position = spawnLoc.global_position
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	visible = true
	set_deferred("freeze", false)
	deathFlag = false
	worldMap.ResetRotation()
	worldMap.rotationEnabled = true


func _on_death_timer_timeout() -> void:
	ResetPos()
