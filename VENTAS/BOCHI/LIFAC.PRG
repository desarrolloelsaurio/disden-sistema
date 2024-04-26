********************************************************************************
*-- Programa: LIFAC.PRG02.03.90
*-- Fecha   : 02.03.90
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADO DE FACTURAS EMITIDAS
********************************************************************************
A='Listado de Facturas Emitidas Ordenadas Por '
DO CASE
CASE BAR()=1
   STOR NUL TO RESPUESTA
   DEFI POPU CACA FROM 10,25 MESS A
   DEFI BAR 1 OF CACA PROM ' Anula Listado '
   DEFI BAR 2 OF CACA PROM ' Por Factura'
   DEFI BAR 3 OF CACA PROM ' Por Cliente'
   ON SELE POPU CACA do resp1
   ACTI POPU CACA
   SELE FEMD
   SET FILTER TO FACFILTRO#'RE'
   IF RESPUESTA=2
      SET ORDER TO TAG FACNUMERO
      DO LIFADI
   ELSE
      IF RESPUESTA=3
         SET ORDER TO TAG FACCLIENTE
         DO LIFADI
      ENDI
   ENDI
CASE BAR()=2
   STOR 0 TO RESPUESTA
   DEFI POPU CACA FROM 10,25 MESS A
   DEFI BAR 1 OF CACA PROM ' Anula Listado '
   DEFI BAR 2 OF CACA PROM ' Por Factura'
   DEFI BAR 3 OF CACA PROM ' Por Cliente'
   ON SELE POPU CACA do resp1
   ACTI POPU CACA
   SELE FEMD
   SET FILTER TO FACFILTRO#'RE'
   IF RESPUESTA=2
      SET ORDER TO TAG FACNUMERO
      DO LFD
   ELSE
      IF RESPUESTA=3
         SET ORDER TO TAG FACCLIENTE
         DO LFD
      ENDI
   ENDI
CASE BAR()=3
   DEFI POPU CACA FROM 10,25 MESS A
   DEFI BAR 1 OF CACA PROM ' Anula Listado '
   DEFI BAR 2 OF CACA PROM ' Por Factura'
   DEFI BAR 3 OF CACA PROM ' Por Cliente'
   DEFI BAR 4 OF CACA PROM ' Por Fecha'
   DEFI BAR 5 OF CACA PROM ' Un Solo cliente'
   DEFI BAR 6 OF CACA PROM ' Facturas vencidas'
   DEFI BAR 7 OF CACA PROM ' Por Monto Menor a ... '
   DEFI BAR 8 OF CACA PROM ' Por Monto Mayor a ...'
   ON SELE POPU CACA DO LIFACTEM
   ACTI POPU CACA
CASE BAR()=4
   DEFI POPU CACA FROM 10,25 MESS A
   DEFI BAR 1 OF CACA PROM ' Anula Listado '
   DEFI BAR 2 OF CACA PROM ' Por Factura'
   DEFI BAR 3 OF CACA PROM ' Por Cliente'
   DEFI BAR 4 OF CACA PROM ' Por Fecha'
   DEFI BAR 5 OF CACA PROM ' Un Solo cliente'
   DEFI BAR 6 OF CACA PROM ' Facturas vencidas'
   DEFI BAR 7 OF CACA PROM ' Por Monto Menor a ... '
   DEFI BAR 8 OF CACA PROM ' Por Monto Mayor a ...'
   ON SELE POPU CACA DO LFM
   ACTI POPU CACA
CASE BAR()=6
   DEFI POPU CACA FROM 10,25 MESS "Tipo de Listado de Facturas d¡a por d¡a"
   DEFI BAR 1 OF CACA PROM ' Todas las Facturas '
   DEFI BAR 2 OF CACA PROM ' Disc. "A" y "B"'
   ON SELE POPU CACA DO LFAD
   ACTI POPU CACA
CASE BAR()=8
   DO LISFAPAN
ENDC
RETURN
