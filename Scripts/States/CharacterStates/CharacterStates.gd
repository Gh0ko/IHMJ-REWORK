class_name CharacterState
extends StateMachineState

@export_node_path("CharacterBody2D") var _character: NodePath = "../.."
@onready var character: CharacterBody2D = get_node(_character)
