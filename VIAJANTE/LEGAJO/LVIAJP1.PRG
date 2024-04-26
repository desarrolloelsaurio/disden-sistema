********************************************************************************
*-- Programa: LVIAJP1.PRG
*-- Fecha   : 05-21-92 11:44am
*-- Version : E. BANALOTTI
*-- Notas   : LISTADO LEGAJO DE VIAJANTES POR PANTALLLA
********************************************************************************
SELE VIA
set order to Viajante
fisc=fisc+' .and. !empty(legajo)'
SCAN FOR &fisc
DO mVIAj
	 IF LASTKEY()=27
      EXIT
   ENDIF
ENDSCAN
RETURN
