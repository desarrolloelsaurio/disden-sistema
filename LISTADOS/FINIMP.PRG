* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FINIMP.PRG                                               บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION FINIMP
	#DEFINE BOTOM  "  "+repl("ฐ",78)              && BOTOM
	ON KEY
	ON KEY LABEL SHIFT-F1 DO HLP
	IF GETENV("USERNAME")#"GOYO" .AND. GETENV("USERNAME")#"BATA"
		ON ERROR DO ERROR
	ENDIF
	SET DEVI TO SCRE
	SET CONS ON
	SET PRIN TO
	SET PRINT OFF
	SET PRIN TO LPT1
	SET MESS TO SPACE(78)
	_RMARGIN=80
	_WRAP=.F.
	_PCOPIES=1
	IF GETENV("EQUIPO")#"MICASA"
		=BEEP(3)
	ENDIF
	IF GETENV("PRN")="BROTHER"
		=RESETPR()
	ENDIF
RETURN WNCL("IMPRESION FINALIZADA") .AND. MEN_LIN(BOTOM)
