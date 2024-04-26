***************************************
*-- Programa: ELIESP.PRG
*-- Fecha   : 09-27-92 10:56am
*-- Version : G. REINER
*-- Notas   : ELIGE LA ESPECIALIDAD
*-- Modificaci¢n GOYO 05-17-92 00:49am
***************************************
FUNCTION ELIESP
PARA MSG,R1,C1
SELE MIX
IF ESPPOP
   IF !EMPTY(MSG)
      WAIT "Especialidad "+MSG WIND NOWA
   ENDIF
   SET ORDER TO TAG ESPTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('Especialidad '+msg,'MIX','ESPCOD')
ENDIF
RETURN RESPUESTA
