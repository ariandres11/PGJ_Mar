extends Control

var audio_player_1: AudioStreamPlayer
var audio_player_2: AudioStreamPlayer
var timer: Timer
var timer_2: Timer

func _ready():
	audio_player_1 = $AudioStreamPlayer
	audio_player_2 = $AudioStreamPlayer2 # Reproduce el audio por 10 segundos
	timer = $TimerTransicion1
	timer_2 = $TimerPasarEscena
	
func _on_timer_timeout():
	audio_player_1.stop()
	_on_audio_stream_player_finished()
	

func _on_audio_stream_player_finished():
	audio_player_2.play()
	timer_2.start()
	timer.queue_free()
	

# func _on_timer_pasar_escena_timeout():
	#get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")



func _on_saltar_intro_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	pass # Replace with function body.
