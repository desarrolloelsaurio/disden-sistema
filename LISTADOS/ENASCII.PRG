* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �  Description: ENASCII.PRG                                                �
* �       Author: G. REINER                                                  �
* � Date created: 10-26-92                                                   �
* � Time created: 12:43:29pm                                                 �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION ENASCII
#DEFINE IMPRIMIENDO  PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'�') && IMPRIMIENDO
PARAMETER ENBASE
	STORE SPACE(10) TO RESPUESTA
	A=PREGUNTA("NOMBRE "+IIF(ENBASE,"DE LA BASE","DEL ARCHIVO")+" DE SALIDA",.T.,10,0,REPL("X",12))
	=men_lin(imprimiendo)
	IF !EMPTY(A)
		A=ALLTRIM(A)
		PUNTO=AT(".",A)
		IF !EMPTY(PUNTO)
			ARC=LEFT(A,PUNTO-1)
			EXT=SUBSTR(A,PUNTO+1)
		ELSE
		    IF ENBASE
			ARC=A
			EXT='DBF'
		    ELSE
			ARC=A
			EXT='TXT'
			ENDIF
		ENDIF
		ARC=SINCOSAS(ARC)
		EXT=SINCOSAS(EXT)
		A=IIF(EMPTY(ARC),'',arc+'.'+ext)
	ENDIF
RETURN A

