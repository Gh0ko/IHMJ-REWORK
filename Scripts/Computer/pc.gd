extends ColorRect

"""
aqui la lista de aplicaciones disponibles en la pc
y no existentes por si queremos integrar la posibilidad de instalar aplicaciones
"""
@export var APP_SHORT_CUT : PackedScene

@export var apps : Array[application]
@export var ApplicationsNode : Control
@export var applist: HFlowContainer
@export var AppWindow : PackedScene

func _ready() -> void:
	# animaciones de prender el pc y mamadas
	load_desktop_apps()

func load_desktop_apps() -> void:
	for app in apps :
		var shortcut : Button = APP_SHORT_CUT.instantiate() 
		shortcut.setLabel(app.appName)
		shortcut.button_down.connect(startApp.bind(app))
		applist.add_child(shortcut)

func startApp(app : application) :
	var window : Window = AppWindow.instantiate()
	window.setApp(app.sceneToLoad)
	window.title = app.appName
	window.show()
	ApplicationsNode.add_child(window)
