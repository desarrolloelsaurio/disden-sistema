********************************************************************************
*-- Programa: OPACT.PRG
*-- Fecha   : 08/26/92
*-- Version : R.'EL BATA'
*-- Notas   : ABRE ARCHIVO ACTUALIZACION
********************************************************************************
=MEN_LIN('Abriendo archivo de Actualizaciones')
SELE 1
IF ALIAS()#'MIX'
   USE (pathpro+'\MIXTA') ORDER TAG ACTTEX ALIAS mix
ELSE
SET ORDER TO TAG ACTTEX
ENDIF
IF ACTpop
   DEFI POPU mixPOP FROM ACTpopr,ACTpopc PROMPT FIELD mix.texto1 MESS 'Elija la Actualizaci¢n' SHAD COLOR SCHE 3 IN SCREEN
   ON SELE POPU mixPOP DO resp1
ENDIF
=MEN_LIN(BOTOM)
RETURN
