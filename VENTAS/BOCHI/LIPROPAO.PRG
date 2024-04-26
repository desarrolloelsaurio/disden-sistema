********************************************************************************
*-- Programa: LIPROPAO.PRG
*-- Fecha   : 29/9/89
*-- Version : G. REINER
*-- Notas   : GENERA FICHAS PROVEEDORES POR PANTALLA
*--           VIENE DE PROVEE
********************************************************************************
DEFI WIND WIN FROM 7,26 TO 23,79
ACTI WIND WIN
 
SCAN FOR INKEY()#83 .AND. LASTKEY()#83
   @ 0,10 TO 2,36
   @ 1,11 SAY "LISTADO DATOS PROVEEDORES"
   @ 3,0 TO 14,44 DOUB
   @ 8,36 TO 12,51
   @ 9,37 SAY "FICHA:" COLOR wi/n
   @ 9,44 SAY STR(RECNO(),7)
   @ 10,37 SAY "FECHA:" COLOR wi/n
   @ 10,43 SAY DATE()
   @ 11,37 SAY "HORA :" COLOR wi/n
   @ 11,43 SAY TIME() PICT "XXXXXXXX"
   @ 4,1 SAY "FIRMA" COLOR w+/n
   @ 4,14 GET firma PICT "@X"
   @ 5,1 SAY "APELLIDO" COLOR w+/n
   @ 5,14 GET apellido PICT "@X"
   @ 6,1 SAY "NOMBRE" COLOR w+/n
   @ 6,14 GET nombre PICT "@X"
   @ 7,1 SAY "DOMICILIO" COLOR w+/n
   @ 7,14 GET domicilio PICT "@X"
   @ 8,1 SAY "LOCALIDAD" COLOR w+/n
   @ 8,14 GET localidad PICT "@X"
   @ 9,1 SAY "COD. POSTAL" COLOR w+/n
   @ 9,14 GET codigopos PICT "XXXXXX"
   @ 10,1 SAY "PAIS" COLOR w+/n
   @ 10,14 GET pais PICT "@X"
   @ 11,1 SAY "TELEFONO" COLOR w+/n
   @ 11,14 GET telefono PICT "@X"
   @ 12,1 SAY "TELEFONO" COLOR w+/n
   @ 12,14 GET telefono1 PICT "@X"
   @ 13,1 SAY "DETALLE" COLOR w+/n
   @ 13,14 GET detalle PICT "@X"
   CLEAR GETS
   @ 14,4 SAY " Tecla para continuar - '0' para Menu " COLOR w*
   =INKEY(0,'HM')
   IF LASTKEY()=48
      EXIT
   ENDI
ENDSCAN
DEAC WIND ALL
RETURN
