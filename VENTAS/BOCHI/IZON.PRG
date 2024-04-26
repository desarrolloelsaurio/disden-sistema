********************************************************************************
*-- Name....: IZON.PRG
*-- Date....: 08/29/92 09:52am
*-- Version.: GOYO REINER
*-- Notes...: INGRESO DE ZONAS
*--           VIENE DE CLIENTES
********************************************************************************
SELE ZON
STOR .T. TO SIGUE
DEFI WIND WIN FROM 8,10 TO 13,73
ACTI WIND WIN
 
DO WHIL SIGUE
   STOR SPACE(20) TO ZON
   STOR SPACE(4) TO CZON
   @ 1,1 SAY "ZONA" COLOR w+/n
   @ 2,1 SAY "CODIGO" COLOR w+/n
   @ 1,13 GET ZON PICT "@!" MESS 'ENTER para menu'
   READ
   SET ORDER TO TAG ZONA
   IF ISALPHA(ZON)
      SEEK ZON
      IF !FOUND()
         @ 2,33 GET CZON PICT "!!!!" MESS 'C¢digo de Zona'
         READ
         SET ORDER TO TAG ZONCOD
         SEEK CZON
         IF !FOUND()
            APPEND BLANK
            REPL ZONA WITH ZON
            REPL ZONCOD   WITH CZON
            CLEAR
         ELSE
            DO EXISTE WITH ("CODIGO")
         ENDI
      ELSE
         DO EXISTE WITH ("ZONA")
      ENDI
   ELSE
      EXIT
   ENDI
ENDD
DEAC WIND ALL
RETURN
