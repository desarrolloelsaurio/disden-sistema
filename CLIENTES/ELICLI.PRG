********************************************************************************
*-- Programa: ELIPER.PRG
*-- Fecha   : 07/04/91
*-- Version : G. REINER
*-- Notas   : ELIGE CLIENTE
*-- Modificaci¢n GOYO 05-30-92 11:06am (elimix - saco ventana interm)
********************************************************************************
FUNCTION elicli
	PARA msg,r1,c1
	SELE PER
	store NUL to respuesta
	IF clipop
		SET ORDER TO TAG CLIENTE
		IF EOF()
			GO TOP
		ENDIF
		ACTI POPUP clipop REST
		STOR !empty(respuesta) TO respuesta
	ELSE
		ON KEY LABEL F2 RETURN SEEKTECX(20,'PER','CLIENTE','CODCLI','CLIENTE',R1,C1)
		respuesta=ELIMIX1('Cliente '+msg,'PER','CODCLI',10)
		ON KEY LABEL F2
	ENDIF
RETURN respuesta
