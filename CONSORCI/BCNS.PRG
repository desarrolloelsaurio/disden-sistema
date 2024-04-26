* ษออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BCNS.PRG               บ
* บ COMENTARIO    : BORRA CONSORCIOS       บ
* ฬออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER               บ
* บ FECHA      : 12-29-93                  บ
* บ HORA       : 07:58:45pm                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER   บ
* ศออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
STORE RECNO() TO FF
REGISTRO=STR(FF)
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	=MOVEWIN(MCNSR,MCNSC,MCNSR+MCNSLA,MCNSC+MCNSAN,'WIN'," Borra Consorcios ")
	SELE CNS
	=LOCK("CNS") .OR. LOK("CNS")
	STORE 17 TO COL
	SCAT MEMVAR
	DO MCNS WITH .T.
	IF CONFIRMA("Borrar el Consorcio",.T.,12,0)
		DELE RECO FF
		=IAUD(CNS.CONSORCIO)
	ENDIF
	UNLO IN CNS
	=RELEWIN('WIN')
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
