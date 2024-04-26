********************************************************************************
*-- Programa: LCLIJP.PRG
*-- Fecha   : 09/12/91 02:46pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE LEGAJOS DE PROVEEDORES
********************************************************************************
=HORA_ULP(PROGRAM())
SELE PRO
SET ORDER TO TAG IIF(ORDPRO,'PROCOD','PROVEEDOR')
IF FISC#'.F.'
   TTU=TT
   DO lPROjp1
ENDIF
RETURN MEN_LIN(BOTOM)
