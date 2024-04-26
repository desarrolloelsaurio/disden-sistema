********************************************************************************
*-- Programa: ELIMER1.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : GENERA POPUP Y ELIGE MERCADERIA POR ARTIC
********************************************************************************
FUNCTION ELIMER1
PARA msg,r1,c1
PRIV msg,r1,c1,ventant
      =working()
      store nul to respuesta
SELE MER
tmp=gentmp()
sort on artic to (tmp) for MER.rubro=m.rubro
=prxarea(.t.)
use (tmp) alias me1
   DEFI POPU me1pop FROM 0,30 PROM FIELD PADR(me1.artic,LEN(ME1.ARTIC))+"-"+me1.merca MESS ' Elija el artículo ' SHAD COLOR SCHE 3 IN SCREEN
   ON SELE POPU me1pop DO resp1
   =UNWORK()
   ACTI POPU ME1POP
   STOR !EMPTY(respuesta) TO respuesta
RETURN RESPUESTA