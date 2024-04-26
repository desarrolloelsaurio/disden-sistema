********************************************************************************
*-- Programa: skar.prg
*-- Fecha   : 08/22/91 04:22pm
*-- Version : G. REINER
*-- Notas   : salda kardex - calcula saldos anteriores
********************************************************************************
SELE seg
tx=""
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   ulpr=PROGRAM()
   @ 0,36 SAY TIME() COLOR I
   @ 0,47 SAY PADC(PROGRAM(),10,' ') COLOR I
   DO CASE
   CASE BAR()=1
      IF confirma("Borrar el Calcular saldos de Kardex COMPLETO ? ",.T.,10,2)
         =OPMER()
         SELE kar
         do flok with "kar"
         DELE ALL
         tx='ZAP '
         UNLO IN KAR
      ENDIF
   CASE BAR()=2
      IF confirma("Borrar "+abios+" del Archivo de Kardex ? ",.T.,10,2)
         SELE kar
         do flok with "kar"
         @ 24,0 SAY PADC(" Borrando "+abios+" del Archivo de Kardex ",80,"*") COLO SCHE 19
         DELE FOR tipo=LEFT(abio,1)
         tx='BORRA '+UPPER(abios)+' '
         UNLO IN KAR
      ENDIF
   CASE BAR()=3
      IF confirma("Borrar "+tellas+" del Archivo de Kardex ? ",.T.,10,2)
         SELE kar
            @ 24,0 SAY PADC(" Borrando "+tellas+" del Archivo de Kardex ",80,"*") COLO SCHE 19
            SELE kar
            do flok with "kar"
            DELE FOR tipo=LEFT(tella,1)
            tx='BORRA '+UPPER(tellas)+' '
            UNLO IN KAR
         ENDIF
      CASE BAR()=4
         STORE 0 TO respuesta
         IF eliavi(" a Borrar")#0
            IF confirma("Borrar "+ALLTRIM(avi->avios)+" del Archivo de Kardex ? ",.T.,10,2)
               SELE kar
               @ 24,0 SAY PADC(" Borrando "+ALLTRIM(avi->avios)+" del Archivo de Kardex ",80,"*") COLO SCHE 19
               SELE kar
               do flok with "kar"
               DELE FOR tipo=LEFT(abio,1) .AND. articulo=avi->avicod
               tx='BORRA '+UPPER(abio)+' '+avi->avios
               UNLO IN KAR
            ENDIF
         ENDIF
      CASE BAR()=5
         STORE 0 TO respuesta
         IF elitel(" a Borrar")#0
            IF confirma("Borrar "+ALLTRIM(tel->tela)+" del Archivo de Kardex ? ",.T.,10,2)
               SELE kar
               @ 24,0 SAY PADC(" Borrando "+ALLTRIM(tel->tela)+" del Archivo de Kardex ",80,"*") COLO SCHE 19
               SELE kar
               do flok with "kar"
               DELE FOR tipo=LEFT(tella,1) .AND. articulo=tel->telcod
               tx='BORRA '+UPPER(tella)+' '+tel->tela
               UNLO IN KAR
            ENDIF
         ENDIF
      ENDCASE
      IF !EMPTY(tx)
         do iaud WITH tx+' KARDEX'
      ENDIF
   ELSE
      RELE WIND win
      do iaud WITH 'ING ILEGAL '+ulpr
   ENDIF
   ulpr=PROGRAM()
   @ 24,0 SAY SPACE(80)
   RETURN
   *: EOF: BKAR.PRG
* EOF - INDENT
