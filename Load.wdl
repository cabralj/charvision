
path "models";
path "sprites";

bmap bubbleImg = <bubble.tga>; 

panel bubble
{
	bmap = bubbleImg;
 	//flags =  VISIBLE;
}

include <Entities.wdl>;		// Global Entities. 

include <Camera.wdl>;		// Controls the Camera 
include <Character.wdl>;	// Creates/Moves the Main Character
include <Ground.wdl>;		// Moves the ground UV texture
include <Joystick.wdl>;		// Connects Joystick control. 
include <Object.wdl>;		// Defines Basic Objecs. 
include 	<Panels.wdl>;		// Displays Layered Iconography 
//include <Display.wdl>; 	// Used to display a Title Screen.
//include <Views.wdl>;		// Used to display multiple cameras at the same time. 
include <Log.wdl>;


var video_mode = 6;	 	// screen size 640x480
var video_depth = 32; 	// 16 bit colour D3D mode
var video_screen = 1; 	// Fullscreen mode

string level00 = <Load.WMB>;
string spriteGrass = <grass.tga>;


function main(){
	tex_share = 1;

	//displayInfo();
	//bubble.visible= on;
	
	runAnimation();
}




function runAnimation(){
	
	level_load(level00);
	wait(1);
	sun_angle.pan = 270;
	sun_angle.tilt = 60;
	fog_color = 5; 
	camera.fog = 50;
	fps_max = 120; 
	fps_lock = off; 
	
	
	var x = 100;
	while(x > 0){
		ent_create(spriteGrass,vector(random(2000)-1000,random(1000)-500,50),ObjectGrass);
		x-=1;
	}
		
}


function exitGame()
{
   exit;
}
on_esc = exitGame();
