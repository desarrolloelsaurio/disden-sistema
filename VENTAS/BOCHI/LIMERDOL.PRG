********************************************************************************
*-- Programa: LIMERDOL.PRG
*-- Fecha   : 03.03.90
*-- Version : G. REINER
*-- Notas   : DERIVA A IMPRESION LISTAS DE PRECIOS EN DOLARES
*--           VIENE DE LIDATMER
*--           VIENE DE MERCA
********************************************************************************
DO CASE
CASE BAR()=1
   DO LIDATDOL WITH 1
CASE BAR()=2
   DO LIDATDOL WITH 2
CASE BAR()=3
   DO LIDATDOL WITH 3
CASE BAR()=4
   DO LIDATDOL WITH 4
CASE BAR()=5
   DO LISDOLUN
CASE BAR()=7
	DO LBOCH
CASE BAR()=8
	DO LBOCH1
CASE BAR()=9
	DO LMAY
CASE BAR()=10
	DO LMIN
ENDC
RETURN
