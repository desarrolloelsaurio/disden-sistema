********************************************************************************
*-- Programa: LPROJI.PRG
*-- Fecha   : 09/12/91 02:46pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE LEGAJOS DE PROVEEDORES
********************************************************************************
=HORA_ULP(PROGRAM())
SELE PRO
SET ORDER TO TAG IIF(ORDPRO,'PROCOD','PROVEEDOR')
TT=''
FISC=QWPRO(BAR())
IF FISC#'.F.'
   TTU=TT
   DO lproji1
ENDIF
RETURN MEN_LIN(BOTOM)
