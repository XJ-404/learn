class_name Player extends CharacterBody2D

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


#region //常用变量的定义
#方向变量，可以让我们来确定玩家方向并且可以通过改变变量值来让玩家往不同的方向移动
var direction : Vector2 = Vector2.ZERO
#设置中里变量
var gravity : float= 980

#endregion




func _ready() -> void:
	initialize_states()
	pass


func _process(delta: float) -> void:
	change_state( current_state.process( delta ) )
	pass


func _physics_process(delta: float) -> void:
	change_state( current_state.physics_process( delta ) )
	
	pass

#初始化并获取各种状态
func initialize_states()->void:
	states =[]
	for c in $Node.get_children():
		if c is PlayerState:
			states.append( c )
			c.player = self
			
	#通过遍历来执行当状态机里面需要初始化内容时的代码也就是init函数		
	if states.size()==0:
		return
	for sate in states:
		sate.init()
	change_state(current_state)
	current_state.enter()
	#print( states )
	
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
	pass
	

func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))
	  
