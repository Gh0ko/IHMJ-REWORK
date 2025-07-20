extends Node2D
class_name Interactable

@export var interactable_area : Area2D
@export var sprite : Sprite2D

func _ready():
	assert(interactable_area, "Interactable Area not found")
	interactable_area.interact = _on_interact

func _on_interact():
	pass
