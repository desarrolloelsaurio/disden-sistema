********************************************************************************
*-- Programa: WIN0.PRG
*-- Fecha   : 10-09-91 02:43pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE VENTANAS
********************************************************************************
#IF "Wind" $ VERS()
=MOVEWINN(0,0,SROW(),SCOL(),'WIN')
#ELSE
=MOVEWINN(0,0,24,79,'WIN')
#ENDIF
return .t.
