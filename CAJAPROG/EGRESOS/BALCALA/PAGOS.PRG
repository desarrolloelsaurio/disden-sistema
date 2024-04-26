*********************************************************************************
*-- Programa: PAGOS.prg
*-- Fecha   : 11/14/91
*-- Version : R. 'EL BATA'
*-- Notas   : MENU PAGOS
********************************************************************************
ulpr=program()
=CABPAN1()
DO CASE
CASE BAR()=1
**   DO opcaj
**   =OPPRO()
**   do opccp
**   DO opfco
**   respuesta='caja1#6#35#Gesti¢n de Caja#3#\<Ingresos#\<Egresos#\<Correcciones'
**   =DEFPOP()
**   ON SELE POPU caja1 DO caja1
**   ACTI POPU caja1
**   RELE POPU caja1
CASE BAR()=2
**
** \<Pagos
** \<Salida de Caja
** \<Entrega de cheques
** -
** Pagos por P\<antalla
** Pagos por \<Impresora'
**
   =OPPRO()
	=OPGAS()
   do OPEMP
   DO opcaj
   respuesta='ecaja#6#35#Egresos de Caja#3#\<Efectivo#\<Cheques Propios#Cheques \<Terceros'
	=DEFPOP()
   ON SELE POPU ecaja DO ecaja
   ACTI POPU ecaja
   RELE POPU ecaja
case bar()=5
do lcaj with .t.,'GAS'
case bar()=6
do lcaj with .f.,'GAS'
ENDCASE
=MEN_LIN(botom)
RETURN
*: EOF: CAJAS.PRG
