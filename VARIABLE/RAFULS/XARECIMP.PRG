*****************************************************************************
*-- Programa: xarecimp.prg
*-- Fecha   : 12-17-92 01:40pm
*-- Version : G. REINER
*-- Notas   : RECIBE IMPUESTOS EN ADMINISTRACIóN
*-- Modificación GOYO 10-17-92 07:12pm (ADAPTACION DE XACANCHO)
********************************************************************************
ulpr=horA_ULP(PROGRAM())
=MOVEWIN(4,27,8,66,'WIN',' Recibe Impuestos en Administración ')
rec_imp=iif(xarec_imp,"SI","NO")
@ 1,1 SAY 'RECIBE IMPUESTOS ? ' colo sche 3
@ 1,26 GET REC_IMP PICTURE '@M SI,NO' ;
MESS 'Recibe Impuestos de Propiedades en Administración ?'
READ
IF LAST()#27
	XAREC_IMP=(REC_IMP="SI")
ENDIF
=RELEWIN("win")
RETURN MEN_LIN(BOTOM)
