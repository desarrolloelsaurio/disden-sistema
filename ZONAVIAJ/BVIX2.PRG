********************************************************************************
*-- Programa: BVIX2.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : EL 'BATA'
*-- Notas   : BORRA LOS VIAJANTES DE UNA ZONA
*-- Modificaci¢n 04-02-92 12:35pm
*-- Modificaci¢n GOYO 07-22-92 11:37pm optimizaci¢n
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=MEN_LIN("Borrando Registros")
	NADA=LEFT(MIX.TEXTO2,2)
	SELE VIX
	=FLOCK() .OR. FLOK()
	DELE FOR VIX.ZONA=NADA
	UNLO IN VIX
	=IAUD(MIX.TEXTO1)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
