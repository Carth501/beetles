class_name grab_point extends Area2D

func body_entered(body):
	if(body.has_method("grab")):
		body.grab(self)
