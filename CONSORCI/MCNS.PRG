********************************************************************************
*-- Programa: MCNS.PRG
*-- Fecha   : 01-18-92 08:44am
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA consorcios
*-- Modificaci¢n GOYO 05-30-92 10:26am (cambio busciu por XSEEK)
********************************************************************************
FUNCTION MCNS
	PARAMETER COSA
	ACTI WIND WIN
	CLEA
	@ 1,2 SAY "CODIGO" COLO SCHE 3
	@ 2,2 SAY "CONSORCIO " COLO SCHE 3
	@ 3,2 SAY "DIRECCION" COLO SCHE 3
	@ 4,2 SAY "LOCALIDAD" COLO SCHE 3
	IF COSA
		@ 1,COL GET M.CONCOD     PICT "@!"
		@ 2,COL GET M.CONSORCIO  PICT "@!"
		@ 3,COL GET M.DIRECCION  PICT "@X"
		IF XSEEK(M.LOCALIDAD,'MIX','CIUCOD')
			STORE MIX.TEXTO1 TO NADA
			@ 4,COL GET NADA
		ENDIF
		SELE CNS
		CLEAR GETS
	ENDIF
RETURN
