********************************************************************************
*-- Programa: OPCAT.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO CATEDRAS-MERCADERIAS
********************************************************************************
=MEN_LIN('Abriendo archivo de Cátedras')
IF !USED("CAT")
   =PRXAREA(.T.)
    USE (pathVEN+'\CATEDRAS') ORDER TAG CATEDRA ALIAS CAT
ELSE
   SELE CAT    
ENDIF
RETURN MEN_LIN(BOTOM)
