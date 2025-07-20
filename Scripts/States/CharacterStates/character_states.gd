class_name CharacterState
extends StateMachineState

@export_node_path("CharacterBody2D") var _character: NodePath = "../.."
@export var animation_tree : AnimationTree
@onready var character: CharacterBody2D = get_node(_character)
