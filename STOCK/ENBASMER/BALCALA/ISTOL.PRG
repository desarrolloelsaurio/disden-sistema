********************************************************************************
*-- Programa: iStol.prg
*-- Fecha   : 09/10/91 01:41pm
*-- Version : G. REINER
*-- Notas   : globaliza Stock
*-- VERSION BALCALA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   DO WHILE .T.
      STORE HAYCAMPO("DISCRIM","MER") TO M.HAYDISC
      =MOVEwin(6,10,13+IIF(M.HAYDISC,1,NUL),50,'WIN'," Generaliza Stock ",UPPER(ALLTRIM(JANNAME)))
      STORE '9999999' TO PICU
      STOR NUL TO costorea,cost
      STORE 25 TO COL,col1
      STORE xas1 TO stoc
      STORE xas2 TO stocmin
      STORE xas3 TO stocmax
      STORE xas4 TO stocres
      store nul to stocpes
      nada=mer.articulo
      nada1=mer.merca
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
         @ 5,col get stocpes pict '9999999.99' mess 'Peso Total del Stock'
      ENDIF
      READ
      IF LASTKEY()#27
         IF !empty(stoc) .and. confirma("Stock Ingresado",.t.,20,40)
            ACTI SCRE
            DO WHILE .T.
               STOR NUL TO respuesta
               IF !EMPTY(elimer("  Para Ingresar Stock",-1,10))
                  =men_lin(ALLTRIM(mer->merca))
                  =lock() .or. flok(str(recno()),'mer')
                  REPL stock WITH stoc
                  REPL stockmin WITH stocmin
                  REPL stockmax WITH stocmax
                  REPL stockres WITH stocres
                  if M.HAYDISC .AND. mer.discrim .AND. !EMPTY(STOCPES)
                     repl stockpes with stocpes
                  endif
                  =REPUSE()
                  UNLO IN mer
                  =iaud(alltrim(mer.merca)+'-'+janname)
               ELSE
                  EXIT
               ENDIF
            ENDDO
         ENDIF
      ELSE
         EXIT
      ENDIF
   ENDDO
   =relewin("win")
ELSE
   =iaudi()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
