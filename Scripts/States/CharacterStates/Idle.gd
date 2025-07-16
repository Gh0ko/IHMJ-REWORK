class_name Idle
extends CharacterState

# Called when the state machine enters this state.
func _enter_state() -> void:
	character.velocity = Vector2.ZERO


# Called every frame when this state is active.
func _process(delta: float) -> void:
	#Idle Sprite/Animation probably
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.get_vector("left","right","up","down"):
		get_state_machine().current_state = StateMachine.States["Walking"]
	
func _physics_process(_delta: float) -> void:
	pass

# Called when the state machine exits this state.
func _exit_state() -> void:
	pass
