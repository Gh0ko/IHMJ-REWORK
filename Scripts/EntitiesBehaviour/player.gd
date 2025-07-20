extends CharacterBody2D

@export var state_machine : StateMachine

@onready var state = state_machine.current_state.name

var last_direction := Vector2.DOWN
signal animationChange
