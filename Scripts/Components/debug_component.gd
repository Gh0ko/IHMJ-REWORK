extends Control

@export_custom(PROPERTY_HINT_ARRAY_TYPE,"Variables") var Labels : Array[String]
@onready var velocity: Label = $Velocity


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.text = "Velocity: " + str(get_parent().velocity)
