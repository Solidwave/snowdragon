extends Node

class_name StateMachine

@export var initialState : State

var states : Dictionary = {}

var currentState : 	State

func _ready():
	print(get_children())
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transitioned)
	if initialState:
		initialState.Enter()
		currentState = initialState

func _process(delta):
	print(currentState.name)
	if currentState:
		currentState.Update(delta)

func _physics_process(delta):
	if currentState:
		currentState.PhysicsUpdate(delta)

func on_child_transitioned(state: State, newStateName: String):
	if state != currentState:
		return
	var newState = states.get(newStateName.to_lower())
	
	if currentState:
		currentState.Exit()
	
	newState.Enter()
	
	currentState = newState
