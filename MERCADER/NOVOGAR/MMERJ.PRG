* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MMERJ.PRG                                                บ
* บ COMENTARIO    : MUESTRA LEGAJO DE MERCADERIAS                            บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-03-93                                                    บ
* บ HORA       : 11:48:46am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
*-- Modificaciขn GOYO 06-10-92 05:53pm (movewin/auditor)
*-- GOYO PARAMETROS DE APERTURA Y CIERRE
PARAMETER M_ABRE,M_CIERRA
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE 20 TO COL
	SELE mer
	ACTI SCRE
	=MEN_LIN(PADC('[TAB] Prขximo Legajo - [ESC] para Finalizar',80))
	IF M_ABRE
		=MOVEWIN(3,1,8,1+MCLIAN,'WIN',' Datos de la Mercaderกa ')
	ENDIF
	@ 1,2 SAY "Artกculo" COLOR SCHE 3
	@ 1,COL GET MER.ARTICULO PICTURE '@!'
	@ 2,2 SAY "Denominaciขn " COLOR SCHE 3
	@ 2,COL GET MER.MERCA PICTURE '@!'
	CLEAR GETS
	ON KEY LABEL TAB KEYBOARD CHR(23)
	=movewin(8,5,20,75,'win1',' Legajo de '+ALLTRIM(mer.merca)+" ")
	MODI MEMO MERCA1 NOEDIT WINDOW WIN1
	CLOSE MEMO MERCA1
	ON KEY LABEL TAB
	=IAUD(ALLTRIM(MER.ARTICULO)+'-'+MER.MERCA)
	=RELEWIN('win')
	=RELEWIN('win1')
ELSE
	=IAUDI()
ENDIF
RETURN
