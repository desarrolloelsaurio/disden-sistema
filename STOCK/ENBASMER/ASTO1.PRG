********************************************************************************
*-- Programa: aSto1.prg
*-- Fecha   : 09/10/91 03:21pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZACION DE Stock
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   M.HAYDISC=HAYCAMPO("DISCRIM","MER")
   M.HAYHORA=HAYCAMPO("HORA","MER")   
   M.PICU="@M NO,SI"
   =POPCARTE(TT)
   =MOVEWIN(5,10,20+IIF(M.HAYDISC,1,NUL),72,"WIN"," Actualizaciขn de Stock ")
   STORE SPACE(15) TO tipo
   @ 1,1 SAY "TIPO DE ACTUALIZACION" GET tipo PICT "@M Porcentaje,Suma,Reemplaza" MESS 'Tipo de Actualizaciขn'
   @ 2,1 SAY "MONTO                " COLO SCHE 3
   READ
   IF LASTKEY()#27
      STOR NUL TO tomon
      IF tipo="P"
         @ 2,1 SAY "PORCENTAJE           " GET tomon PICT '999999999.99'
      ELSE
         @ 2,1 SAY "CANTIDAD             " GET tomon PICT '999999999.99'
      ENDIF
      READ
      IF LASTKEY()#27 .AND. tomon#0
         tipo=LEFT(tipo,1)
         IF tipo='P'
            tomon=1+(tomon/100)
         ENDIF
         STORE 'NO' TO stoc,stocmin,stocmax,stocres,stocpes
         @ 4,1 SAY "ษออออออออออออออออออออออออออหอออออออออออออออออออออออออออออป" COLO SCHE 3
         @ 5,1 SAY "บ  CONCEPTO A ACTUALIZAR   บ  ACTUALIZA EL CONCEPTO ?    บ" COLO SCHE 3
         @ 6,1 SAY "ฬออออออออออออออออออออออออออฮอออออออออออออออออออออออออออออน" COLO SCHE 3
         FOR A=7 TO 10+IIF(M.HAYDISC,1,NUL)
            @ A,1 SAY "บ                          บ                             บ" COLO SCHE 3
         ENDFOR
         @ A,1 SAY "ศออออออออออออออออออออออออออสอออออออออออออออออออออออออออออผ" colo sche 3
         @ 7,4 SAY 'STOCK DISPONIBLE' COLO SCHE 3
         @ 8,4 SAY 'STOCK MINIMO' COLO SCHE 3
         @ 9,4 SAY 'STOCK MAXIMO' COLO SCHE 3
         @ 10,4 SAY 'STOCK RESERVADO' COLO SCHE 3
         IF M.HAYDISC
            @ 10,4 SAY 'STOCK EN PESO' COLO SCHE 3
         ENDIF
         STORE 40 TO COL
         @ 7,COL GET STOC PICT PICU MESS 'Actualiza Stock Disponible'
         @ 8,COL GET STOCMIN PICT PICU MESS 'Actualiza Stock Mกnimo'
         @ 9,COL GET STOCMAX PICT PICU MESS 'Actualiza Stock M ximo'
         @ 10,COL GET STOCRES PICT PICU MESS 'Actualiza Stock Reservado'
         IF M.HAYDISC
            @ 11,COL GET STOCPES PICT PICU MESS 'Actualiza en Peso'
         ENDIF
         READ
         IF LASTKEY()#27
            IF stoc='SI' .OR. STOCMIN='SI' .OR. STOCMAX='SI' .OR. STOCRES='SI' .OR. (STOCPES='SI' .and. m.haydisc)
               IF CONFIRMA("STOCK INGRESADO",.T.,20,40)
                  SELE mer
                  SCAN FOR &fisc
                     =MEN_LIN(ALLTRIM(MER.MERCA))
                     =FLOCK() .OR flok("pre")
                     IF tipo='S'
                        IF STOC='SI'
                           REPL STOCK WITH STOCK+tomon
                        ENDIF
                        IF STOCMIN='SI'
                           REPL STOCKMIN WITH STOCKMIN+tomon
                        ENDIF
                        IF STOCMAX='SI'
                           REPL STOCKMAX WITH StocKMAX+tomon
                        ENDIF
                        IF StocRES='SI'
                           REPL StocKRES WITH StocKRES+tomon
                        ENDIF
                        IF M.HAYDISC .AND. MER.DISCRIM .AND. StocPES='SI'
                           REPL StocKPES WITH StocKPES+tomon
                        ENDIF
                     ELSE
                        IF tipo='R'
                           IF STOC='SI'
                              REPL STOCK WITH tomon
                           ENDIF
                           IF STOCMIN='SI'
                              REPL STOCKMIN WITH tomon
                           ENDIF
                           IF STOCMAX='SI'
                              REPL STOCKMAX WITH tomon
                           ENDIF
                           IF StocRES='SI'
                              REPL StocKRES WITH tomon
                           ENDIF
                           IF M.HAYDISC .AND. MER.DISCRIM .AND. StocPES='SI'
                              REPL StocKPES WITH tomon
                           ENDIF
                        ELSE
                           IF STOC='SI'
                              REPL STOCK WITH STOCK*tomon
                           ENDIF
                           IF STOCMIN='SI'
                              REPL STOCKMIN WITH STOCKMIN*tomon
                           ENDIF
                           IF STOCMAX='SI'
                              REPL STOCKMAX WITH StocKMAX*tomon
                           ENDIF
                           IF StocRES='SI'
                              REPL StocKRES WITH StocKRES*tomon
                           ENDIF
                           IF M.HAYDISC .AND. MER.DISCRIM .AND. StocPES='SI'
                              REPL StocKPES WITH StocKPES*tomon
                           ENDIF
                        ENDIF
                     ENDIF
                     =repuse()
                     IF M.HAYHORA
                     REPL hora WITH TIME()
                     ENDIF
                     UNLO IN MER
                     =iaud(mer.articulo)
                     SELE mer
                  ENDSCAN
               ENDIF
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   =relewin("WIN")
   RELE WIND POPCARTE
ELSE
   =iaudi()
ENDIF
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)
