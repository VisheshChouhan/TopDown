extends Node


const SAVE_PATH = "user://highscore.save"

func SaveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"HighScore": Game.HighScore,
		
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func LoadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			Game.HighScore = current_line["HighScore"]
			
			
			
