* 浜様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LFABPTP.PRG                   �
* � COMENTARIO    : LISTADO DE PROCESOS TERMINADOS�
* 麺様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                      �
* � FECHA      : 08-20-93                         �
* � HORA       : 00:45:57am                       �
* � COPYRIGHT  : 1993 by GREGORIO REINER          �
* 藩様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=WIN0()
	PAG=1
	=CABPAN()
	=TIT_LIN(1)
	SELE TMP
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL,IIF(HAY,FIN_SUM('SUBTOTAL',@TTL),.F.))
				EXIT
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LIN(2)
		ENDIF
		=LFABPT1()
	ENDSCAN
	=FIN_LIN(2,CASOS,IIF(HAY,FIN_SUM('TOTAL',@TTL),.F.))
	=RELEWIN("WIN")
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
