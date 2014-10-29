




view POV
{ 		
	layer = 2;
 	size_x = 120;
 	size_y = 80;
 	arc = 80;
 	offset_x = 0;
 	offset_y = 0;
 	flags = visible;
}

starter POVpos{
	
	POV.size_x = screen_size.x;
	while(1){
		
			POV.x = 0;
			POV.y = 0;
			POV.z = 70;

		if (nearest){
			if (nearest.x < 10){
				vec_set(temp,nearest.x); 
				vec_sub(temp,POV.x);
				vec_to_angle(POV.pan,temp);
			}
			else{
				vec_set(temp,nearest.x); 
				vec_sub(temp,POV.x);
				vec_to_angle(POV.pan,temp);
			}
		}
		wait(1);
	}
}