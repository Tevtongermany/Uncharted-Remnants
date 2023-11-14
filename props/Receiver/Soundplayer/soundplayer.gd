extends Node2D

@onready var audio = $AudioStreamPlayer
@export var file: AudioStream
@export var audio_mode : STATUS
enum STATUS{
	state_affect_audio,
	state_dont_affect_audio,
}
func _ready():
	$MusicPlayer.hide()

	
func start(state):
	if audio_mode == 0:
		if state == 0:
			audio.play()
		elif state == 1:
			audio.stop()
	if audio_mode == 1 and not audio.playing:
		audio.play()
			
			
		
	
