********************************************************************************
*-- Programa: LICLIPAO.PRG
*-- Fecha   : 26/9/89
*-- Version : G. REINER
*-- Notas   : GENERA LISTADO 1 X 1 POR PANTALLA
*--           VIENE DE CLIENTES
********************************************************************************
DEFI WIND WIN FROM 4,10 TO 22,73
ACTI WIND WIN
 
SCAN FOR INKEY()#83 .AND. LASTKEY()#83
   @ 0,0 TO 2,23
   @ 0,40 SAY "FICHA:" COLOR wi/n
   @ 0,47 SAY STR(RECNO(),7)
   @ 1,1 SAY "LISTADO DATOS CLIENTES"
   @ 1,40 SAY "FECHA:" COLOR wi/n
   @ 1,46 SAY DATE()
   @ 2,40 SAY "HORA :" COLOR wi/n
   @ 2,46 SAY TIME() PICT "XXXXXXXX"
   @ 3,0 TO 16,60 DOUB
   @ 4,1 SAY "APELLIDO" COLOR w+/n
   @ 4,13 GET apellido PICT "@X"
   @ 4,33 SAY "NOMBRE" COLOR w+/n
   @ 4,45 GET nombre PICT "@X"
   @ 5,1 SAY "DETALLE" COLOR w+/n
   @ 5,13 GET detalle PICT "@X"
   @ 6,1 SAY "MAYORISTA" COLOR w+/n
   MAY=IIF(MAYORISTA='S','Si','No')
   @ 6,13 GET may PICT "@M Si,No"
   @ 6,33 SAY "NROIVA" COLOR w+/n
   @ 6,45 GET nroiva PICT "@X"
   @ 7,1 SAY 'PROFESION' COLOR W+/N
 
   IF PROFESION='C'
      PROF='Comerciante'
   ELSE
      IF PROFESION='E'
         PROF='Estudiante '
      ELSE
         IF PROFESION='O'
            PROF='Odont¢logo '
         ELSE
            PROF='Mec nico   '
         ENDI
      ENDI
   ENDI
 
   @ 7,13 GET PROF
   @ 9,1 SAY "DOMICILIO EN ROSARIO " COLOR wu+/n
   @ 10,1 SAY "DOMICILIO" COLOR w+/n
   @ 10,13 GET domiros PICT "@X"
   @ 10,44 SAY "COD. POSTAL" COLOR w+/n
   @ 10,56 GET codros PICT "XXXX"
   @ 11,1 SAY "TELEFONO" COLOR w+/n
   @ 11,13 GET telros PICT "@X"
   @ 11,33 SAY "LOCALIDAD" COLOR w+/n
   @ 11,45 GET locaros PICT "@X"
   @ 13,1 SAY "DOMICILIO FUERA DE ROSARIO" COLOR wu+/n
   @ 14,1 SAY "DOMICILIO" COLOR w+/n
   @ 14,13 GET domiint PICT "@X"
   @ 14,44 SAY "COD. POSTAL" COLOR w+/n
   @ 14,56 GET codint PICT "XXXX"
   @ 15,1 SAY "TELEFONO" COLOR w+/n
   @ 15,13 GET telint PICT "@X"
   @ 15,33 SAY "LOCALIDAD" COLOR w+/n
   @ 15,45 GET locaint PICT "@X"
   CLEAR GETS
 
   @ 16,10 SAY " Toque tecla para continuar - '0' para Men£ " COLOR w*/n
 
   =INKEY(0,'HM')
   IF LASTKEY()=48
      EXIT
   ENDI
ENDSCAN
DEAC WIND ALL
RETURN