@icon("res://player/ZhuangTaiJi/state.svg")

class_name PlayerStateCrouch extends PlayerState
#region ///
#var player : CharacterBody2D
#var next_state : PlayerState
@export var derictioan_speed : float = 10
#endregion
# Called when the node enters the scene tree for the first time.
#当玩家状态发生改变时会发生什么？
func init() -> void:
	#print("init",name)
	pass

#每次进入该状态时调用的函数，会发生什么
func enter()->void:
	#print("sudu",player.velocity.x)
	player.collision_shape_stand.disabled = true
	player.collision_shape_crouch.disabled = false
	#player.sprite.scale.x = 2.725
	player.sprite.scale.y = 1.083
	player.sprite.position.y = -25.0
	pass
#当退出状态时会调用那个函数会发生什么？

func exit()->void:
	player.collision_shape_stand.disabled = false
	player.collision_shape_crouch.disabled = true
	player.sprite.scale.x = -2.947
	player.sprite.scale.y = -1.98
	player.sprite.position.y = -47.51
	pass
#处理当某个按键被按下或者释放时的操作

func handle_input( _event : InputEvent ) ->PlayerState:
	if _event.is_action_pressed("up"):
		return jump 
	#if _event.is_action_pressed("down"):
		#return fall 	
	return next_state

func process( _delta: float) -> PlayerState:
	if player.direction.y < 0.5:
		return idle
	return next_state

func physics_process( _delta: float) -> PlayerState:
	#print("Idle状态 - 当前方向: ", player.direction.x)  # 调试	
	player.velocity.x -= player.velocity.x * derictioan_speed * _delta
	print(player.velocity.x)
	return next_state
