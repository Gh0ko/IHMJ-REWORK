extends CharacterState

@export var idle_state: StateMachineState = null
@export var pc_state: StateMachineState = null

# Called when the state machine enters this state.
func _enter_state() -> void:	
	character.velocity = Vector2.ZERO


# Called every frame when this state is active.
func _process(delta: float) -> void:
	pass


# Called when the state machine exits this state.
func _exit_state() -> void:
	pass
