extends Window

func setApp(scene : PackedScene) :
	var app = await scene.instantiate()
	add_child(app)
