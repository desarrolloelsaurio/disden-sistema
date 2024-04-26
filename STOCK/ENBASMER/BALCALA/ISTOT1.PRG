********************************************************************************
*-- Programa: IStoT1.PRG
*-- Fecha   : 09/09/91 06:20pm
*-- Version : G. REINER
*-- Notas   : GENERALIZA Stock
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   STORE HAYCAMPO("DISCRIM","MER") TO M.HAYDISC
   =POPCARTE(TT)
   =movewin(6,10,13+IIF(M.HAYDISC,1,NUL),60,'win'," Generaliza Stock ",upper(alltrim(janname)))
   STORE '9999999' TO PICU
   STORE 25 TO COL,COL1
   STORE xas1 TO m.stoc
   STORE xas2 TO m.stocmin
   STORE xas3 TO m.stocmax
   STORE xas4 TO m.stocres
   store nul to m.stocpes
   @ 1,1 SAY 'STOCK' COLO SCHE 3
   @ 2,1 SAY 'STOCK MINIMO' COLO SCHE 3
   @ 3,1 SAY 'STOCK MAXIMO' COLO SCHE 3
   @ 4,1 SAY 'STOCK RESERVADO' COLO SCHE 3
   IF M.HAYDISC
      @ 5,1 say 'PESO TOTAL' COLO SCHE 3
   ENDIF
   @ 1,COL GET stoc PICT PICU MESS 'Stock Disponible'
   @ 2,COL GET stocmin PICT PICU RANGE 1,9999999 MESS 'Stock M¡nimo'
   @ 3,COL GET stocmax PICT PICU RANGE stocmin,999999 MESS 'Stock M ximo'
   @ 4,COL GET stocres PICT PICU MESS 'Stock Reservado'
   IF M.HAYDISC
      @ 5,COL GET stocPES PICT '9999999.99' MESS 'Peso Total'
   ENDIF
   READ
   IF LASTKEY()#27
      IF !empty(stoc) .and. confirma("Stock Ingresado",.t.,20,40)
         ACTI SCRE
         SELE mer
         SCAN FOR &fisc
            =men_lin(mer.merca)
            =lock() .or lok(str(recno()),"pre")
            repl stock with stoc
            repl stockmin with stocmin
            repl stockmax with stocmax
            repl stockres with stocres
            if M.HAYDISC .AND. mer.discrim .AND. !EMPTY(STOCPES)
               repl stockpes with stocpes
            ENDIF
            =REPUSE()
            UNLO IN mer
            =iaud(alltrim(mer.articulo)+'-'+janname)
         ENDSCAN
      ENDIF
   ENDIF
   =relewin("win")
   RELE WIND POPCARTE
ELSE
   =iaudi()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
