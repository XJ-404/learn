@icon("res://player/juesexinxi/state.svg")
class_name PlayerState extends Node

#region ///
var player : CharacterBody2D
var next_state : PlayerState

#endregion
# Called when the node enters the scene tree for the first time.

#当玩家状态发生改变时会发生什么？
func init() -> void:
	print("init",name)

#每次进入该状态时调用的函数，会发生什么
func enter()->void:
	print("enter",name)


#当退出状态时会调用那个函数会发生什么？
func exit()->void:
	print("exit",name)
	


#处理当某个按键被按下或者释放时的操作
func handle_input( _event : InputEvent ) ->PlayerState:
	if _event.is_action_pressed("up"):
		print("up",name)
	
	return next_state


func process( _delta: float) -> PlayerState:
	#print("pr:",name)
	
	return next_state

func physics_process( _delta: float) -> PlayerState:
	#print("ph:",name)
	
	
	return next_state
