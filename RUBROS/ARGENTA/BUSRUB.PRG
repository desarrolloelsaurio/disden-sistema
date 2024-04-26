********************************************************************************
*-- Programa: BUSRUB.PRG
*-- Fecha   : 12-10-91
*-- Version : V.LEEGSTRA
*-- Notas   : BUSCA "RUVRO"
********************************************************************************
FUNCTION BUSRUB
PARAMETER QRUB
STORE .F. TO HAY
SCAN
IF CODRUB=QRUB
	 STORE .T. TO HAY
	 EXIT
ENDIF
ENDSCAN
RETURN(HAY)
