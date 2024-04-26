********************************************************************************
*-- Programa: LSKRPRO.PRG
*-- Fecha   : 15.04.90
*-- Version : G. REINER
*-- Notas   : LISTA PRODUCTOS
********************************************************************************
REST FROM ..\VENTASA\FINMER ADDI
RESPUESTA=0
DO INFIC WITH FINMER,' DE MERCADERIA A LISTAR '
IF !EMPTY(RESPUESTA)
   GO RESPUESTA IN MER
   IF LEN(RTRIM(MER.ARTIC))#3
      FILTRO=RESPUESTA
      DEFI POPU SEGUN FROM 14,45 MESS 'Desarrollo de Venta de un Producto - Elige Fechas L¡mite'
      DEFI BAR 1 OF SEGUN PROM ' Por Fecha'
      DEFI BAR 2 OF SEGUN PROM ' Todo el Archivo '
      ON SELE POPU SEGUN DO LSKRPRO1
      RESPUESTA=0
      ACTI POPU SEGUN
   ENDI
ENDI
RETURN
