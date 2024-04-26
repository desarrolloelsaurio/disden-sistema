*******************************************
*-- Programa: IAUDi.PRG
*-- Fecha   : 09/24/91 03:12pm
*-- Version : G. REINER
*-- Notas   : ASIENTA INFORME DE AUDITORIA
*******************************************
function iaudi
	=IAUD('ILEGAL '+ULPR)
	=POPERROR("Ingreso Ilegal en Programa - Consulte con Supervisor de la Red")
RETURN .T.
