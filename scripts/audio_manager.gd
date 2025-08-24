extends Node

var ui_audio_stream: AudioStreamPlayer
var music_stream: AudioStreamPlayer

func _ready() -> void:
	ui_audio_stream = AudioStreamPlayer.new()
	ui_audio_stream.process_mode = Node.PROCESS_MODE_ALWAYS
	music_stream = AudioStreamPlayer.new()
	add_child(ui_audio_stream)
	add_child(music_stream)

func play_ui_sound(sound: AudioStream):
	ui_audio_stream.stream = sound
	ui_audio_stream.play()

func play_sound_effect(sound: AudioStream):
	var sound_effect_player = AudioStreamPlayer2D.new()
	add_child(sound_effect_player)
	sound_effect_player.stream = sound
	sound_effect_player.process_mode = Node.PROCESS_MODE_ALWAYS
	sound_effect_player.play()
	await sound_effect_player.finished
	sound_effect_player.queue_free()

func set_music(music: AudioStream):
	music_stream.stream = music
	music_stream.play()
