* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : APRE.PRG                        บ
* บ COMENTARIO    : GENERA ACTUALIZACION DE PRECIOS บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                        บ
* บ FECHA      : 11-19-93                           บ
* บ HORA       : 00:36:59am                         บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER            บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	TT=''
	FISC=QWMER(BAR())
	IF FISC#'.F.'
		TT='Actualizaciขn Precios'+tt
		DO APRE1
	ENDIF
ELSE
	=IAUDI()
ENDIF
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
