********************************************************************************
*-- Programa: ELImat.PRG
*-- Fecha   : 05-16-92 10:35am
*-- Version : G. REINER
*-- Notas   : ELIGE MATERIAL
*-- Modificaci¢n GOYO 05-16-92 10:11pm
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION ELIMAT
PARA MSG,R1,C1
SELE MIX
IF MATPOP
   =MEN_LIN(MADER+' '+MSG)
   SET ORDER TO TAG MATTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1(MADER+' '+MSG,'MIX','MATCOD')
ENDIF
RETURN RESPUESTA
