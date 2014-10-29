

var xSpeed = 1;

string head01 = <Pighead.mdl>;
string head02 = <Fatso.mdl>;
string head03 = <Bird.mdl>;

string eyeModel = <eyeball.mdl>;
string eyeLidModel = <eyeLid.mdl>;

string charState = "walk";

entity* ent;
entity* obstacle;
entity* nearest;
entity* characterMain;
entity* characterMainHead;


DEFINE _headType,SKILL1;
DEFINE _headSkin,SKILL2;


var dist;
string scanTest = "HelloWorld";

entity* nearestLast;

function eyes(){
	
	my.scale_x = you.skill11;
	my.scale_y = you.skill11;
	my.scale_z = you.skill11;
	
	while(1){
		proc_late();
		setVertex();
		if (nearest){
			if (nearest.x < 10){
				nearest.skill1 = 1;
				vec_set(temp,camera.x); 
				vec_sub(temp,my.x);
				vec_to_angle(my.pan,temp);
			}
			else{
				vec_set(temp,nearest.x); 
				vec_sub(temp,my.x);
				vec_to_angle(my.pan,temp);
			}
		}
		wait(1);

	}
}

function eyeLid(){
	
	my.skin = 2;
	my.ambient = you.ambient;
	my.albedo = you.albedo;
	my.scale_x = you.skill11;
	my.scale_y = you.skill11;
	my.scale_z = you.skill11;
	while(1){
		proc_late();
		setVertex();
		my.pan = you.pan;
		my.tilt = you.tilt;
		my.roll = you.roll;
		wait(1);
	}
}

string panTxt1;
string panTxt2;
	

entity* nearestFocus;


action HeadFocus {

	vec_set(my.x,camera.x);	
	nearestFocus = my;
	my.invisible = on;
	while(1){
		if (nearest){
			if (nearest.x > 10){
				my.x += ((nearest.x - my.x) / 30);
				my.y += ((nearest.y - my.y) / 30);
				my.z += ((nearest.z - my.z) / 50);
			}
			else{
				my.x += ((camera.x - my.x) / 10);
				my.y += ((camera.y - my.y) / 20);
				my.z += ((camera.z - my.z) / 10);
			}
		}
		wait(1);
	}
	
}

function head{
	
	characterMainHead = my;
	
	my.skill11 = you.skill11;
	my.skin = you.skill10;
	my.ambient = you.ambient;
	my.albedo = you.albedo;
	
	ent = ent_create (eyeModel, temp, eyes);
	ent.skill9 = you.skill12;
	ent = ent_create (eyeLidModel, temp, eyeLid);
	ent.skill9 = you.skill12;
	
	ent = ent_create (eyeModel, temp, eyes);
	ent.skill9 = you.skill13;
	ent = ent_create (eyeLidModel, temp, eyeLid);
	ent.skill9 = you.skill13;
	
	
	my.skill40 = 1;
	my.skill41 = .5;

	var cam_ang[3];

	wait(1);
	
	while(1){
		proc_late();
		//* SKILL 40 TILT
		if (my.tilt <= -10){ my.skill40 =  xSpeed; }
		if (my.tilt >=  10){ my.skill40 = -xSpeed; }
		my.tilt += my.skill40;
	
		
		// SKILL 41 ROLL
		if (my.roll <= -10){ my.skill41 =  xSpeed; }
		if (my.roll >=  10){ my.skill41 = -xSpeed; }
		my.roll += my.skill41;

			
		setVertex();
		//my.pan = you.pan;

		
		// TESTING CRASH
		vec_set(temp,nearestFocus.x); 
		
		vec_sub(temp,my.x);
		vec_to_angle(my.pan,temp);
			
		 /** DRAW TEXT ONTO SCREEN **********************************/
		str_for_num(panTxt1,temp.pan);
		str_for_num(panTxt2,my.pan);			
		draw_text(panTxt1,10,300,vector(255,255,255));	
		draw_text(panTxt2,10,320,vector(255,255,255));
		 /************************************/			
		
   	wait(1);
	}
}




define BodySkin, skill7;
define HeadType, skill8;
define HeadVert, skill9;
define HeadSkin, skill10;
define EyeScale, skill11;
define EyeRightVert, skill12;
define EyeLeftVert, skill13;
define MouthType, skill14;
define MouthVert, skill15;
define MouthSkin, skill16;
// uses BodySkin, HeadType, HeadVert, HeadSkin, EyeScale, EyeRightVert, EyeLeftVert, MouthType, MouthVert, MouthSkin
action body{	
	characterMain = my;
	
	my.skin = my.BodySkin;
	my.ambient = -75;
	my.albedo = 50;
	my.metal = off;
	
	if (my.HeadType == 1){you = ent_create (head01, temp, head);}
	if (my.HeadType == 2){you = ent_create (head02, temp, head);}
	if (my.HeadType == 3){you = ent_create (head03, temp, head);}
	
	you.skill9 = my.HeadVert;
	var distance;
	
	while(1){
			proc_late();
			you = ent_next (NULL);
 			while (you != NULL)
			{ 
				if (you.skill1 == 99){
					//you.invisible = on;
					distance = vec_dist(my.x,you.x);
					if (distance < 500 && you.x > 50){
						nearest = you;
					}
				}
 				you = ent_next (you);
 			}
			
			if(xSpeed > 0){
				ent_cycle(charState, my.skill48 % 100); // replay the animation endlessly.
				my.skill48 += (xSpeed*10) * time;
			}
			else{
				ent_cycle("walk", my.skill48 % 100); // replay the animation endlessly.
				my.skill48 += (xSpeed*10) * time;
			}

		wait(1);
	}
}


function setVertex(){
	vec_for_vertex (temp, you, my.HeadVert);
	vec_set(my.x,temp.x);
}


