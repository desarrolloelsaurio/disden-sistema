******************************************************
*-- Programa: CAG.PRG
*-- Fecha   : 13/JUL/1993
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES Crit. AGRUPACION
****************************************************
* REDUCCION 08-31-95 00:44am
PROCEDURE CAG
EXTERNAL PROCEDURE ELICAG
=OPCAG()
ULPR=PROGRAM()
RETURN MIX("Crit. Agrupaci¢n","Crit. Agrupaci¢n","CRIT. AGRUPACION","CRIT. AGRUPACION","CAGTEX","CAGCOD","ORDCAG",'›')
