********************************************************************************
*-- Programa: CTAGRL.PRG
*-- Fecha   : 07-15-92 05:48pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP PARA CTACTE CLIENTES
********************************************************************************
PARAMETER R,C,t
respuesta='NADACT#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Deuda de los Clientes#\<Cheques en Cartera#\<Agrupa#\<Estado Patrimonial#\<Falta de Recepci¢n de Pagos'
=DEFPOP()
UNLO ALL
RETURN
