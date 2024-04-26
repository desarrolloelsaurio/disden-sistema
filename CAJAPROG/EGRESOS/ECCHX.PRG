********************************************************************************
*-- Programa: ECCHX.PRG
*-- Fecha   : 02-26-93 05:20pm
*-- Version : G. REINER
*-- Notas   : SALIDA DE CHEQUES DE TERCEROS (SIN JUSTIFICACION)
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DIJO=ALLTRIM(PROMPT())
	STORE NUL TO RESPUESTA
	IF ELIGAS("a Imputar el Egreso",-1,1)
		M.ELGASTO=MIX.TEXTO2
		dime FAXT[1]
		DO CASE
		case DIJO="Cheques"
			if elicchp()
				=ECCHX1("CH")
			endif
		case DIJO="Tarjetas de Cr‚dito"
			if !empty(icch(@FAXT,.t.,20,'TA'))
				=ECCHX1("TA")
			endif
		case DIJO="Documentos"
			if !empty(icch(@FAXT,.t.,20,'DO'))
				=ECCHX1("DO")
			endif
		ENDCASE
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN men_lin(botom)
