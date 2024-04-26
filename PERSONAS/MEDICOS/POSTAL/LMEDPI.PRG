********************************************************************************
*-- Programa: LMEDJI.PRG
*-- Fecha   : 09/12/91 02:46pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE LEGAJOS DE MEDICOs
********************************************************************************
=HORA_ULP(PROGRAM())
TT=''
FISC=QWMED(BAR())
SELE MED
SET ORDER TO TAG IIF(ORDMED,'CODMED','MEDICOS')
IF FISC#'.F.'
   TTU=TT
   DO lMEDPI1
ENDIF
=MEN_LIN(BOTOM)
RETURN
