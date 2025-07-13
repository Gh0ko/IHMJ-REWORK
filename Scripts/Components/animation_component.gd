extends AnimationTree

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export_node_path("CharacterBody2D","StaticBody2D","RigidBody2D") var _character: NodePath = "../"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
