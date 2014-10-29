



string pX;
string pY;
string nX;
string nY;



var panelY = 50;

action PanelTest{
	
	my.invisible = on;
	my.scale_x = .2;
	my.scale_y = .2;
	my.scale_z = .2;
	
	while(!nearestFocus && !characterMainHead){
		wait(1);
	}
	wait(1);
	vec_set(my.x,characterMainHead.x);
	my.z += 20;

	while(1){
		
		temp.x = 0;
		if (nearestFocus.y > 0){
			temp.y = 25;
		}
		else{
			temp.y = -25;
		}
		temp.z = 20;
		vec_add(temp,characterMainHead.x);
		vec_set(my.x,temp.x);
		
		
		vec_set(temp,my.x);
   	vec_to_screen(temp,camera);
   	bubble.pos_x += ((temp.x-200) - bubble.pos_x) / 10;
   	//bubble.pos_y += ((temp.y-200) - bubble.pos_y) / 10;
   	
   	
   	//bubble.visible = on;
   	
		//vec_add(my.x,vec_distance); 
		//vec_set(temp,characterMainHead.x);
		
		//vec_to_screen(temp,camera);
		//str_for_num(pX,temp.x);
		//draw_text(pX,10,500,vector(255,255,255));
		
		wait(1);
	}
}