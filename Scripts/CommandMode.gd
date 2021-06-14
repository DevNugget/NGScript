extends Control

onready var textedit = $TextEdit

func _input(event):
	if event is InputEventKey and event.as_text() == "Enter" and event.pressed and textedit.text.ends_with(":"):
		yield(get_tree(),"idle_frame")
		textedit.text+="\t"
		textedit.cursor_set_line(textedit.get_line_count()-1)
		textedit.cursor_set_column(textedit.get_line(textedit.get_line_count()-1).length())
