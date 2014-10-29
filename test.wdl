
/////////////////////////////////////////////////////////////////
// Filename of the starting level.
string level_str = <test.WMB>; // give file names in angular brackets

include "Log.wdl";
include "Entities.wdl";
include "Character.wdl";

path "models";
/////////////////////////////////////////////////////////////////
// Desc: The main() function is started at game start
function main()
{

	// wait 3 frames (for triple buffering) until it is flipped to the foreground
	wait(3);

	// now load the level
	level_load(level_str);

	wait(2);	// let level load

	camera.pan = 180;
	camera.arc = 80;
}


action TestObj {
	while(1){
		my.pan += 10*time;
		wait(1);
	}	
	
}


function exitGame()
{
   exit;
}
on_esc = exitGame();
