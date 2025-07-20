extends Control

@export_node_path("CharacterBody2D","RigidBody2D", "StaticBody2D") var _character : NodePath
@export_flags("Velocity","Direction","Position","Rotation","Scale","State") var Debug = 0
@onready var character = get_node(_character)
@onready var label: Label = $DebugLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_debug_label()

func update_debug_label() -> void:
	var debug_text := ""
	#110011
	
	#000001
	if Debug & 1:
		debug_text += "Velocity: %s\n" % str(character.velocity) # Supón que tienes esta variable
	#000010
	if Debug & 2 and character is not CharacterBody2D:
		debug_text += "Direction: %s\n" % str(character.direction)
	#000100
	if Debug & 4:
		debug_text += "Position: %s\n" % str(character.global_position)
	#001000
	if Debug & 8:
		debug_text += "Rotation: %s\n" % str(character.rotation_degrees)
	#010000
	if Debug & 16:
		debug_text += "Scale: %s\n" % str(character.scale)
	#100000
	if Debug & 32 :
		debug_text += "State: %s\n" % str(character.state) # Supón que tienes un estado definido

	label.text = debug_text
