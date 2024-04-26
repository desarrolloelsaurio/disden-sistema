********************************************************************************
*-- Programa: COMPRAS.PRG
*-- Fecha   : 08-18-92 10:45am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE COMPRAS MERCADO
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
DO CASE
CASE BAR()=1
respuesta='nada#4#30#Ingreso de Facturas#3#\<Factura de Proveedores#-#\<Borra Factura#-#Lista por \<Pantalla#Lista por \<Impresora#-#\<Corrige Numeraci¢n#Cierra Mes#-#Restaura el Archivo'
=DEFPOP()
ON SELE POPU nada DO FACTUR
ACTI POPU nada
RELE POPU nada
CASE BAR()=3
respuesta='NADA#4#30#Gesti¢n de Remesas#3#\<Ingresa#\<Borra#-#Lista por \<Pantalla#\<Lista por Impresora#-#\<Recupera Remesas#\<Agota Remesas#Genera \<Hist¢rico#-#R\<estaura Archivos'
=defpop()
ON SELE POPU nada DO REMESA
ACTI POPU nada
RELE POPU nada
CASE BAR()=5
respuesta='NADA#4#30#Gesti¢n de Liquidaci¢n#3#\<Liquidaci¢n #\<Liquidaci¢n Sobre Neto#-#\<Muestra Liquidaci¢n por Pantalla#-#Resumen Ingresos/Egresos por \<Pantalla#Resumen Ingresos/Egresos por \<Impresora'
=defpop()
ON SELE POPU nada DO LIQUID
ACTI POPU nada
RELE POPU nada
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
