if popped{
	if y+distance >= unpopped_y{
		y = unpopped_y
	}
	else if y < unpopped_y{
		y+=distance
	}
}
else{
	if y+distance <= -16{
		y = -16
	}
	else if y > -16{
		y-=distance
	}
}