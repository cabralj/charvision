
// Global Camera Position
var cameraPosition = 1;
var cameraPositionTotal = 10;
var cameraControl = 0;

// Range for Auto Camera Position Select. 
var cameraAutoSelectMin = 50;
var cameraAutoSelectMax = 500;

// Level of accuracy when tweening to new Camera Position. 
var cameraDistanceMin = 10;

var cameraStyleIndex = 1;
var cameraDistance = 0;

starter PositionRotation {
	while(1){
		if (cameraControl == 0){
			cameraPosition = int(random(cameraPositionTotal))+1;
			wait(random(cameraAutoSelectMax)+cameraAutoSelectMin);
		}
		else{
			wait(1);
		}
		
	}
}

 
define CamPosIndex, 	skill1;
define CamPosArc,		skill2;
define CamPosOffsetX,	skill3;
define CamPosOffsetY,	skill4;
define CamPosOffsetZ,	skill5;
// uses CamPosIndex, CamPosArc, CamPosOffsetX, CamPosOffsetY, CamPosOffsetZ

action Position {

	if (my.CamPosArc 	== 0) { my.CamPosArc = 60;}
	if (my.CamPosOffsetX == 0) { my.CamPosOffsetX = 0;}
	if (my.CamPosOffsetY == 0) { my.CamPosOffsetY = 0;}
	if (my.CamPosOffsetZ == 0) { my.CamPosOffsetZ = 50;}

	cinemaCam = my;
	my.invisible = off;	
	
	CameraPositionRun();
}

string txt;
function CameraPositionRun(){

	proc_late(); 

	var isSet = 0;
	var distance;
	
	while(1){
		
		if (cameraPosition == my.CamPosIndex){	

			if (isSet == 0){
				
				cinemaCam = my;
	
				if(cameraStyleIndex == 0){ CameraHardCut(); }
				if(cameraStyleIndex == 1){ CameraSmoothTween(); }
				
				//vec_set(temp,vector((characterMainHead.x + my.CamPosOffsetX),(characterMainHead.y + my.CamPosOffsetY),(characterMainHead.z + my.CamPosOffsetZ)));
				
				vec_set(temp,characterMainHead.x);
				vec_sub(temp,camera.x);		
				vec_to_angle(camera.pan,temp);

				// set the camera arc based on current camera postion
				CameraArcTween();
				
				distance = vec_dist(my.x,camera.x); 
				
				if (distance < cameraDistanceMin){
					isSet = 1;
				}
				
			}
			
			cameraDistance = vec_dist(characterMain.x,camera.x);
			str_for_num(txt,cameraDistance);
			draw_text(txt,10,350,vector(255,255,255));
		}
		else{
			isSet = 0;
		}
		wait(1);
	}
}

function CameraArcTween(){
	camera.arc += (my.CamPosArc - camera.arc) / 20;	
}

function CameraHardCut(){
	vec_set(camera.x,my.x);
}

function CameraSmoothTween(){
	camera.x += ((my.x - camera.x) / 20);
	camera.y += ((my.y - camera.y) / 20);
	camera.z += ((my.z - camera.z) / 20);
	
}


function set1()	{cameraPosition = 1;}
function set2()	{cameraPosition = 2;}
function set3()	{cameraPosition = 3;}
function set4()	{cameraPosition = 4;}
function set5()	{cameraPosition = 5;}
function set6()	{cameraPosition = 6;}
function set7()	{cameraPosition = 7;}
function set8()	{cameraPosition = 8;}
function set9()	{cameraPosition = 9;}
function set10()	{cameraPosition = 10;}
function set11()	{cameraPosition = 11;}
function set12()	{cameraPosition = 12;}

function cameraAutoPlay() {
		if (cameraControl == 1){
			cameraControl = 0;
		}
		else{
			cameraControl = 1;
		}
		beep;
}

on_1 	= set1;
on_2 	= set2;
on_3 	= set3;
on_4 	= set4;
on_5 	= set5;
on_6 	= set6;
on_7 	= set7;
on_8 	= set8;
on_9 	= set9;
on_0	= set10;
on_q 	= set11;
on_w	= set12;

on_space	= cameraAutoPlay;
