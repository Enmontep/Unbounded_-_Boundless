if popped{
	if y+distance >= unpopped_y{
		y = unpopped_y
	}
	else if y < unpopped_y{
		y+=distance
	}
}
else{
	if y+distance <= 0{
		y = 0
	}
	else if y > 0{
		y-=distance
	}
}