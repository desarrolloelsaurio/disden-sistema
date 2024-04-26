****************************************************
*-- Programa: BVIX1.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : EL 'BATA'
*-- Notas   : BORRA LAS ZONAS DE UN VIAJANTE
*-- Modificaci¢n 04-02-92 12:48pm
*-- Modificaci¢n GOYO 07-22-92 11:37pm optimizaci¢n
****************************************************
STOR HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE VIX
	=FLOCK() .OR. FLOK("VIX")
	=MEN_LIN("Borrando Registros ...")
	DELE FOR VIX.CODVIA=VIA.CODVIA
	UNLO IN VIX
	=IAUD(VIX.CODVIA)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
