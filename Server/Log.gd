extends VBoxContainer

func append_to_log(in_text):
	var cur_label = Label.new()
	cur_label.text = in_text
	cur_label.align = ALIGN_CENTER
	add_child(cur_label)