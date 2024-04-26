****************************************************
*-- Programa: GRU.prg
*-- Fecha   : 06-15-93 02:16am
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES GRUPOS DE COMPRA
****************************************************
* REDUCCION 31/08/95 15:46
PROCEDURE GRU
EXTERNAL PROCEDURE ELIGRU
=OPGRU()
ULPR=PROGRAM()
RETURN MIX("Grupo de Compras","Grupos de Compras","GRUPO COMPRAS","GRUPOS COMPRAS","GRUTEX","GRUCOD","ORDGRU",'U')
