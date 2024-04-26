********************************************************************************
*-- Programa: ICHED.PRG
*-- Fecha   : 02-26-93 05:20pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DIRECTO DE VALORES DIFERIDOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DIJO=ALLTRIM(PROMPT())
	STORE NUL TO RESPUESTA
	IF ELIGAS("a Imputar el Ingreso",-1,1)
		M.ELGASTO=MIX.TEXTO2
		dime FAXT[1]
		DO CASE
		case DIJO="Cheques"
			if !empty(icch(@FAXT,.t.,20,'CH'))
				=iched1("CH")
			endif
		case DIJO="Tarjetas de Cr‚dito"
			if !empty(icch(@FAXT,.t.,20,'TA'))
				=iched1("TA")
			endif
		case DIJO="Documentos"
			if !empty(icch(@FAXT,.t.,20,'DO'))
				=iched1("DO")
			endif
		ENDCASE
	ENDIF
ELSE
	=IAUDI()
ENDIF
=men_lin(botom)
RETURN
