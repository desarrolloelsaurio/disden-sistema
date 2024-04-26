********************************************************************************
*-- Name....: LIAGEUN.PRG
*-- Date....: 6/11/89
*-- Version.: G. REINER
*-- Notes...: MUESTRA UNA FICHA DE LA AGENDA
********************************************************************************
@ 2,2 TO 13,52 DOUB
@ 3,3 SAY "APELLIDO Y NOMBRE" COLOR w+/n
@ 3,22 GET apeLLIDO PICT "@X"
@ 4,3 SAY "EMPRESA" COLOR w+/n
@ 4,22 GET empRESA PICT "@X"
@ 5,3 SAY "DOMICILIO" COLOR w+/n
@ 5,22 GET domICILIO PICT "@X"
@ 6,3 SAY "LOCALIDAD" COLOR w+/n
@ 6,22 GET locaLIDAD PICT "@X"
@ 7,3 SAY "CODIGO POSTAL" COLOR w+/n
@ 7,22 GET codpOSTAL PICT "@X"
@ 8,3 SAY "PAIS" COLOR w+/n
@ 8,22 GET paiS PICT "@X"
@ 9,3 SAY "TELEFONO" COLOR w+/n
@ 9,22 GET telEFONO1 PICT "@X"
@ 10,3 SAY "TELEFONO" COLOR w+/n
@ 10,22 GET telEFONO2 PICT "@X"
@ 11,3 SAY "TELEFONO" COLOR w+/n
@ 11,22 GET telEFONO3 PICT "@X"
@ 12,3 SAY "DETALLE" COLOR w+/n
@ 12,22 GET detALLE PICT "@X"
@ 13,34 TO 17,51
@ 14,35 SAY "FICHA:" COLOR wi/n
@ 14,44 SAY RECNO() PICT "9999999"
@ 15,35 SAY "FECHA:" COLOR wi/n
@ 15,42 SAY TIME() PICT "@J XXXXXXXXX"
@ 16,35 SAY "HORA :" COLOR wi/n
@ 16,43 SAY DATE()
clear gets
DO TIT2 WITH 17," Toque tecla para continuar buscando - S para men£",'w+/n',56
=INKEY(0,'HM')
set clock off
clear
DEAC WIND AYUDA
RETURN
