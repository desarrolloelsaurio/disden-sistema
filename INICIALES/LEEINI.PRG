FUNCTION LEEINI
PARAMETER QUEINI
IF !FILE(QUEINI)
	RETURN .F.
ENDIF
STORE FOPEN(QUEINI) TO file_handle		    && Open the file
DO WHILE NOT FEOF(file_handle)
	l_string = FGETS(file_handle)	        && Store contents 
	&l_string 	                            && Execute
ENDDO
= FCLOSE(file_handle)						&& Close the file
RETURN .T.
