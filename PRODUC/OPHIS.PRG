**************************************************************
*-- PROGRAMA: OPHIS.PRG
*-- FECHA   : 07/31/91 05:06PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO HISTORICO DE ORDENES DE FABRICACION
**************************************************************
ACTI SCRE
@ 24,0 SAY PADC('Abriendo Archivo Hist¢rico',80) COLO SCHE 19
SELE 11
IF ALIAS()#'HIS'
   USE (pathpro+'\HISFAB') INDEX (pathpro+'\HISFAB') ALIAS his
ENDIF
SELE 12
IF ALIAS()#'HIX'
   USE (pathpro+'\HISFAX') INDEX (pathpro+'\HISFAX') ALIAS hix
ENDIF
RETURN MEN_LIN(BOTOM)
