* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LALQAUTP.PRG                                             �
* � COMENTARIO    : LISTADO DE CONTRATOS AUTORIZADOS / NO AUTORIZADOS CRT    �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-20-93                                                    �
* � HORA       : 00:45:57am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE PAIP     "|"                             && PAIP
#DEFINE BOTOM    " "+repl("�",78)                && BOTOM

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=WIN0()
	PAG=1
	=CABPAN()
	=TIT_LIN(1)
	SELE ALQ
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		? PAIP
		?? CODINM
		?? PAIP
		?? LEFT(DOMICILIO,30)
		?? PAIP
		?? PROCOD
		?? PAIP
		?? CODCLI
		?? PAIP
		?? FECHAALQ
		?? PAIP
		CASOS=CASOS+1
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
