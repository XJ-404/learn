@icon("res://player/ZhuangTaiJi/state.svg")
class_name PlayerStateRun extends PlayerState

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
	player.animation_player.play( "run" )

	pass
	
#当退出状态时会调用那个函数会发生什么？

func exit()->void:
	
	pass
#处理当某个按键被按下或者释放时的操作

func handle_input( _event : InputEvent ) ->PlayerState:
	if _event.is_action_pressed("up"):
		return jump 
	if _event.is_action_pressed("down"):
		return crouch 		
	return next_state

func process( _delta: float) -> PlayerState:
	if player.direction.x == 0:
		#player.velocity.x = 0
		#player.velocity.y = 0
		return idle
	elif player.direction.y>0.5:
		return crouch
	return next_state

func physics_process( _delta: float) -> PlayerState:
	player.velocity.x = player.direction.x * player.move_speed
	if player.is_on_floor() == false:
		return fall
	return next_state
