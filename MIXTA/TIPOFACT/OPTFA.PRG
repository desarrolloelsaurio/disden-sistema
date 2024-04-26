********************************************************************************
*-- Programa: OPTFA.PRG
*-- Fecha   : 09-26-92 02:27am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE TIPO DE FACTURACION
********************************************************************************
=men_lin('Abriendo archivo de Tipos de Facturaci¢n')
SELE 1
IF ALIAS()#'MIX'
   USE (PATH+'\MIXTA') ORDER TAG TFATEX ALIAS mix
ELSE
   SET ORDER TO TAG TFATEX
ENDIF
IF UNIPOP
   =DEFPOMIX(UNIpopr,UNIpopc)
ENDIF
=MEN_LIN(BOTOM)
RETURN
