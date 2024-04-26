********************************************************************************
*-- Programa: KARDEX.PRG
*-- Fecha   : G. REINER
*-- Version : 27/12/89
*-- Notas   : LISTA EL KARDEX
********************************************************************************
DO CASE
CASE BAR()=1
   DO INDATKAR
CASE BAR()=2
   DO CODATKAR
CASE BAR()=3
   DEFI POPU CACA FROM 11,45 MESS 'Men£ de Mercader¡as - Salda Kardex'
   DEFI BAR 1 OF CACA PROM ' Pone Kardex en Cero'
   DEFI BAR 2 OF CACA PROM ' Calcula Saldo Anterior '
   ON SELE POPU CACA DO RESKAR
   ACTI POPU CACA
CASE BAR()=4
   DEFI POPU CACA FROM 12,45 MESS 'Men£ de Mercader¡as - Listado de Kardex'
   DEFI BAR 1 OF CACA PROM ' Ranking de Productos'
   DEFI BAR 2 OF CACA PROM ' Desarrollo de Un Producto '
   DEFI BAR 3 OF CACA PROM ' Compras de Un Cliente'
   ON SELE POPU CACA DO LISKAR
   ACTI POPU CACA
CASE BAR()=5
   DO GENHIKAR
ENDC
RETURN
 
