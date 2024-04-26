********************************************************************************
*-- Programa: LSKRRAN.PRG
*-- Fecha   : 04.03.90
*-- Version : G. REINER
*-- Notas   : LISTA RANKING MERCADERIAS
********************************************************************************
REST FROM ..\VENTASA\FINCLI ADDITIVE
STOR BAR() TO QUIEN
FILTRO=''
FILTRO1=-1
RESPUESTA=1
DO CASE
CASE BAR()=1
   RESPUESTA=0
   DO INFIC WITH FINCLI,'DE CLIENTE A LISTAR '
   IF RESPUESTA>0
      FILTRO1=RESPUESTA
      FILTRO='KKKCLIENTE=FILTRO1'
   ENDI
CASE BAR()=3
   FILTRO="KKKMAY='S'"
CASE BAR()=4
   FILTRO="KKKMAY='N'"
CASE BAR()=5
   FILTRO="KKKOCUP='O'"
CASE BAR()=6
   FILTRO="KKKOCUP='E'"
CASE BAR()=7
   FILTRO="KKKOCUP='M'"
CASE BAR()=8
   FILTRO="KKKOCUP='C'"
ENDC
IF !EMPTY(RESPUESTA)
   IF QUIEN#0
      DEFI POPU SEGUN FROM 14,45 MESS 'Ranking de Venta - Elige Fechas L¡mite'
      DEFI BAR 1 OF SEGUN PROM ' Por Fecha'
      DEFI BAR 2 OF SEGUN PROM ' Todo el Archivo '
      ON SELE POPU SEGUN DO LSKRRAN1
      RESPUESTA=0
      ACTI POPU SEGUN
   ENDI
ENDI
RETURN
