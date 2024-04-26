********************************************************************************
*-- Programa: ELITEL.PRG
*-- Fecha   : 05-16-92 10:35am
*-- Version : G. REINER
*-- Notas   : ELIGE LA TELA
*-- Modificaci¢n GOYO 05-17-92 00:49am
*-- Modificaci¢n GOYO 30/08/95 15:09
*-- TELA DE MIXTA PARA NAZA
********************************************************************************
FUNCTION ELITEL
PARA MSG,R1,C1
SELE MIX
IF TELPOP
   SET ORDER TO TAG TELTEX
   =men_LIN('Tela '+msg)
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('Tela '+msg,'mix','TELcod')
ENDIF
RETURN RESPUESTA
