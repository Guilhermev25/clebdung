extends Node

onready var player = get_parent().get_parent().get_parent()
onready var player_sprite = player.get_node("PlayerSprite")
var speed_boost: float = 2.5
var interpolation_duration: float = 0.5	

func usePowerUp():
	$Tween.stop_all()
	$Tween.interpolate_property(player, "speed",
								speed_boost * player.speed, player.speed,
								interpolation_duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.call_deferred("start")
	yield($Tween, "tween_completed")
	queue_free()

func get_duration():
	return interpolation_duration

func _process(_delta):
	if find_node("Sprite") != null:
		$Sprite.global_position = player_sprite.global_position
		$Sprite.frame = player_sprite.frame
