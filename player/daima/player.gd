class_name Player extends CharacterBody2D

const DEBUG_JUMP_GAODU = preload("uid://xghdo4oqbvwx")

#region //获取玩家状态的变量定义

#创建一个保存playerstate的数据结构类型
var states:Array[PlayerState]
#下列代码获取是把获取的第一个值给到current_state，第一个值返回的是玩家当前状态
var current_state : PlayerState:
	get :return states.front()

#获取玩家的上一个状态，是states列表的第二个位置当中
var previous_state : PlayerState:
	get :return states[1]

#endregion
#region //保存导出变量
@export var move_speed : float = 100
@export var  jump_velocity :float = 450
#endregion

#region //常用变量的定义
#方向变量，可以让我们来确定玩家方向并且可以通过改变变量值来让玩家往不同的方向移动
var direction : Vector2 = Vector2.ZERO
#设置中里变量
var gravity : float = 980


#endregion

func _ready() -> void:
	initialize_states()
	pass

func _process(delta: float) -> void:

	update_driction()
	change_state( current_state.process( delta ) )
	pass

func _physics_process( delta: float) -> void:
	#update_driction()

	velocity.y += gravity * delta
	move_and_slide()
	change_state( current_state.physics_process( delta ) )	
	pass

#初始化并获取各种状态
func initialize_states()->void:
	states = []
	for c in $states.get_children():
		if c is PlayerState:
			states.append( c )
			c.player = self
			print(c)
	#通过遍历来执行当状态机里面需要初始化内容时的代码也就是init函数		
	if states.size()==0:
		return
	for sate in states:
		sate.init()
	change_state(current_state)
	current_state.enter()
	#$Label.text = current_state.name
#用来传入我想更改的状态参数，因此我们需要设置一个自己专属的传参		
func change_state(new_state:PlayerState) -> void:
	#先确认是不是有效状态，防止一直传入闲置状态来消耗资源
	if new_state == null:
		return
	elif new_state==current_state:
		return
	if current_state:
		current_state.exit()
	#更新状态列表的玩家当前状态
	states.push_front(new_state)
	
	current_state.enter()
	#通过控制状态数组的长度来实现去掉多余无用的状态信息只保留前三种及分别为当前状态，过去状态以及再以前的状态
	states.resize( 3 )
	$Label.text = current_state.name
	
	

func _unhandled_input(event: InputEvent) -> void:
	if current_state == null:
		return
	change_state(current_state.handle_input(event))

#获取玩家位置信息和玩家输入信息并更改玩家位置
func update_driction() ->void:

	var axix_x = Input.get_axis("left","right")
	var axix_y = Input.get_axis("up","down")
	direction = Vector2(axix_x,axix_y)
	#if axix_x == 0 and axix_y == 0:
		#direction = Vector2.ZERO
	pass

func add_debug_indicator(color : Color = Color.RED ) ->void:
	var d :Node2D = DEBUG_JUMP_GAODU.instantiate()
	get_tree().root.add_child( d )
	d.global_position = global_position
	d.modulate = color
	await get_tree().create_timer(3.0).timeout
	d.queue_free()
	pass
