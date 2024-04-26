********************************************************************************
*-- Name....: INDATMER.PRG
*-- Date....: 26/9/89
*-- Version.: G. REINER
*-- Notes...: INGRESO DATOS MERCADERIAS
*--           VIENE DE MERCA
********************************************************************************
FINMER=RECCOUNT("MER")
SET ORDER TO TAG ARTIC
 
STOR .T. TO SIGUE
 
DO WHIL SIGUE
   STOR SPACE(15) TO art
   STOR SPACE(40) TO det
   STOR NUL TO pro,cos
   STOR 6 TO cosr
   STOR 11 TO my
   STOR 16 TO my3
   STOR 21 TO mn
   STOR 42.86 TO mn3
   STOR space(10) TO mk
   STOR 'Si' TO IV
   @ 0,37 TO 4,52
   @ 1,38 SAY "FICHA:" COLOR wi/n
   @ 1,45 SAY STR(FINMER,5)
   @ 2,38 SAY "FECHA:" COLOR wi/n
   @ 2,44 SAY date()
   @ 3,0 TO 10,56 DOUB
   @ 3,38 SAY "HORA :" COLOR wi/n
   @ 3,44 SAY time() PICT "XXXXXXXX"
   @ 4,1 SAY "ARTICULO" COLOR w+/n
   @ 4,16 GET art PICT "@X" ;
     MESS 'Tecla ENTER para Menu'
   DO TIT1 WITH 6,'    XXX -> TITULO    ','N/I*'
   READ
 
   IF ISALPHA(ART)
      @ 6,2 CLEAR TO 8,55
      @ 5,1 SAY "DESCRIPCION" COLOR w+/n
      @ 5,16 GET det PICT "@XXXX"
      READ
 
      IF LEN(RTRIM(ART))#3
         @ 6,1 SAY "PROVEEDOR" COLOR w+/n
         SELE PRO
         SET ORDER TO TAG FIRMA
         RESPUESTA=0
         ACTI SCREEN
         DO WHIL EMPTY(RESPUESTA)
            ACTI POPU PROPOP
         ENDD
         GO TOP
         SKIP RESPUESTA-1
         STOR RECNO() TO PRO
         GO PRO
         ACTI WIND WIN
         @ 6,16 SAY LEFT(PRO.FIRMA,15) COLO SCHE 24
         SELE MER
         @ 6,32 SAY "I.V.A." COLOR w+/n
         @ 6,54 GET iv PICT "@M Si,No" ;
           MESS CAM_OPC
         @ 7,1 SAY "Pcio. COSTO" COLOR w+/n
         @ 7,16 GET cos PICT "9999999.99"
         @ 7,32 SAY "% COSTO REAL" COLOR w+/n
         @ 7,50 GET cosr PICT "999.99"
         @ 8,1 SAY "% MAYORISTA" COLOR w+/n
         @ 8,20 GET my PICT "999.99"
         @ 8,32 SAY "% MAYORISTA 30 Ds" COLOR w+/n
         @ 8,50 GET my3 PICT "999.99"
         @ 9,1 SAY "% MINORISTA" COLOR w+/n
         @ 9,20 GET mn PICT "999.99"
         @ 9,32 SAY "% MINORISTA 30 Ds" COLOR w+/n
         @ 9,50 GET mn3 PICT "999.99"
         READ
      ENDI
 
      APPEND BLANK
      REPL artic WITH art
      REPL detalle WITH det
      FINMER=FINMER+1
 
      IF LEN(RTRIM(ART))=3
         REPL PROVEEDOR WITH 0,costo WITH 0,costor WITH 0,may WITH 0,may30 WITH 0
         REPL min WITH 0,min30 WITH 0,mrk WITH ' ',IVA WITH ' '
      ELSE
         REPL proveedor WITH pro,costo WITH cos,costor WITH cosr,may WITH my
         REPL may30 WITH my3,min WITH mn,min30 WITH mn3,mrk WITH mk,IVA WITH IV
      ENDI
      CLEAR
   ELSE
      STOR .F. TO SIGUE
   ENDI
ENDD
 
SAVE ALL LIKE FINMER* to ..\VENTASA\FINMER
RETURN
