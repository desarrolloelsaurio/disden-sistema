********************************************************************************
*-- Programa: LCLIJI.PRG
*-- Fecha   : 09/12/91 02:46pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE LEGAJOS DE clientes
********************************************************************************
=HORA_ULP(PROGRAM())
TT=''
FISC=QWCLI(BAR())
SELE PER
SET ORDER TO TAG IIF(ORDCLI,'CODCLI','CLIENTE')
IF FISC#'.F.'
   TTU=TT
   DO lcliji1
ENDIF
RETURN MEN_LIN(BOTOM)
