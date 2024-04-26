********************************************************************************
*-- Programa: KK3.PRG
*-- Fecha   : 12/12/90 11:54am
*-- Version : G. REINER
*-- Notas   : DEFINE POPUP PARA INGRESAR HS,ADI,RET Y SAL EN LIQUIDACION
********************************************************************************
PARAMETER KKR,KKC,KKT,KKT1
DEFI POPU caca FROM KKR,KKC MESS KKT SHAD COLOR SCHE 3
DEFI BAR 1 OF caca PROM ' \<Ingreso '+KKT1
DEFI BAR 2 OF caca PROM ' \<Generaliza '+KKT1
DEFI BAR 3 OF caca PROM ' I\<ngreso Global'
DEFI BAR 4 OF caca PROM '-------------------------------' skip
DEFI BAR 5 OF caca PROM ' \<Corrige '+KKT1
DEFI BAR 6 OF caca PROM '-------------------------------' skip
DEFI BAR 7 OF caca PROM ' \<Borra '+KKT1
DEFI BAR 8 OF caca PROM ' Borra \<Archivo '+KKT1
DEFI BAR 9 OF caca PROM '-------------------------------' skip
DEFI BAR 10 OF caca PROM ' \<Lista por Impresora'
DEFI BAR 11 OF caca PROM ' Lista por \<Pantalla'
RETURN
