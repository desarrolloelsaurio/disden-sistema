*******************************************************************
*-- Programa: OPHFA.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : ABRE ARCHIVO FACTURAS DE PROVEEDORES
*******************************************************************
=MEN_LIN('Abriendo archivo de Facturas de Proveedores')
SELE 23
IF ALIAS()#'HAD'
   USE (PATH+'\HFACTDAC') INDEX (PATH+'\HFACTDAC') ALIAS had
ENDIF
SELE 8
IF ALIAS()#'HAR'
   USE (PATH+'\HFACTRAC') INDEX (PATH+'\HFACTRAC') ALIAS har
ENDIF
=MEN_LIN(BOTOM)
RETURN
