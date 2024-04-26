********************************************************************************
*-- Programa: QUEBUSCA.PRG
*-- Fecha   : 6/11/89
*-- Version : G. REINER
*-- Notas   : INGRESA QUE BUSCA
********************************************************************************
PROCEDURE QUEBUSCA
STOR SPACE(30) TO RESPUESTA
 
DEFI WIND CACA from 10,1 to 17,78 DOUB
ACTI WIND CACA
DO TIT1 WITH 1,"INGRESE EL NOMBRE O FIRMA QUE BUSCA",'I'
@ 4,1 SAY " QUE BUSCA ? ('0' PARA MENU')" GET RESPUESTA
READ
DEAC WIND CACA
RETURN
 
