@icon("res://player/ZhuangTaiJi/state.svg")
class_name PlayerStateFall extends PlayerState

@export var coyot_time : float = 0.4
#region ///
#var player : CharacterBody2D
#var next_state : PlayerState
var coyot_timer :float = 0
#endregion
# Called when the node enters the scene tree for the first time.
#当玩家状态发生改变时会发生什么？
func init() -> void:
	#print("init",name)
	pass

#每次进入该状态时调用的函数，会发生什么
func enter()->void:
	#print("enter",name)
	#player.add_debug_indicator(Color.GREEN)

	if player.previous_state == player.current_state:
		coyot_timer = 0
	else :	
		coyot_timer = coyot_time


	pass
	
#当退出状态时会调用那个函数会发生什么？

func exit()->void:
	pass
#处理当某个按键被按下或者释放时的操作

func handle_input( _event : InputEvent ) ->PlayerState:
	if _event.is_action_pressed("up"):
		if coyot_timer > 0:
			return jump
	return next_state

func process( _delta: float) -> PlayerState:
	coyot_timer -= _delta
	return next_state

func physics_process( _delta: float) -> PlayerState:
	if player.is_on_floor():
		return idle

	player.velocity.x = player.direction.x * player.move_speed

	return next_state
