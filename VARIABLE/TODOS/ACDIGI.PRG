*********************************************************
*-- Programa: ACDIGI.PRG
*-- Fecha   : 01/05/91 07:24pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA CANTIDAD DE DIGITOS EN PLANILLAS
*********************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ulpr=HORA_ULP(PROGRAM())
=MOVEWIN(10,14,14,66,'WIN',' Cantidad de Espacio para N£meros en Planillas ')
XACDIGI=GETNU1(PADR(USADOR,10)+PADR("XACDIGI",20),"FOXPER")
@ 1,1 SAY 'CANTIDAD DE ESPACIOS' colo sche 3
vez=1
DO WHILE vez=1
	vez=2
	@ 1,26 GET xacdigi PICTURE '999';
	 MESS 'Cantidad de Espacios para N£meros (Presentaci¢n: NNNNN.NN = 8) '
	READ
	IF xacdigi>20 .OR. xacdigi<4
		vez=1
	ENDIF
ENDDO
=PUTNU1(PADR("XACDIGI",20)+PADR(USADOR,10),XACDIGI,"FOXPER",PADR(USADOR,10)+PADR("XACDIGI",20))
=RELEWIN("win")
RELE vez
RETURN MEN_LIN(BOTOM)
