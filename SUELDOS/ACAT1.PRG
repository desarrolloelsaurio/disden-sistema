********************************************************************************
*-- Programa: acat1.prg
*-- Fecha   : 01/12/91 08:10pm
*-- Version : G. REINER
*-- Notas   : actualiza categorias sumando o multiplicando
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFI WIND win FROM 10,0 TO 16,78 TITL ' C lculo Categor¡as ' SHAD COLOR SCHE 8
@ 24,0 SAY PADC("[ESC] para Men£ - [] Pr¢xima Categor¡a",80,' ')
ACTI WIND win
SELE cat
SCAN
   CLEA
   @ 1,1 SAY ' CATEGORIA               SUELDO         MONTO      PORC        RESULTANTE'
   STORE 0 TO porc,MONT
   GOTO cat->convenio IN con
   @ 3,1 GET con->convenio
   CLEAR GETS
   nada=cat->categoria
   @ 2,1 GET nada
   READ
   IF LASTKEY()=27
      EXIT
   ELSE
      IF LASTKEY()<>24
         @ 2,22 SAY sueldo PICTURE '999999999.99'
         @ 2,37 GET MONT PICTURE '999999999.99'
         @ 2,52 GET porc PICTURE '9999.99'
         READ
         IF MONT<>0 .OR. porc<>0
            IF MONT<>0
               REPL sueldo WITH sueldo+MONT
            ELSE
               IF porc<>0
                  REPL sueldo WITH sueldo+sueldo*porc/100
               ENDIF
            ENDIF
            @ 2,63 GET sueldo PICTURE '999999999.99'
            READ
         ENDIF
      ENDIF
   ENDIF
ENDSCAN
RELE WIND win
RELE porc,MONT
@ 24,0 SAY SPACE(80)
RETURN
