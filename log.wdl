

var_nsave filehandle;

starter logDebug {
	
	while(1){
		filehandle = file_open_write("logs/log.txt");
		file_var_write(filehandle,total_secs);
		file_close(filehandle);
		wait(100);
	}

} 

