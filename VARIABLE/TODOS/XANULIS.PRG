********************************************************************************
*-- Programa: xanulis.prg
*-- Fecha   : 09/11/91 05:35pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA numero de lista de precios
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	=movewin(8,17,12,66,'win',' N§ Lista de Precios ')
	@ 1,1 SAY 'N§ LISTA DE PRECIOS' colo sche 3
	vez=1
	DO WHILE vez=1
		vez=2
		@ 1,26 GET xanulis PICTURE '@!';
		MESS 'Ingrese el N£mero de la Lista de Precios a Emitir'
		READ
		=iaud('CAMBIO N§ LISTA DE PRECIOS')
	ENDDO
	=RELEWIN("win")
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)

