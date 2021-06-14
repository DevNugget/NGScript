extends Control


var app_name = "Nugget Script"
var current_title = "Untitled"
var is_stream_paused = false


func _ready() -> void:
	update_window()
	$FileMenuButton.get_popup().add_item("Create New File")
	$FileMenuButton.get_popup().add_item("Import File")
	$FileMenuButton.get_popup().add_item("Save File")
	$FileMenuButton.get_popup().add_item("Save/Export File")
	$FileMenuButton.get_popup().add_item("Quit")
	
	var shortcut = ShortCut.new()
	var inputeventkey = InputEventKey.new()
	inputeventkey.set_scancode(KEY_Q)
	inputeventkey.control = true
	shortcut.set_shortcut(inputeventkey)
	
	$FileMenuButton.get_popup().set_item_shortcut(4, shortcut, true)
	
	var shortcut2 = ShortCut.new()
	var inputeventkey2 = InputEventKey.new()
	inputeventkey2.set_scancode(KEY_S)
	inputeventkey2.control = true
	shortcut2.set_shortcut(inputeventkey2)
	
	$FileMenuButton.get_popup().set_item_shortcut(2, shortcut2, true)
	
	var shortcut3 = ShortCut.new()
	var inputeventkey3 = InputEventKey.new()
	inputeventkey3.set_scancode(KEY_A)
	inputeventkey3.control = true
	shortcut3.set_shortcut(inputeventkey3)
	
	$FileMenuButton.get_popup().set_item_shortcut(3, shortcut3, true)
	
	var shortcut4 = ShortCut.new()
	var inputeventkey4 = InputEventKey.new()
	inputeventkey4.set_scancode(KEY_E)
	inputeventkey4.control = true
	shortcut4.set_shortcut(inputeventkey4)
	
	$FileMenuButton.get_popup().set_item_shortcut(1, shortcut4, true)
	
	var shortcut5 = ShortCut.new()
	var inputeventkey5 = InputEventKey.new()
	inputeventkey5.set_scancode(KEY_N)
	inputeventkey5.control = true
	shortcut5.set_shortcut(inputeventkey5)
	
	$FileMenuButton.get_popup().set_item_shortcut(0, shortcut5, true)
	
	
	$FileMenuButton.get_popup().connect("id_pressed", self, "_on_item_pressed")
	
	$About.get_popup().add_item("Editor Info")
	$About.get_popup().connect("id_pressed", self, "_on_item_about_pressed")


func new_file():
	current_title = "Untitled"
	update_window()
	$TextEdit.text = ""


func update_window():
	OS.set_window_title("Nugget Script" + " - " + current_title)


func _on_item_pressed(id):
	var item_name = $FileMenuButton.get_popup().get_item_text(id)
	if item_name == "Import File":
		$FileDialog.popup()
	elif item_name == "Save File":
		save_file()
	elif item_name == "Create New File":
		new_file()
	elif item_name == "Save/Export File":
		$SaveFileButton.popup()
	elif item_name == "Quit":
		get_tree().quit()


func _on_item_about_pressed(id):
	var item_name = $About.get_popup().get_item_text(id)
	if item_name == "Editor Info":
		$AboutWindow.popup()


func _on_FileDialog_file_selected(path: String) -> void:
	print(path)
	var file = File.new()
	file.open(path, 1)
	$TextEdit.text = file.get_as_text()
	file.close()
	current_title = path
	update_window()


func _on_SaveFileButton_file_selected(path: String) -> void:
	var file = File.new()
	file.open(path, 2)
	file.store_string($TextEdit.text)
	file.close()
	current_title = path
	update_window()


func save_file():
	var path = current_title
	if path == "Untitled":
		$SaveFileButton.popup()
	else:
		var file = File.new()
		file.open(path, 2)
		file.store_string($TextEdit.text)
		file.close()
		update_window()



func _on_Button_pressed() -> void:
	if is_stream_paused == false:
		$AudioStreamPlayer.play()
	$AudioStreamPlayer.stream_paused = false
	


func _on_Button2_pressed() -> void:
	$AudioStreamPlayer.stream_paused = true
	is_stream_paused = true
