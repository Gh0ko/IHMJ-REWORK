extends ColorRect

var RAM : float = 8.0

@export_category("Applicaciones")
@export var apps : Array[application]

@export_group("Objetos")
@export var APP_SHORT_CUT : PackedScene
@export var AppWindow : PackedScene
@export var taskApp : PackedScene

@export_group("Nodos")
@export var ApplicationsNode : Control
@export var applist: HFlowContainer
@export var taskbar : HBoxContainer

var openedApps : Dictionary

func _ready() -> void:
	# animaciones de prender el pc y mamadas
	load_desktop_apps()

func load_desktop_apps() -> void:
	for app in apps :
		var shortcut : Button = APP_SHORT_CUT.instantiate() 
		shortcut.setLabel(app.appName)
		shortcut.setIcon(app.icon)
		shortcut.button_down.connect(startApp.bind(app))
		applist.add_child(shortcut)

func startApp(app : application) :
	if !app.canOpen :
		return
	
	if !app.canStack and isInTaskBar(app):
		openApp(app)
		return
	
	var window : Window = AppWindow.instantiate()
	window.setRes(app)
	window.title = app.appName
	
	window.name = app.appName
	window.close_requested.connect(window.hide)
	window.show()
	
	ApplicationsNode.add_child(window)
	
	app.windowNode = window
	
	addToTaskBar(app)

func addToTaskBar(app : application) -> void :
	var taskIcon : TextureButton = taskApp.instantiate()
	taskIcon.texture_normal = app.icon
	taskIcon.button_down.connect(openApp.bind(app))
	taskbar.add_child(taskIcon)
	
func isInTaskBar(app : application) -> bool:
	for x in ApplicationsNode.get_children() :
		if x.resource.appName == app.appName :
			return true
		continue
	return false

func openApp(app : application) :
	if app.windowNode.visible :
		app.windowNode.grab_focus()
	else :
		app.windowNode.show()
		
