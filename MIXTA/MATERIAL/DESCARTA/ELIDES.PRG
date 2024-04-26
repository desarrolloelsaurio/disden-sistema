********************************************************************************
*-- Programa: ELIDES.PRG
*-- Fecha   : 09-26-92 02:29am
*-- Version : G. REINER
*-- Notas   : ELIGE MATERIAL DESCARTABLE
*-- Modif.  : GOYO 05-30-92 08:02pm ELIMIX
********************************************************************************
FUNCTION ELIDES
PARA MSG,R1,C1
SELE MIX
IF DESPOP
   IF !EMPTY(MSG)
      WAIT "Material Descartable "+MSG WIND NOWA
   ENDIF
   SET ORDER TO TAG DESTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
	 RESPUESTA=ELIMIX1('M. Descartable'+MSG,'MIX','DESCOD')
ENDIF
RETURN RESPUESTA
