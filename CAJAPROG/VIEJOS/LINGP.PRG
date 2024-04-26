********************************************************************************
*-- Programa: LINGp.PRG
*-- Fecha   : 01-27-92 07:35pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE INGRESOS DE CAJA
********************************************************************************
ulpr=PROGRAM()
quecli=bar()
DO CASE
CASE BAR()=1 .or. bar()=3
   respuesta='NADAfec#8#24#Listados de Ingreso de Caja por Pantalla#3#\<Archivo Completo#\<Entre Fechas'+iif(bar()=1,'#\<Resumen por Fecha','')
	=DEFPOP()
   ON SELE POPU nadafec DO lingq
   ACTI POPU nadafec
   RELE POPU nadafec
case bar()=2
   store 0 to respuesta
   if !empty(elicli(" a Listar",-1,1))
      elcli='CODCLI=PER.codcli'
      respuesta='NADAfec#8#24#Listados de Ingreso de Caja por Pantalla#3#\<Archivo Completo#\<Entre Fechas'+iif(bar()=1,'#\<Resumen por Fecha','')
		=DEFPOP()
      ON SELE POPU nadafec DO lingq
      ACTI POPU nadafec
      RELE POPU nadafec
   endif
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
*: EOF: FAC.PRG
