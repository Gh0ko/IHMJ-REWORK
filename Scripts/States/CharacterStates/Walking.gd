extends CharacterState

@export_custom(PROPERTY_HINT_NONE, "suffix:px/s") var speed: float = 200.0
@export_custom(PROPERTY_HINT_NONE, "suffix:px/s²") var acceleration: float = 2000.0

# Called when the state machine enters this state.
func _enter_state() -> void:
	pass

# Called every frame when this state is active.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	character.velocity = direction * speed
	if direction == Vector2.ZERO:
		get_state_machine().current_state = get_state_machine().States["Idle"]
	
func _physics_process(delta: float) -> void:
	character.move_and_slide()

# Called when the state machine exits this state.
func _exit_state() -> void:
	pass
