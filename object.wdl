


define objType, skill1;
// uses objType;



action ObjectA{

	
	my.skill1 = 99;
	my.pan = random(int(360));
	
	my.scale_x = .5;
	my.scale_y = .5;
	my.scale_z = .5;
	
	while(1){		
		my.x -= xSpeed;
		if (my.x < -500){
			my.x = 500;	
			my.z = random(200);
			my.pan = random(int(360));
		}
		
		wait(1);
	}
}


action ObjectTree{
	my.passable = on;
	my.overlay = 1;
	my.albedo = 0;
	my.ambient = 75;
	
	while(1){		
		my.x -= xSpeed;
		if (my.x < -1000){
			my.x = 1000;
		}
		wait(1);
	}
	
}



action ObjectRock{
	my.passable = on;
	my.overlay = 1;
	my.albedo = 0;
	my.ambient = 75;
	
	while(1){
		my.x -= xSpeed;
		if (my.x < -1000){
			my.x = 1000;
		}
		wait(1);
	}
	
}


action ObjectGrass{
	my.passable = on;
	my.overlay = 1;
	my.albedo = 0;
	my.ambient = 90;
	my.pan = random(360);
	my.tilt = random(30)-15;
	my.scale_x = random(2);
	while(1){
		my.x -= xSpeed;
		if (my.x < -1000){
			my.x = 1000;
		}
		wait(1);
	}
	
}


