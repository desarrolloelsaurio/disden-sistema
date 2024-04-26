*******************************************************************************
*-- Programa: apre.prg
*-- Fecha   : 09/11/91 05:10pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE actualizacion de precios
*-- VERSION BALCALA
*******************************************************************************
=HORA_ULP()
dijo1=BAR()
tt='Todos los Precios-'
FISC=QWMER(DIJO1)
IF FISC#'.F.'
	 TTU=TT
	 DO APRE1
ENDIF
=MEN_LIN(BOTOM)
RETURN
