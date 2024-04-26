********************************************************************************
*-- Programa: BVIX3.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : EL 'BATA'
*-- Notas   : BORRA LOS VIAJANTES DE UNA MARCA
*-- Modificaci¢n 04-02-92 12:33pm - GOYO
*-- Modificaci¢n GOYO 07-22-92 11:37pm optimizaci¢n
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	SELE VIX
	=MEN_LIN("Borrando Registros")
	NADA=LEFT(MIX.TEXTO2,2)
	IF FLOCK() .OR. FLOK()
		DELE FOR VIX.MARCA=NADA
		UNLO IN VIX
		=IAUD(MIX.TEXTO1)
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
