FUNCTION ELICHE
	PARAMETER SOLOUNO
	SELE CCH
	=FLOCK() .OR. FLOK('CCH')
	REPL ALL SELECCION WITH ' '
	UNLO IN CCH
	DEFI WIND ELICCH FROM 0,0 TO 12,60 TITL 'ELIJA CHEQUES' COLO SCHE 8
	IF SOLOUNO
		=MEN_LIN('[ENTER] SELECCIONA / [ESC] SALE')
		ON KEY LABEL ENTER KEYBOARD '*'+CHR(23)
	ELSE
		=MEN_LIN('[ENTER] SELECCIONA / [TAB] SUMA SELECCION / [ESC] SALE')
		ON KEY LABEL TAB A=SUMCCH()
	ENDIF
	BROW FIELD SELECCION:P='X':H='Elige',;
	BANCO:R,;
	NROCHE:R:H="N� de Cheque",;
	MONTO:P='99,999,999.99';
	FREE SELECCION;
	WIND ELICCH
	ON KEY LABEL ENTER
	ON KEY LABEL TAB
	RESPUESTA=RECNO()
RETURN SUMCCH(.T.)
FUNCTION SUMCCH
	PARAMETER SCCH
	PRIVATE SCCH
	SUM MONTO FOR !EMPTY(SELECCION) TO XX
	IF SOLOUNO
		=MOVEWIN(0,55,3,79,'SUMCCH','SUMA DE CHEQUES')
		CLEA
		@ 0,0 SAY 'SUMA:' GET XX PICT '99,999,999.99'
		CLEA GETS
		IF SCCH
			=RELEWIN("SUMCCH")
		ENDIF
	ENDIF
RETURN XX
