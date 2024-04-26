********************************************************************************
*-- Programa: BRUB.PRG
*-- Fecha   : 06/07/91
*-- Version : G. REINER
*-- Notas   : BORRA RUBROS
*-- Modificaci¢n GOYO 07-28-92 06:52pm
********************************************************************************
stor RECNO() TO ff
stor STR(ff) TO registro
ulpr=hora_ulp(program())
if cheqseg()
	=MOVEWIN(mrubr,mrubc,mrubr+mrubla,mrubc+mruban,'WIN'," Borra Rubros ")
	SELE rub
	=LOCK() .OR. Lok("rub")
	COL=15
	SCAT MEMV
	=mrub()
	IF confirma("Borrar el Rubro",.T.,12,nul)
		DELE RECO ff
	ENDIF
	UNLO IN rub
	=RELEWIN("win")
	=iaud(rub->rubro)
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
