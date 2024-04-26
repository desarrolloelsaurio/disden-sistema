********************************************************************************
*-- Programa: LISKAR.PRG
*-- Fecha   : 03/01/90
*-- Version : G. REINER
*-- Notas   : LISTA KARDEX
********************************************************************************
DEFI POPU PRIMER FROM 12,50 MESS 'Listado de Kardex - Elige Clientes a Listar'
DEFI BAR 1 OF PRIMER PROM ' Un S¢lo Cliente'
DEFI BAR 2 OF PRIMER PROM ' Todos los Clientes'
DEFI BAR 3 OF PRIMER PROM ' Clientes Mayoristas '
DEFI BAR 4 OF PRIMER PROM ' Clientes Minoristas'
DEFI BAR 5 OF PRIMER PROM ' Odont¢logos'
DEFI BAR 6 OF PRIMER PROM ' Estudiantes'
DEFI BAR 7 OF PRIMER PROM ' Mec nicos'
DEFI BAR 8 OF PRIMER PROM ' Comerciantes'
DO CASE
CASE BAR()=1
   RESPUESTA=0
   ON SELE POPU PRIMER DO LSKRRAN
   ACTI POPU PRIMER
CASE BAR()=2
   DO LSKRPRO
CASE BAR()=3
   DO LSKRCLI
ENDC
RETURN
