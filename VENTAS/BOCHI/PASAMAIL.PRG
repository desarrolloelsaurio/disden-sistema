A = GETF("DBF")
USE (A)
errfile = FCREATE('C:\temp\LISTA.CSV')
=FWRITE(errfile, "Nombre,Dirección de correo electrónico"+CHR(13)+CHR(10))
SCAN FOR "@"$TEXTO3
	=FWRITE(errfile, ALLTRIM(CLIENTE)+","+ALLTRIM(TEXTO3)+CHR(13)+CHR(10))
ENDSCAN
=FCLOSE(errfile)

