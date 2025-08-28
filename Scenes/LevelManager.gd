extends Node2D

@export var starSpawnPositions : Array[Vector2]
var starCollection : Array
var starObj = preload("res://Scenes/StarCollectible.tscn")

func _ready() -> void:
	InstantiateStars()
	print(starCollection[0].position)

func ClearStars() -> void:
	for star in starCollection:
		if is_instance_valid(star):
			print("Cleared star " + str(star))
			star.queue_free()

func InstantiateStars() -> void:
	for i in range(starSpawnPositions.size()):
		var obj = starObj.instantiate()
		add_child(obj)
		obj.position = starSpawnPositions[i]
		obj.name = "Star" + str(i)
		starCollection.push_back(obj)
		print("created star")
