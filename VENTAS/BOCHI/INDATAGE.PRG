****************************************
*-- Name....: INDATAGE.PRG
*-- Date....: 11-04-89
*-- Version.: G. REINER
*-- Notes...: INGRESO DE DATOS A AGENDA
****************************************
ON ESCAPE RETURN
finage=RECCOUNT("AGE")
STOR .T. TO SIGUE
DEFI WIND CACA FROM 3,0 TO 23,56 DOUB
ACTI WIND CACA
DO WHIL SIGUE
   STOR space(30) to ape,det,dom
   STOR space(20) to emp
   STOR space(15) to loca
   STOR space(5) to codp
   STOR space(10) to pai
   STOR space(12) to tel1,tel2,tel3
 
   @ 2,2 TO 13,52 DOUB
   @ 13,34 TO 17,51
   @ 14,35 SAY "FICHA:" COLOR wi/n
   @ 14,44 SAY FINAGE PICT "9999999"
   @ 15,35 SAY "FECHA:" COLOR wi/n
   @ 15,42 SAY TIME() PICT "@J XXXXXXXXX"
   @ 16,35 SAY "HORA :" COLOR wi/n
   @ 16,43 SAY DATE()
   @ 3,3 SAY "APELLIDO Y NOMBRE" COLOR w+/n
   @ 3,22 GET ape PICT "@X"
   READ
   IF ISALPHA(APE)
      @ 4,3 SAY "EMPRESA" COLOR w+/n
      @ 4,22 GET emp PICT "@X"
      @ 5,3 SAY "DOMICILIO" COLOR w+/n
      @ 5,22 GET dom PICT "@X"
      @ 6,3 SAY "LOCALIDAD" COLOR w+/n
      @ 6,22 GET loca PICT "@X"
      @ 7,3 SAY "CODIGO POSTAL" COLOR w+/n
      @ 7,22 GET codp PICT "XXXXX"
      @ 8,3 SAY "PAIS" COLOR w+/n
      @ 8,22 GET pai PICT "@X"
      @ 9,3 SAY "TELEFONO" COLOR w+/n
      @ 9,22 GET tel1 PICT "@X"
      @ 10,3 SAY "TELEFONO" COLOR w+/n
      @ 10,22 GET tel2 PICT "@X"
      @ 11,3 SAY "TELEFONO" COLOR w+/n
      @ 11,22 GET tel3 PICT "@X"
      @ 12,3 SAY "DETALLE" COLOR w+/n
      @ 12,22 GET det PICT "@X"
      READ
      APPEND BLANK
      REPL apellido with ape
      REPL empresa with  emp
      REPL domicilio with dom
      REPL localidad with loca
      REPL codpostal with codp
      REPL pais with pai
      REPL telefono1 with tel1
      REPL telefono2 with tel2
      REPL telefono3 with tel3
      REPL detalle with det
      STOR finage+1 to finage
      CLEAR
   ELSE
      STOR .F. TO SIGUE
   ENDI
ENDD
save all like finage to ..\VENTASA\finage
DEAC WIND ALL
return
