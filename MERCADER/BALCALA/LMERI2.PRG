********************************************************************************
*-- Programa: lmeri2.prg
*-- Fecha   : 07/29/91 04:24pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE listado de mercader¡as por impresora
********************************************************************************
dijo1=BAR()
tt='Listado de Mercader¡as'
FISC=QWMER(DIJO)
IF FISC#'.F.'
   =IIF(dijo1=1,lmerim(),lmeri1())
ENDIF
RETURN MEN_LIN(BOTOM)
