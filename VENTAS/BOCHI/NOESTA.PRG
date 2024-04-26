********************************************************************************
*-- Programa: NOESTA.PRG
*-- Fecha   : 6/11/89
*-- Version : G. REINER
*-- Notas   : NO ESTA LO QUE SE BUSCA
********************************************************************************
PROCEDURE NOESTA
PARAMETER QBU
DEFI WIND WIN FROM 10,0 TO 12,79 DOUB
ACTI WIND WIN
CLEAR
? 'NO HAY MAS '
?? QBU
??' !!!  (ENTER PARA CONTINUAR) '
=INKEY(0,"HM")
DEAC WIND WIN
RETURN
 
