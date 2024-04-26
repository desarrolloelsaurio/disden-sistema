********************************************************************************
*-- Programa: LVIAP.PRG
*-- Fecha   : 06/10/91 11:28am
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE CIUDADES POR PANTALLA
********************************************************************************
SELE VIA
SET ORDER TO TAG IIF(ORDVIA,'CODVIA','VIAJANTE')
DO CASE
CASE BAR()=1
	DO lviap1
OTHERWISE
	DO lviap2
ENDCASE
RETURN
