********************************************************************************
*-- Programa: istot.prg
*-- Fecha   : 09/06/91 03:57pm
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE GENERALIZACION DE Stock
*-- Modificaci¢n GOYO 05-17-92 02:09am
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
tt='Todos los Productos '
fisc=qwmer(bar())
if fisc#'.F.'
DO iStot1
endif
ELSE
=iaudi()
ENDIF
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)
