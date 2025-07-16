extends AnimationTree

@export_node_path("CharacterBody2D","StaticBody2D","RigidBody2D") var character: NodePath = "../"
@onready var player = get_node(character)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with unction body.

func _physics_process(delta: float) -> void:
	var idle = !player.velocity
	
	if !idle:
		player.last_direction = player.velocity.normalized()
	
	set("parameters/Idle/blend_position", player.last_direction)
	set("parameters/Walking/blend_position", player.last_direction)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
