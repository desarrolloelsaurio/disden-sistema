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

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	TT="Ordenes de Requerimiento"
	=UNWORK()
	=WIN0()
	PAG=ONE
	STORE REPL("=",80) TO M.LINEA,M.ACLA
	=CABPAN()
	=TIT_LIN(ONE)
	SELE REQX
	SET ORDER TO TAG NUMERO
	SELE reQ
	VEZ=1
	GO TOP

    =PONTIT(.F.)
	SCAN
    	IF ELNUM#REQ.NUMERO
	       =PONNLIN(.T.)
	       ELNUM=REQ.NUMERO
	   ENDIF
	ENDIF
	#IF "Win" $ vers()
			IF ROW()>(WROWS()-4)
	#ELSE
		IF ROW()>21
		#ENDIF
			IF !FIN_LIN(ONE,NUL)
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		SELE REQX
		SEEK REQ.NUMERO
		SCAN WHILE REQX.NUMERO=REQ.NUMERO
		? PAIP
		DO CASE
		CASE !EMPTY(REQX.AVICODPRO)
		?? REQX.AVICODPRO
		CASE !EMPTY(REQX.TELCODPRO)
		?? REQX.TELCODPRO
		CASE !EMPTY(REQX.COMCODPRO)
		?? REQX.COMCODPRO
		ENDCASE
		?? PAIP
		?? STR(REQX.PEDIDO,XACDIGI)
		?? PAIP
		?? STR(RECIBIDO,XACDIGI)
		?? PAIP
		ENDS
		SELE REQ
	ENDSCAN
	=FIN_LIN(TWO,CASOS)
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION PONTIT
PARAMETER CONLIN
IF CONLIN
? M.LINEA
?
ENDIF
	? STR(REQ.NUMERO,5)
	?? PAIP
	?? SAYPER(REC.PROCOD,"PROCOD")
	?? PAIP
	?? REQ.FECHAPROM
	? M.LINEA
RETURN .T.
