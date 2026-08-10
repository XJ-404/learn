@icon("res://player/ZhuangTaiJi/state.svg")

class_name PlayerState extends Node

#region ///
var player : CharacterBody2D
var next_state : PlayerState

#endregion
# Called when the node enters the scene tree for the first time.

#region //引用各种状态机到初始项目模版为了后面写入新状态机时快速完成代码
#@onready var idie: PlayerStateIdie = %Idie
#@onready var run: PlayerStateRun = %Run


#endregion
#当玩家状态发生改变时会发生什么？
func init() -> void:
	pass

#每次进入该状态时调用的函数，会发生什么
func enter()->void:
	pass
#当退出状态时会调用那个函数会发生什么？

func exit()->void:
	pass
#处理当某个按键被按下或者释放时的操作

func handle_input( _event : InputEvent ) ->PlayerState:
	return next_state

func process( _delta: float) -> PlayerState:
	return next_state

func physics_process( _delta: float) -> PlayerState:
	return next_state
