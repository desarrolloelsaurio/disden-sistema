********************************************************************************
*-- Programa: LLRUB.PRG
*-- Fecha   : 06/07/91
*-- Version : V.LEEGSTRA
*-- Notas   : RECUPERA RUBROS BORRADOS LOGICAMENTE
*-- Modificaci¢n GOYO 07-28-92 06:52pm
********************************************************************************
stor RECNO() TO ff
stor STR(ff) TO registro
ulpr=hora_ulp(program())
if cheqseg()
	=MOVEWIN(mrubr,mrubc,mrubr+mrubla,mrubc+mruban,'WIN'," Recupera Rubros ")
	SELE rub
	=lock() .or. lok("rub")
	stor 15 TO COL
	SCAT MEMVAR
	DO mrub
	IF confirma("Recuperar el Rubro",.T.,12,nul)
		RECA RECO ff
	ENDIF
	=RELEWIN("win")
	UNLO IN rub
	=Iaud(rub->rubro)
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
