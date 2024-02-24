extends Area3D


func _on_body_entered(body):
	if(body.has_method("passing_through")):
		body.passing_through()

func _on_body_exited(body):
	if(body.has_method("done_passing_through")):
		body.done_passing_through()
