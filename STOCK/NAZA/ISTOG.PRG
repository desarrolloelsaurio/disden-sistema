********************************************************************************
*-- Programa: IPREG.PRG
*-- Fecha   : 09/05/91 06:03pm
*-- Version : G. REINER
*-- Notas   : INGRESA StockS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   DO WHILE .T.
      STOR NUL TO respuesta
      STORE 20 TO COL
      IF !EMPTY(elimer(" a Ingresar",-1,10))
         defi wind win FROM 4,10 TO 15,60 TITL " Ingreso de Stocks - Producto "+ALLTRIM(merca) SHAD colo sche 8
         nada=mer.articulo
         nada1=mer.merca
         FOR j=xatalmin TO xatalmax STEP xatalstep
            rtc=LEFT(mer.articulo,13)+zero(j*10,3)
            SELE PRE
            IF !SEEK(rtc)
               STORE xas1 TO stoc
               STORE xas2 TO stocmin
               STORE xas3 TO stocmax
               STORE xas4 TO stocres
            ELSE
               STOR stock TO STOC
               STOR stockmin TO STOCMIN
               STOR stockmax TO stocmax
               STOR stockres TO stocres
            ENDIF
            ACTI WIND win
            @ 1,2 SAY "ARTICULO:" GET nada
            @ 2,2 SAY "PRODUCTO:" GET nada1
            @ 3,2 SAY "TALLE   :" GET j PICT IIF(INT(j)=j,'999','99.9')
            CLEA GETS
            @ 5,1 SAY 'STOCK' COLO SCHE 3
            @ 6,1 SAY 'STOCK MINIMO' COLO SCHE 3
            @ 7,1 SAY 'STOCK MAXIMO' COLO SCHE 3
            @ 8,1 SAY 'STOCK RESERVADO' COLO SCHE 3
            on key label Dnarrow do salto
            @ 5,COL GET stoc PICT '9999999' MESS 'Stock Disponible - [] Para Pr¢ximo talle sin grabar'
            @ 6,COL GET stocmin PICT '9999999' RANGE 1,9999999 MESS 'Stock M¡nimo - [] Para Pr¢ximo talle sin grabar'
            @ 7,COL GET stocmax PICT '9999999' RANGE stocmin,999999 MESS 'Stock M ximo - [] Para Pr¢ximo talle sin grabar'
            @ 8,COL GET stocres PICT '9999999' MESS 'Stock Reservado - [] Para Pr¢ximo talle sin grabar'
            READ
            on key label dnarrow
            IF LASTKEY()#27
               if lastkey()#1
                  IF !EMPTY(stOC)
                     SELE pre
                     IF !SEEK(rtc)
                        SELE pre
                        DO flok WITH "pre"
                        APPE BLAN
                     ENDIF
                     REPL articulo WITH rtc
                     REPL stock WITH stoc
                     REPL stockmin WITH stocmin
                     REPL stockmax WITH stocmax
                     REPL stockres WITH stocres
                     =REPUSE()
                     REPL hora WITH TIME()
                     UNLO IN pre
                     =iaud(alltrim(rtc)+'-'+alltrim(str(stoc)))
                  ENDIF
               endif
            ELSE
               EXIT
            ENDIF
            DEAC WIND win
				 ENDF
      ELSE
         EXIT
      ENDIF
   ENDDO
ELSE
   =iaudi()
ENDIF
DEAC WIND ALL
on key label dnarrow
RETURN MEN_LIN(BOTOM)
