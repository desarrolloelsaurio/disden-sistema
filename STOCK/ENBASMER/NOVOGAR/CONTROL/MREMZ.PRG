* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MREMZ.PRG                   บ
* บ COMENTARIO    : LISTA REMITOS DE SUCURSALES บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                    บ
* บ FECHA      : 08-20-93                       บ
* บ HORA       : 00:45:57am                     บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER        บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
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
