extends RigidBody2D
@export var spawnLoc : Node2D
@onready var deathTimer : Timer = $DeathTimer
@export var worldMap : Node2D
@onready var floorColCheck = $ShapeCast2D
var deathFlag : bool = false

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("reset"):
		_on_spike_body_entered(null)

#func _physics_process(delta: float) -> void:
	#if floorColCheck.collision_result != []:
		#Engine.time_scale = 0.01
		#print(floorColCheck.collision_result[0].point.y - position.y)
		#global_position = global_position + Vector2(0, (floorColCheck.collision_result[0].normal.y * 2))
	#else:
		#Engine.time_scale = 1


func ResetPos() -> void:
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	visible = true
	set_deferred("freeze", false)
	deathFlag = false
	worldMap.resetRot = true
	worldMap.rotationEnabled = true
	global_position = spawnLoc.global_position
	


func _on_death_timer_timeout() -> void:
	ResetPos()


func _on_spike_body_entered(body: Node2D) -> void:
	if !deathFlag:
		deathFlag = true
		linear_velocity = Vector2.ZERO
		angular_velocity = 0
		visible = false
		set_deferred("freeze", true)
		deathTimer.start()
		worldMap.rotationEnabled = false


func _on_star_collectible_area_entered(area: Area2D) -> void:
	print("aaa")
