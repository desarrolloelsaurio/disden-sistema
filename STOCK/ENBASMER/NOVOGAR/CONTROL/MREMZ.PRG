* 浜様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : MREMZ.PRG                   �
* � COMENTARIO    : LISTA REMITOS DE SUCURSALES �
* 麺様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                    �
* � FECHA      : 08-20-93                       �
* � HORA       : 00:45:57am                     �
* � COPYRIGHT  : 1993 by GREGORIO REINER        �
* 藩様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=win1()
	STORE .F. TO DEVENTA
	SELE REM
	SCAN
		SELE REX
		SET ORDER TO TAG REMITO
		SEEK REM.REMITO
		=MREM(.F.,.T.)
		IF LAST()=27
			EXIT
		ENDIF
		SELE REM
	ENDSCAN
	=IAUD(FISC)
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
