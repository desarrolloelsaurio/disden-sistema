********************************************************************************
*-- Programa: OPRCB.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO RECIBOS
********************************************************************************
=MEN_LIN('Abriendo archivo de Recibos')
IF !USED("rcb")
   =PRXAREA(.T.)
    USE (pathVEN+'\RECIBO') ORDER TAG NUMERO ALIAS rcb
ENDIF
RETURN MEN_LIN(BOTOM)
