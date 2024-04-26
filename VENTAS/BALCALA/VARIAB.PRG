*********************************************************************************
*-- Programa: VARI.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*--  1 Popups a Utilizar
*--  2 Ancho de la Impresora
*--  3 Ancho de la Hoja
*--  4 Cantidad de D¡gitos
*--  5 Denominaci¢n Moneda
*--  6 Orden Listado Productos
*--  7 Precios por Defecto
*--  8 Stocks por Defecto
*--  9 Denominaci¢n Precios
*-- 10 N§ Lista de Precios
*-- 11 N§ Documentaci¢n
*-- 12 Selecci¢n Mercader¡a
********************************************************************************
=CABPAN1()
DO CASE
CASE BAR()=1
   DO acpopu
CASE BAR()=2
   DO acancho
CASE BAR()=3
   DO achoja
CASE BAR()=4
   DO acdigi
CASE BAR()=5
   DO acaus
CASE BAR()=6
   DO ordmer
CASE BAR()=7
   DO xapre
CASE BAR()=8
   DO xasto
CASE BAR()=9
   DO xanopre
CASE BAR()=10
   DO xanulis
CASE BAR()=11
   DO xanum
case bar()=12
	 do xamer
case bar()=13
	 do accotiz
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
*: EOF: VARI.PRG
