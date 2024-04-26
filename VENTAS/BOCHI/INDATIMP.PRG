********************************************************************************
*-- Name....: INDATIMP.PRG
*-- Date....: 4-19-60
*-- Version.: G. REINER
*-- Notes...: INGRESO DATOS DE IMPORTACION
********************************************************************************
STOR .T. TO SIGUE
DO WHIL SIGUE
   CLEA
   IMP=SPACE(20)
   MER=0
   PRO=0
   FOB=0
   MMON=0
   PPOS=IMP
   ART=IMP
 
   @ 0,0 TO 12,68 DOUB
   @ 2,10 SAY "INGRESO DATOS IMPORTACION" COLOR wu/n
 
   @ 4,2 SAY "Nro Importaci¢n" COLOR w+/n
   @ 4,27 GET imp PICT "@X"
   @ 5,2 SAY "Mercader¡a a Importar" COLOR w+/n
   @ 5,27 GET mer PICT "9999"
   @ 6,2 SAY "Proveedor" COLOR w+/n
   @ 6,27 GET pro PICT "9999"
   @ 7,2 SAY "Valor F.O.B." COLOR w+/n
   @ 7,27 GET fob PICT "99999999999.99"
   @ 8,2 SAY "Moneda del F.O.B." COLOR w+/n
   @ 8,27 GET MMON PICT "99"
   @ 9,2 SAY "Posici¢n Arancelaria" COLOR w+/n
   @ 9,27 GET ppos PICT "@X"
   @ 10,2 SAY "Art¡culo del Proveedor" COLOR w+/n
   @ 10,27 GET art PICT "@X"
   CLEAR GETS
   @ 4,2 SAY "Nro Importaci¢n" COLOR w+/n
   @ 4,27 GET imp PICT "@X"
   READ
   IF IMP#'  '
      SIG1=.T.
      DO WHIL SIG1
         @ 5,2 SAY "Mercader¡a a Importar" COLOR w+/n
         @ 5,27 GET mer PICT "9999"
         READ
         IF MER#0 .AND. MER<FINMER
            GO MER IN MER
            IF LEN(RTRIM(MER.ARTIC))=3
               MER=0
               LOOP
            ELSE
               @ 5,27 GET MER.DETALLE
               CLEAR GETS
               EXIT
            ENDI
         ENDI
      ENDD
      @ 6,2 SAY "Proveedor" COLOR w+/n
      RESPUESTA=0
      SELE PRO
      SET ORDER TO TAG FIRMA
      ACTI SCREEN
      DO WHIL EMPTY(RESPUESTA)
         ACTI POPU PROPOP
      ENDD
      GO TOP
      SKIP RESPUESTA-1
      PRO=RESPUESTA
      ACTI WIND WIN
      @ 6,27 SAY FIRMA COLO SCHE 24
      @ 7,2 SAY "Valor F.O.B." COLOR w+/n
      @ 7,27 GET fob PICT "99999999999.99"
      READ
      @ 8,2 SAY "Moneda del F.O.B." COLOR w+/n
      RESPUESTA=0
      ACTI SCREEN
      DO WHIL EMPTY(RESPUESTA)
         ACTI POPU MONPOP
      ENDD
      MMON=RESPUESTA
      ACTI WIND WIN
      @ 8,27 SAY MON[RESPUESTA] COLO SCHE 24
      @ 9,2 SAY "Posici¢n Arancelaria" COLOR w+/n
      @ 9,27 GET ppos PICT "@X"
      @ 10,2 SAY "Art¡culo del Proveedor" COLOR w+/n
      @ 10,27 GET art PICT "@X"
      READ
      SELE IMP
      APPEND BLANK
      REPL NROIMP WITH IMP
      REPL IMPMER WITH MER
      REPL IMPPRO WITH PRO
      REPL IMPFOB WITH FOB
      REPL IMPMON WITH MMON
      REPL IMPPOS WITH PPOS
      REPL IMPART WITH ART
      STOR FINIMP+1 TO FINIMP
   ELSE
      EXIT
   ENDI
ENDD
RETURN
