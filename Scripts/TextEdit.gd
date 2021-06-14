extends TextEdit

func _ready() -> void:
	# Color scheme
	add_color_region('"', '"', Color(1, 0.862305, 0.449219))
	add_color_region("'", "'", Color(1, 0.862305, 0.449219))
	add_color_region("#", "", Color(0.355469, 0.355469, 0.355469, true))
	add_color_region("$", ".", Color(0.323532, 0.910156, 0.401442, true))
	add_keyword_color("func", Color(1, 0.679688, 0.679688))
	add_keyword_color("print", Color(0.824219, 0.202835, 0.319345))
	add_keyword_color('(', Color(0.577316, 0.909985, 0.917969))
	add_keyword_color(')', Color(0.577316, 0.909985, 0.917969))
	add_keyword_color("var", Color(0.93793, 0.496445, 0.941406))
	add_keyword_color("extends", Color(0.735428, 0.31517, 0.996094))
	add_keyword_color("if", Color(0.447815, 0.351563, 1))
	add_keyword_color("else", Color(0.447815, 0.351563, 1))
	add_keyword_color("elif", Color(0.447815, 0.351563, 1))
	add_keyword_color("match", Color(0.447815, 0.351563, 1))
	add_keyword_color("for", Color(0.812561, 0.351563, 1))
	add_keyword_color("do", Color(0.812561, 0.351563, 1))
	add_keyword_color("case", Color(0.812561, 0.351563, 1))
	add_keyword_color("switch", Color(0.812561, 0.351563, 1))
	add_keyword_color("break", Color(0.812561, 0.351563, 1))
	add_keyword_color("continue", Color(0.812561, 0.351563, 1))
	add_keyword_color("pass", Color(0.93793, 0.496445, 0.941406))
	add_keyword_color("return", Color(0.93793, 0.496445, 0.941406))
	add_keyword_color("class", Color(1, 0.679688, 0.679688))
	add_keyword_color("class_name", Color(1, 0.679688, 0.679688))
	add_keyword_color("is", Color(1, 0.679688, 0.679688))
	add_keyword_color("self", Color(0.447815, 0.351563, 1))
	add_keyword_color("tool", Color(1, 0.679688, 0.679688))
	add_keyword_color("signal", Color(1, 0.679688, 0.679688))
	add_keyword_color("static", Color(0.285568, 0.769531, 0.633417))
	add_keyword_color("const", Color(0.93793, 0.496445, 0.941406))
	add_keyword_color("enum", Color(0.93793, 0.496445, 0.941406))
	add_keyword_color("onready", Color(0.93793, 0.496445, 0.941406))
	add_keyword_color("export", Color(0.93793, 0.496445, 0.941406))
	add_keyword_color("preload", Color(0.93793, 0.496445, 0.941406))
	add_keyword_color("breakpoint", Color(0.93793, 0.496445, 0.941406))
	add_keyword_color("yield", Color(0.93793, 0.496445, 0.941406))
	
	var c_sharp = ["abstract", "as", "base", "bool", "byte", "catch", "char", "checked", "continue", "decimal", "default", "delegate", "double"]
	for a in c_sharp:
		add_keyword_color(a, Color(0.824219, 0.202835, 0.319345))
	var c_sharp_2 = ["event", "explicit", "extern", "false", "finally", "fixed", "float", "for", "foreach", "goto", "implicit", "in", "int", "interface", "internal", "lock", "long"]
	for a in c_sharp_2:
		add_keyword_color(a, Color(0.447815, 0.351563, 1))
	var c_sharp_3 = [
		"namespace",
		"new",
		"null",
		"object",
		"operator",
		'out',
		'override',
		'params',
		'private',
		'protected',
		'public',
		'readonly',
		'ref',
		'sbyte',
		'sealed',
		'short',
		'sizeof',
		'stackalloc',
		'string',
		'struct',
		'switch',
		'this',
		'throw',
		'true',
		'try',
		'typeof',
		'uint',
		'ulong',
		'unchecked',
		'unsafe',
		'ushort',
		'using',
		'virtual',
		'void',
		'volatile',
		'while',
	]
	for a in c_sharp_3:
		add_keyword_color(a, Color(0.812561, 0.351563, 1))
	var c_sharp_4 = [
		'add',
		'and',
		'alias',
		'ascending',
		'async',
		'await',
		'by',
		'descending',
		'dynamic',
		'equals',
		'from',
		'get',
		'global',
		'group',
		'init',
		'into',
		'join',
		'let',
		'nameof',
		'nint',
		'not',
		'notnull',
		'nuint',
		'on',
		'or',
		'orderby',
		'record',
		'remove',
		'select',
		'set',
		'managed',
		'partial',
		'unmanaged',
		'when',
		'where',
		'with',
	]
	for a in c_sharp_4:
		add_keyword_color(a, Color(0.447815, 0.351563, 1))


onready var textedit = $"."

func _input(event):
	if event is InputEventKey and event.as_text() == "Enter" and event.pressed and textedit.text.ends_with(":"):
		yield(get_tree(),"idle_frame")
		textedit.text+="\t"
		textedit.cursor_set_line(textedit.get_line_count()-1)
		textedit.cursor_set_column(textedit.get_line(textedit.get_line_count()-1).length())
