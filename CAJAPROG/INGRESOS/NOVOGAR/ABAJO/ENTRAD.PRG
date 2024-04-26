*********************************************************************************
*-- Programa: ENTRAD.PRG
*-- Fecha   : 11-08-91 12:21pm
*-- Version : G. REINER
*-- Notas   : MENU DE INGRESOS DE CAJA
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- VERSION NOVOGAR - CAJA PUBLICO
********************************************************************************
e_dijo=alltrim(prompt())
ulpr=program()
=cabpan1()
dijo=bar()
=OPCIU()
DO CASE
CASE e_DIJO="Cobrado en Efectivo"
   DO ICOBCTDO.SPR
CASE e_dijo="Cobrado con Tarjeta"
   DO ICOBTARJ.SPR
CASE e_dijo="Cobrado Cuota / Cheques"
   DO OPCIU
   DO OPGAS
   DO opcaj
   DO opcli
   =CLI("Cobrado Cuota/Cheque")
case e_dijo="Listados"
   =opcaj()
   =OPPRO()
   =OPBAN()
   =OPCCH()
   =OPCLI()
   respuesta='LCAJ#7#28#Listado de Entradas de Caja#3;
#\<Estado de Caja;
#\<Recibos Emitidos;
#\<Cheques Ingresados;
#\<Tarjetas de Cr‚dito'
   =defpop()
   on sele popu lcaj do lcajd 
   acti popu lcaj
   rele popu lcaj
ENDIF
CASE e_dijo="C. C. Clientes por Pantalla" .or. ;
     e_dijo="C. C. Clientes por Impresora"
   =OPCIU()
   =OPCLI()
   =OPCCH()
   =OPCCL()
   =lcclu(e_dijo="C. C. Clientes por Pantalla")
CASE e_DIJO="Reimputa Cobros"
   =OPCLI()
   =OPCCL()
   STORE NUL TO RESPUESTA
   =IIF(ELICLI("a Reimputar",-1,1),IMPUTCCL(PER.CODCLI,3),.T.)
case e_dijo="Reimprime Recibo"
   if ELIRECI()
      =OPPER()
      =OPMIX()
      DO LRECIU
   ELSE
      =NOSELEC("REMITO")
   ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)
