********************************************************************************
*-- Programa: REPUSE1.PRG
*-- Fecha   : 09/27/91 05:41pm
*-- Version : G. REINER
*-- Notas   : REEMPLAZA
********************************************************************************
FUNCTION REPUSE1
PARAMETER AGLO,LNA,NMRO
PRIVATE AGLO,LNA,NMRO
AGLO[LNA,NMRO]=DATE()
AGLO[LNA,NMRO+1]=usador
RETURN .T.
