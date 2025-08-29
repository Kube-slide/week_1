extends Path2D
@onready var follow : PathFollow2D = $PathFollow2D

func _physics_process(delta: float) -> void:
	follow.progress += delta
	pass
