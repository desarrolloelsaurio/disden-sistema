*******************************************
*-- Programa: IVIAJ.PRG
*-- Fecha   : 06/28/91
*-- Version : V. LEEGSTRA
*-- Notas   : INGRESA LEGAJO DE VIAJANTES
*******************************************
ulpr=hora_ulp(PROGRAM())
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   STORE 20 TO COL
   SELE VIA
   ACTI SCRE
   =men_lin('[TAB] para Grabar - [ESC] para Salir')
   =MOVEWIN(3,1,8,1+mVIAan,'WIN',' Datos del Viajante ')
   =MOVEWIN(8,5,20,75,'WIN1',' Legajo de '+ALLTRIM(VIA.VIAJANTE))
   ACTI WIND win
   @ 1,2 SAY "Cod.Viajante" COLOR SCHE 3
   @ 1,COL GET VIA.CODVIA PICTURE '@X10'
   @ 2,2 SAY "Viajante  " COLOR SCHE 3
   @ 2,COL GET VIA.Viajante PICTURE '@X30'
   CLEAR GETS
   ON KEY LABEL TAB KEYBOARD CHR(23)
   MODI MEMO legajo WINDOW win1
   CLOSE MEMO legajo
	 ON KEY LABEL TAB
   =iaud('I. LEGAJO '+VIA.CODVIA)
   =RELEWIN('win')
   =relewin('win1')
ELSE
   =iaudi()
ENDIF
RETURN
