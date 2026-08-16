@icon("res://player/ZhuangTaiJi/state.svg")
class_name PlayerStateJump extends PlayerState

#region ///
#var player : CharacterBody2D
#var next_state : PlayerState


#endregion
# Called when the node enters the scene tree for the first time.
#当玩家状态发生改变时会发生什么？
func init() -> void:
	#print("init",name)
	pass

#每次进入该状态时调用的函数，会发生什么
func enter()->void:
	#print("enter",name)
	#print(player.states[0],player.states[1],player.states[2])
	player.add_debug_indicator(Color.GREEN)
	player.velocity.y = -1.5*player.jump_velocity

	pass
	
#当退出状态时会调用那个函数会发生什么？

func exit()->void:
	player.add_debug_indicator(Color.YELLOW)
	
	pass
#处理当某个按键被按下或者释放时的操作

func handle_input( _event : InputEvent ) ->PlayerState:
	if _event.is_action_released("up"):
		player.velocity.y *=0.5
		return fall
	return next_state

func process( _delta: float) -> PlayerState:

	return next_state

func physics_process( _delta: float) -> PlayerState:
	if player.is_on_floor():
		return idle
	elif player.velocity.y >=0 :
		return fall

	player.velocity.x = player.direction.x * player.move_speed
	
	return next_state
