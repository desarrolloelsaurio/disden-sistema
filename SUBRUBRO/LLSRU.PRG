********************************************************************************
*-- Programa: LLSRU.PRG
*-- Fecha   : 11-20-91
*-- Version : G. REINER
*-- Notas   : RECUPERA SUB-RUBROS BORRADOS LOGICAMENTE
*-- Modificaci¢n GOYO 07-29-92 01:14am
********************************************************************************
stor RECNO() TO ff
stor STR(ff) TO registro
SELE seg
stor PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
	=HORA_ULP()
	=MOVEWIN(mrubr,mrubc,mrubr+mrubla+1,mrubc+mruban,'WIN'," Recupera Sub-Rubros ")
	SELE rub
	=LOCK() .OR. lok("rub")
	stor 15 TO COL
	SCAT MEMVAR
	DO msru
	IF confirma("Recuperar el Sub-Rubro",.T.,12,nul)
		RECA RECO ff
	ENDIF
	=RELEWIN("win")
	UNLO IN rub
	=IAUD(M.RUBRO)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
