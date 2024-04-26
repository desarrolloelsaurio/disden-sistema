********************************************************************************
*-- Name....: INDATPRO.PRG
*-- Date....: 9-26-89
*-- Version.: G. REINER
*-- Notes...: INGRESO DE DATOS PROVEEDORES
*--           VIENE DE PROVEE
********************************************************************************
STOR .T. TO SIGUE
FINPRO=RECCOUNT("PRO")
DEFI WIND WIN FROM 7,26 TO 23,79
ACTI WIND WIN
DO WHIL SIGUE
   STOR SPACE(30) TO fir,dom,det
   STOR SPACE(15) TO ape,nom
   STOR SPACE(20) TO loc,pai
   STOR SPACE(6) TO cod
   STOR SPACE(12) TO tel,tel1
 
   @ 0,10 TO 2,36
   @ 1,11 SAY "INGRESO DATOS PROVEEDORES"
   @ 3,0 TO 14,44 DOUB
   @ 8,36 TO 12,51
   @ 9,37 SAY "FICHA:" COLOR wi/n
   @ 9,44 SAY STR(FINPRO,7)
   @ 10,37 SAY "FECHA:" COLOR wi/n
   @ 10,43 SAY DATE()
   @ 11,37 SAY "HORA :" COLOR wi/n
   @ 11,43 SAY TIME() PICT "XXXXXXXX"
   @ 4,1 SAY "FIRMA" COLOR w+/n
   @ 4,14 GET fir PICT "@X" ;
     MESS 'Tecla ESC para terminar'
   READ
 
   IF ISALPHA(FIR)
      @ 5,1 SAY "APELLIDO" COLOR w+/n
      @ 5,14 GET ape PICT "@X"
      @ 6,1 SAY "NOMBRE" COLOR w+/n
      @ 6,14 GET nom PICT "@X"
      @ 7,1 SAY "DOMICILIO" COLOR w+/n
      @ 7,14 GET dom PICT "@X"
      @ 8,1 SAY "LOCALIDAD" COLOR w+/n
      @ 8,14 GET loc PICT "@X"
      @ 9,1 SAY "COD. POSTAL" COLOR w+/n
      @ 9,14 GET cod PICT "XXXXXX"
      @ 10,1 SAY "PAIS" COLOR w+/n
      @ 10,14 GET pai PICT "@X"
      @ 11,1 SAY "TELEFONO" COLOR w+/n
      @ 11,14 GET tel PICT "@X"
      @ 12,1 SAY "TELEFONO" COLOR w+/n
      @ 12,14 GET tel1 PICT "@X"
      @ 13,1 SAY "DETALLE" COLOR w+/n
      @ 13,14 GET det PICT "@X"
      READ
 
      APPEND BLANK
      REPL firma WITH fir
      REPL apellido WITH ape
      REPL nombre WITH nom
      REPL domicilio WITH dom
      REPL localidad WITH loc
      REPL pais WITH pai
      REPL codigopos WITH cod
      REPL telefono WITH tel
      REPL telefono1 WITH tel1
      REPL detalle WITH det
      REPL marca with ' '
      REPL proveedor WITH RECNO()
      FINPRO=FINPRO+1
      CLEAR
   ELSE
      EXIT
   ENDI
ENDD
 
SAVE ALL LIKE FINPRO* TO ..\VENTASA\FINPRO
DEAC WIND ALL
RETURN
