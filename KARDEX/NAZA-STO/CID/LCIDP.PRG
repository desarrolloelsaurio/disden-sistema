* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LXXXP.PRG                                                �
* � COMENTARIO    :                                                          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-20-93                                                    �
* � HORA       : 00:45:57am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
**************
PARA NADA
STORE .T. TO VARIABLE
CANT_MAX=6
DIME VARIABLE[CANT_MAX], TEXTO[CANT_MAX,2]
TEXTO[1 ,1]="FECHA"
TEXTO[2 ,1]="NUMERO"
TEXTO[3 ,1]="O.CORTE"
TEXTO[4 ,1]="MOVIMIENTO"
TEXTO[5 ,1]="TALLER"
TEXTO[6 ,1]="USUARIO"
TEXTO[1 ,2]=8
TEXTO[2 ,2]=10
TEXTO[3 ,2]=10
TEXTO[4 ,2]=10
TEXTO[5 ,2]=10
TEXTO[6 ,2]=10
TT="Listado de C.I.D"
ACLA=HAZ_ACLA()
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=UNWORK()
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SELE CID
	SCAN
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL)
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
	ENDSCAN
	=FIN_LIN(TWO,CASOS)
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
