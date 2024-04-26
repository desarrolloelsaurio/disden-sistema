****************************************
*-- Programa: BVIAJ.PRG
*-- Fecha   : 05-21-92 12:03pm
*-- Version : E. BANALOTTI
*-- Notas   : BORRA LEGAJO DE VIAJANTES
****************************************
ulpr=HORA_ULP(PROGRAM())
SELE seg
stor PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   stor 20 TO COL
   SELE VIA
   ACTI SCRE
   =men_lin('[ESC] para Salir')
   =MOVEWIN(3,1,8,1+mVIAan,'WIN',' Datos del Viajante ')
   @ 1,2 SAY "Cod.Viajante" COLOR SCHE 3
   @ 1,COL GET VIA.CODVIA PICTURE '@X10'
   @ 2,2 SAY "Viajante  " COLOR SCHE 3
   @ 2,COL GET VIA.Viajante PICTURE '@X30'
   CLEAR GETS
   =MOVEWIN(8,5,20,75,'WIN1',' Borra Legajo de '+ALLTRIM(VIA.Viajante))
   MODI MEMO legajo WINDOW win1 NOWAIT
   ACTI SCRE
   IF confirma('Borrar Legajo ? ',.T.,iVIAr+7,nul)
      REPL VIA.legajo WITH ""
   ENDIF
   CLOSE MEMO VIA.legajo
   =iaud('B. LEGAJO '+VIA.CODVIA)
   =RELEWIN("win1")
   =RELEWIN("win")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
