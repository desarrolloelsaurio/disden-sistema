********************************************************************************
*-- Name....: INDATGAS.FMT
*-- Date....: 19.01.90
*-- Version.: G. REINER
*-- Notes...: INGRESA RUBRO DE GASTO
********************************************************************************
STOR .T. TO SIGUE
DO WHIL SIGUE
   CLEAR
   GAS=SPACE(20)
   @ 0,0 TO 5,30 DOUB
   @ 1,4 SAY "INGRESO RUBROS DE GASTO" COLOR wu/n
   @ 3,2 SAY "GASTO" COLOR w+/n
   @ 3,9 GET GAS PICT "@X"
   READ
   IF ISALPHA(GAS)
      APPEND BLANK
      REPL GASTO WITH GAS
      STOR FINGAS+1 TO FINGAS
   ELSE
      EXIT
   ENDI
ENDD
RETURN
