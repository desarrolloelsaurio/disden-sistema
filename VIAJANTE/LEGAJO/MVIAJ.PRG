********************************************************************************
*-- Programa: mVIAJ.PRG
*-- Fecha   : 06/28/91
*-- Version : g. reiner
*-- Notas   : MUESTRA LEGAJO DE Viajantes
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
SELE seg
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   =hora_ulp()
   STORE 20 TO COL
   SELE VIA
   ACTI SCRE
   =MEN_LIN(PADC('[TAB] para Pr¢ximo - [ESC] para Finalizar',80))
   DEFI WIND win FROM 3,1 TO 8,1+mVIAan DOUBLE TITLE ' Datos del Viajante ' SHAD COLO SCHE 8
   DEFI WIND win1 FROM 8,5 TO 20,75 DOUBLE TITLE ' Legajo de '+ALLTRIM(VIA->VIAJANTE)+" " SHAD COLO SCHE 8
   ACTI WIND win
   @ 1,2 SAY "Cod.Viajante" COLOR SCHE 3
   @ 1,COL GET VIA->CODVIA PICTURE '@X10'
   @ 2,2 SAY "Viajante    " COLOR SCHE 3
   @ 2,COL GET VIA->VIAJANTE PICTURE '@X30'
   CLEAR GETS
   ON KEY LABEL TAB KEYBOARD CHR(23)
	 MODI MEMO legajo NOEDIT WINDOW win1
   CLOSE MEMO legajo
	 on key label tab
   =iaud('L. LEGAJO '+VIA->CODVIA)
   =RELEWIN('win')
   =RELEWIN('win1')
ELSE
   =iaudi()
ENDIF
RETURN
