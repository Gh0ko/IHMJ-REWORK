extends TextureRect

@export var dim : float = 0.5

func _ready() -> void:
	modulate = Color(1,1,1,dim)
	
func _set(property: StringName, value: Variant) -> bool:
	print("kjsdasd")
	if property == &"dim" :
		dim = value
		modulate = Color(1,1,1,dim)
		return true
	return false
