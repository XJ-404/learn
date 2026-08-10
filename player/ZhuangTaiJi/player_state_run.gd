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
	print("enter",name)
	
#当退出状态时会调用那个函数会发生什么？

func exit()->void:
	pass
#处理当某个按键被按下或者释放时的操作

func handle_input( _event : InputEvent ) ->PlayerState:
	return next_state

func process( _delta: float) -> PlayerState:
	if player.direction.x ==0:
		print("该触发idel了！\n")
		return %Idle
	return next_state

func physics_process( _delta: float) -> PlayerState:
	player.velocity.x = player.direction.x*-100
	#player.velocity.y = player.direction.y*-100
	 
	return next_state
