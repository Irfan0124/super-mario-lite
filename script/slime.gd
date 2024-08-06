extends Node2D


const speed=60;
var direction=1;
@onready var raycastright = $raycastright
@onready var raycastleft = $raycastleft
@onready var animated_sprite = $AnimatedSprite2D
@onready var raycastbottom = $raycastbottom
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if  raycastright.is_colliding():
		direction=-1
		animated_sprite.flip_h=true;
	if raycastleft.is_colliding():
		direction=1;
		animated_sprite.flip_h=false;
	if direction==1:
		if raycastbottom.is_colliding():
			animated_sprite.flip_h=false
		else:
			direction=-1
			animated_sprite.flip_h=true
	elif direction== -1:
		if raycastbottom.is_colliding():
			animated_sprite.flip_h=true
		else:
			direction=1
			animated_sprite.flip_h=false
	position.x +=direction*speed*delta;
