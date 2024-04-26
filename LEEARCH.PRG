*** TEST.TXT must exist ***

STORE FOPEN('test.txt') TO file_handle		&& Open the file
do while !feof(file_handle)
	l_string = FREAD(file_handle,255)	&& Store to memory
	? l_string
enddo 
= FCLOSE(file_handle)	&& Close the file

