****************************************
*-- Programa: ELITHO.PRG
*-- Fecha   : 10-11-92 01:02pm
*-- Version : G. REINER
*-- Notas   : ELIGE EL TIPO DE HORA
*-- Modificaci¢n GOYO 26/10/95 13:28
****************************************
FUNCTION ELITHO
PARA MSG,R1,C1
SELE MIX
IF THOPOP
   SET ORDER TO TAG THOTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('Tipo de Hora '+msg,'MIX','THOCOD')
ENDIF
RETURN RESPUESTA
