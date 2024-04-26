**********************************************************
*-- Programa: ELICNS.PRG
*-- Fecha   : 01-18-92 08:44am
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE EL CONSORCIO
*-- Modificaci¢n GOYO 05-30-92 10:29am (agrego set order)
*--	 (Reemplazo ing x tecl por elimix1)
**********************************************************
FUNCTION elicns
	PARA MSG,R1,C1
	SELE CNS
	STORE 0 TO RESPUESTA
	IF CNSPOP
		SET ORDER TO TAG CONSORCIO
		=men_lin('Consorcio '+msg)
		IF EOF()
			GO TOP
		ENDIF
		ACTI POPUP CNSPOP REST
		STOR IIF(RESPUESTA#0,CNS.CONCOD,0) TO RESPUESTA
	ELSE
		RESPUESTA=ELIMIX1('Consorcio '+msg,'CNS','CNSCOD',4)
	ENDIF
RETURN RESPUESTA
