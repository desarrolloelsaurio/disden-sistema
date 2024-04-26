*********************************************************************************
*-- Programa: ENTRAD.PRG
*-- Fecha   : 11-08-91 12:21pm
*-- Version : R. 'EL BATA'
*-- Notas   : MENU DE INGRESOS DE CAJA
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- VERSION NOVOGAR - CAJA ARRIBA
********************************************************************************
ULPR=PROGRAM()
EN_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
=OPCIU()
DO CASE
CASE EN_DIJO="Cobrado en Efectivo"
   DO ICOBCTDO.SPR
CASE EN_DIJO="Cobrado con Tarjeta"
   DO ICOBTARJ.SPR
CASE EN_DIJO="Cobrado Cuota - Cheques"
   DO CLI
case EN_DIJO="Listados"
   respuesta='LCAJ#7#28#Listado de Entradas de Caja#3;
#\<Estado de Caja;
#\<Ingresos;
#\<Recibos Emitidos'
   =DEFPOP()
   ON SELE POPU LCAJ DO LCAJD 
   ACTI POPU LCAJ
   RELE POPU LCAJ
CASE EN_DIJO="C. C. Clientes por Pantalla"
   =OPCIU()
   =OPCLI()
   =OPCCH()
   =OPCCL()
   =LCCLU(.T.)
CASE EN_DIJO="C. C. Clientes por Impresora"
   =OPCIU()
   =OPCLI()
   =OPCCH()
   =OPCCL()
   =LCCLU()
CASE EN_DIJO="Reimputa Cobros"
   =OPCLI()
   =OPCCL()
   STORE NUL TO RESPUESTA
   =IIF(ELICLI("a Reimputar",-1,1),IMPUTCCL(PER.CODCLI,3),.T.)
CASE EN_DIJO="Ingreso de Efectivo"
   =OPGAS()
   =OPCLI()
   DO OPCAJ WITH JANNRO
   DO IEFE
CASE EN_DIJO="Ingreso de Valores Diferidos"
   =OPCLI()
   DO OPCCH WITH JANNRO
   DO OPCAJ WITH JANNRO
   respuesta='vdif#10#30#Tipo de Valor a Ingresar#3#\<Cheques#\<Tarjetas de Cr‚dito#\<Documentos'
   =DEFPOP()
   ON SELE POPU VDIF DO ICHED
   ACTI POPU VDIF
   RELE POPU VDIF
CASE EN_DIJO="Reindexa"
   DO XCAJ
ENDCASE
RETURN MEN_LIN(BOTOM)
