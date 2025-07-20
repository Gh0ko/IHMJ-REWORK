extends Window

func set_res(app : application) :
	var app_scene = await app.sceneToLoad.instantiate()
	add_child(app_scene)
