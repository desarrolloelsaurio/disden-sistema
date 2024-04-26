*********************************************************************************
*-- Programa: CKAR.PRG
*-- Fecha   : 06/19/91
*-- Version : V.LEEGSTRA
*-- Notas   : CORRIGE KARDEX
********************************************************************************
STOR RECNO() TO ff
stor STR(ff) TO registro
SELE seg
stor PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   @ 0,36 SAY TIME() COLOR I
   @ 0,47 SAY PADC(ulpr,10) COLOR I
   DEFINE WINDOW win FROM ckarr,ckarc TO ckarr+ckarla,ckarc+ckaran TITL " Correcci¢n Kardex " SHAD COLOR SCHE 8
   SELE kar
do lok with "kar"
         GO FF
         SCAT MEMV
   STOR " Correcci¢n Kardex - " TO me1
   STOR 24 TO COL
   STOR .F. TO kok
   stor .T. TO sigue
   SCAT MEMV
   DO mkar
   stor 0 TO respuesta
   ACTI WIND win
   stor qtip(m.tipo) TO nada
   @ 1,COL GET nada MESS ten+' - [ESC] para Men£'
   READ
   IF LASTKEY()#27
      IF updated()
         stor SPACE(11) TO nada
         pct='@M '+tellas+','+abios
         @ 1,COL GET nada PICT pct MESS "Ingrese el tipo de Producto - [ESC] para Men£"
         READ
         stor nada TO m.tipo
      ENDIF
      stor m.articulo TO nada1
      @ 2,COL GET nada1 MESS ten+" - [ESC] para Men£"
      READ
      IF LASTKEY()#27
         IF m.tipo=LEFT(tellas,1)
            stor (" - La unidad de "+ALLTRIM(nada)+" es "+unid(6)) TO nada2
         ELSE
            stor (" - La unidad de "+ALLTRIM(nada)+" es "+unid(3)) TO nada2
         ENDIF
         IF updated()
            stor 0 TO respuesta
            IF m.tipo=LEFT(tellas,1)
               DO WHILE empty(elitel(" Art¡culo",2,COL))
                  ACTI WIND win
               ENDDO
               stor tel.telcod TO m.articulo
               stor m.articulo TO nada
               stor tel.tela TO nada1
            ELSE
               DO WHILE empty(eliavi(" Art¡culo",2,COL))
                  ACTI WIND win
               ENDDO
               stor avi.avicod TO m.articulo
               stor m.articulo TO nada
               stor avi.avios TO nada1
            ENDIF
            SELE kar
            ACTI WIND win
            @ 2,COL GET nada
            @ 3,COL GET nada1
            CLEAR GETS
         ENDIF
         @ 4,COL GET m.fechaop;
            MESS "Corrige fecha de la operaci¢n - [ESC] para Men£"
         READ
         IF LASTKEY()#27
            SELE kar
            GOTO ff
            ACTI WIND win
            GOTO kar.taller IN tal
            stor tal.talleres TO nada3
            @ 5,COL GET nada3;
               MESS ten+" Taller"
            READ
            IF updated()
               stor 0 TO respuesta
               DO WHILE empty(elital(" del KARDEX ",4,COL))
                  ACTI WIND win
               ENDDO
               m.taller=RECNO()
               nada3=tal.talleres
               ACTI WIND win
               SELE kar
               @ 5,COL GET nada3
               CLEAR GETS
            ENDIF
            GOTO kar.opk IN opk
            stor opk.operacion TO nada4
            @ 6,COL GET nada4;
               MESS ten+" Operaci¢n"
            READ
            IF updated()
               stor 0 TO respuesta
               DO WHILE empty(eliopk(" del KARDEX ",5,COL))
                  ACTI WIND win
               ENDDO
               m.opk=RECNO()
               nada4=opk.operacion
               m.detalle=opk.detalle
               ACTI WIND win
               SELE kar
               @ 6,COL GET nada4
               CLEAR GETS
            ENDIF
            nada5=opk.consecu
            nada5=LEFT(nada5,1)
            stor m.detalle TO nada
            @ 7,COL GET nada PICTURE "@!"
            READ
            DO CASE
            CASE nada5="S"
               @ 8,2 SAY "Entrada               " COLO SCHE 3
               stor m.entrada TO nada6
               @ 8,COL GET nada6 PICTURE "9999999.99" MESS "Entrada "+nada2
               READ
            CASE nada5="R"
               @ 8,2 SAY "Salida                " COLO SCHE 3
               stor m.salida TO nada6
               @ 8,COL GET nada6 PICTURE "9999999.99" MESS "Salida "+nada2
               READ
            ENDCASE
            ACTI SCRE
            stor " " TO nada,nada1,nada2,nada3,nada4,nada5,nada6
            IF confirma ("las correcciones",.T.,18,0)
               ACTI SCRE
               @ 24,0 SAY grabando COLO SCHE 19
               SELE kar
               GOTO ff
               GATH MEMV
do repuse
               STOR .T. TO kok
            ENDIF
         ENDIF
      ENDIF
   ENDIF
               UNLO IN kar
   IF kok
            do iaud WITH 'COR Kardex '+m.articulo
   ENDIF
   RELE WIND win
ELSE
         do iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: CKAR.PRG
