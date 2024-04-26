********************************************
*-- Programa: OPHOR.PRG
*-- Fecha   : 26/10/95 17:40
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO HORAS TRABAJADAS
********************************************
FUNCTION OPHOR
PARAMETER OP_EXCL,OP_REOP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=men_lin('Abriendo archivo')
=IIF(OP_EXCL,CLOSDBF("HOR"),IIF(OP_REOP,OFF_TMP(),.T.))
IF USED("HOR")
	SELE HOR
ELSE
    sele 19
    if op_excl
	use (path+'\HORAS') order tag codcli excl alias hor
	else
	use (path+'\HORAS') order tag codcli alias hor
	endif
ENDIF
RETURN MEN_LIN(BOTOM)
