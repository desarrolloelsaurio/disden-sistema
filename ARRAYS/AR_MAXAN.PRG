****************************************************
*-- Programa: AR_MAXAN
*-- Fecha   : 05-19-92 09:59pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE EL ANCHO MAXIMO DE UN ARRAY
***************************************************
FUNCTION AR_MAXAN
PARAMETER HRRA
PRIVATE HRRA,A,MAXAN,LARGO
STORE 0 TO MAXAN
IF EMPTY(ALEN(HRRA,2))
   FOR A=1 TO ALEN(HRRA,1)
      LARGO=LEN(HRRA[A])
      MAXAN=IIF(LARGO>MAXAN,LARGO,MAXAN)
   NEXT
ELSE
   FOR A=1 TO ALEN(HRRA,1)
      LARGO=LEN(HRRA[A,1])
      MAXAN=IIF(LARGO>MAXAN,LARGO,MAXAN)
	 NEXT
ENDIF
RETURN MAXAN
