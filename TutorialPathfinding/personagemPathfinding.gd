extends KinematicBody2D

onready var navegacao = get_parent()

var caminho = []
var direcao = Vector2()
var velocidade = 120

func acharCaminho():
	caminho = navegacao.get_simple_path(global_position, get_global_mouse_position(), false)

func mover():
	if caminho.size() > 0:
		direcao = global_position.direction_to(caminho[0])
		
		if global_position.x > caminho[0].x - 10 and global_position.x < caminho[0].x + 10 and global_position.y > caminho[0].y - 10 and global_position.y < caminho[0].y + 10:
			caminho.remove(0)
			
		move_and_slide(velocidade * direcao)

func _physics_process(delta):
	mover()
	
	if Input.is_action_just_pressed("ui_accept"):
		acharCaminho()
