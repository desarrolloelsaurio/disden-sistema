**********************************************
*-- Programa: LFACPZ1.PRG
*-- Fecha   : 09-29-92 01:41pm
*-- Version : G. REINER
*-- Notas   : FUNCION DE IMPRESION DE NUMEROS
**********************************************
FUNCTION LFACPZ1
	PARAMETER POSICION,NUMERO
	PRIVATE POSICION,NUMERO
		M=ABS(NUMERO)
		IF FAC.TIPO='NC'
			?? str(0-m,xacdigi,2)
			ttl[POSICION]=ttl[POSICION]-m
		ELSE
			?? str(m,xacdigi,2)
			ttl[POSICION]=ttl[POSICION]+m
		ENDIF
		?? paip
		CTRL[POSICION]=.T.
RETURN .T.
