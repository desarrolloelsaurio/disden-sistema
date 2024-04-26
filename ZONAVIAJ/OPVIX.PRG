********************************************************************************
*-- Programa: opvix.prg
*-- Fecha   : 06/12/91 01:50pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO VIAJANTES
*-- Modificaci¢n GOYO 01-21-93 05:06pm
*-- VERSION NOVOGAR
********************************************************************************
IF !USED("VIX")
   =MEN_LIN(ABA+biajas)
   =GETDBF('VIAJADAT','codvia','vix',20)
ENDIF
RETURN MEN_LIN(BOTOM)
