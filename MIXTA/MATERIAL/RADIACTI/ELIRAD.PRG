********************************************************************************
*-- PROGRAMA: ELIRAD.PRG
*-- FECHA   : 09-26-92 02:29AM
*-- VERSION : G. REINER
*-- NOTAS   : ELIGE MATERIAL RADIACTIVO
*-- MODIF.  : GOYO 05-30-92 08:02PM ELIMIX
********************************************************************************
FUNCTION ELIRAD
PARA MSG,R1,C1
SELE MIX
IF RADPOP
	 SET ORDER TO TAG RADTEX
   ACTI POPUP MIXPOP
   STOR RESPUESTA#0 TO RESPUESTA
ELSE
	 RESPUESTA=ELIMIX1('M. Radiactivo '+MSG,'MIX','RADCOD')
ENDIF
RETURN RESPUESTA
