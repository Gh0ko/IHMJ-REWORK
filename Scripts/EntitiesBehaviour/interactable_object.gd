extends Area2D

@export_group("Properties")
@export var interact_name : String = ""
@export var is_interactable : bool = true
@export var has_dialogue : bool = false
@export_group("Dialogue")
@export var dialogue_resource : DialogueResource
@export var dialogue_id : String = ""


var interact: Callable = func():
	pass
