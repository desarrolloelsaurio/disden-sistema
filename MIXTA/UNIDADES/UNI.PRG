*******************************************
*-- Programa: UNI
*-- Fecha   : 06-15-93 02:16am
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES UNIDADES
*******************************************
* REDUCCION 08-30-95 11:41pm
PROCEDURE UNI
EXTERNAL PROCEDURE ELIUNI
=OPUNI()
ULPR=PROGRAM()
RETURN MIX("Unidad","Unidades","UNIDAD","UNIDADES","UNITEX","UNICOD","ORDUNI","1")
