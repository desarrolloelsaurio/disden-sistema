********************************************************************************
*-- Programa: LPRE.PRG
*-- Fecha   : 11-20-92 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE COSTOS
********************************************************************************
PARAMETER PORPAX
DO CASE
CASE BAR()=1
	DO LPRET WITH PORPAX
CASE BAR()=2
	DO LPREPRO WITH PORPAX
ENDCASE
=MEN_LIN(BOTOM)
RETURN
