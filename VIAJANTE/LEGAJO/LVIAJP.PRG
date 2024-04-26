********************************************************************************
*-- Programa: LVIAJP.PRG
*-- Fecha   : 09/12/91 02:46pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE LEGAJOS DE VIAJANTES
********************************************************************************
=HORA_ULP(PROGRAM())
SELE VIA
SET ORDER TO TAG IIF(ORDVIA,'CODVIA','VIAJANTE')
TT=''
FISC=QWVIA(BAR())
IF FISC#'.F.'
   TTU=TT
   DO lVIAjp1
ENDIF
=MEN_LIN(BOTOM)
RETURN
