*********************************************
*-- Programa: ELICOL.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : G. REINER
*-- Notas   : ELIGE EL COLOR
*-- Modif.  : GOYO 05-30-92 07:22pm (ELIMIX)
*********************************************
FUNCTION ELICOL
PARA MSG,R1,C1
SELE MIX
STORE 0 TO RESPUESTA
IF COLPOP
   SET ORDER TO TAG COLTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('COLOR '+MSG,'MIX','COLCOD')
ENDIF
RETURN RESPUESTA
