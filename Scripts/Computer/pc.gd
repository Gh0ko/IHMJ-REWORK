extends ColorRect

var RAM : float = 8.0

@export_group("Resources")
@export var apps : Array[application]

@export_group("Objects")
@export var APP_SHORT_CUT : PackedScene
@export var window_app : PackedScene
@export var taskbar_app : PackedScene

@export_group("Nodes")
@export var applications_node : Control
@export var taskbar_node: HBoxContainer
@export var shortcut_container: HFlowContainer


func _ready() -> void:
	# animaciones de prender el pc y mamadas
	load_desktop_apps()

func load_desktop_apps() -> void:
	for app in apps :
		var shortcut : Button = APP_SHORT_CUT.instantiate() 
		shortcut.setLabel(app.appName)
		shortcut.setIcon(app.icon)
		shortcut.button_down.connect(start_app.bind(app))
		shortcut_container.add_child(shortcut)

func start_app(app : application) :
	if !app.canOpen :
		return

	if !app.canStack and is_in_taskbar(app):
		open_app(app)
		return
	
	var window : Window = window_app.instantiate()
	window.set_res(app)
	window.title = app.appName
	
	window.name = app.appName
	window.close_requested.connect(window.hide)
	window.show()
	
	applications_node.add_child(window)
	
	app.windowNode = window
	
	add_to_taskbar(app, window)

func add_to_taskbar(app : application, window : Window) -> void :
	var taskIcon : TextureButton = taskbar_app.instantiate()
	taskIcon.texture_normal = app.icon
	taskIcon.button_down.connect(open_app.bind(app, window))
	taskbar_node.add_child(taskIcon)
	
func is_in_taskbar(app : application) -> bool:
	for x in applications_node.get_children() :
		if x.title == app.appName :
			return true
		continue
	return false

func open_app(app : application, window : Window = null) -> void:
	var win = window if window != null else app.windowNode
	
	if win.visible :
		win.grab_focus()
	else:
		win.show()
