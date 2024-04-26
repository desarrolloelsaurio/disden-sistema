********************************************************************************
*-- Programa: OPPLA.PRG
*-- Fecha   : 06/27/91
*-- Version : V.LEEGSTRA
*-- Notas   : ABRE ARCHIVO PLANILLAS
********************************************************************************
=MEN_LIN('Abriendo archivo de Facturas')
SELE 25
IF ALIAS()#'PLA'
   USE (PATH+'\PLANILLA') ALIAS pla
ENDIF
=MEN_LIN(BOTOM)
RETURN
