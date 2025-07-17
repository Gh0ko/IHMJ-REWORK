extends Window
class_name  applicationWindow


var resource : application

func setRes(res : application) :
	resource = res
	var app = await resource.sceneToLoad.instantiate()
	add_child(app)
