*****************************************************************************
*-- Programa: ELIPRA.PRG
*-- Fecha   : 10-20-92 01:41am
*-- Version : G. REINER
*-- Notas   : ELIGE PRACTICA
*-- Modificaci¢n GOYO 05-30-92 11:06am (elimix - saco ventana interm)
********************************************************************************
FUNCTION eliPRA
	PARA msg,r1,c1,eltpr
	SELE PRA
	IF !EMPTY(ELTPR)
		=DOTALK()
		TMP=GENTMP()
		SET ORDER TO
		SORT ON PRACTICABR ;
		TO (TMP) FOR TPR=ELTPR
		SELE 0
		USE (TMP) ALIAS PRA1 EXCL
	ELSE
		SET ORDER TO TAG PRACTICABR
	ENDIF
	store NUL to respuesta
	IF PRApop
		IF EMPTY(ELTPR)
			SET ORDER TO TAG PRACTICABR
		ELSE
			=DEFPOGRL(PRAPOPR,PRAPOPC,"PRAPOP1","pra1.PRACTICABR",30,"Elija la Pr ctica")
		ENDIF
		IF EOF()
			GO TOP
		ENDIF
		IF EMPTY(M.ELTPR)
			ACTI POPUP PRAPOP REST
		ELSE
		    =UNTALK()
			ACTI POPUP PRAPOP1 REST
		ENDIF
		STOR !empty(respuesta) TO respuesta
		IF !EMPTY(ELTPR)
			IF !EMPTY(RESPUESTA)
				=XSEEK(PRA1.CODPRA,"PRA","CODPRA")
			ENDIF
			SELE PRA1
			=OFF_TMP(SELE())
			SELE PRA
		ENDIF
	ELSE
		IF !EMPTY(ELTPR)
			SELE PRA1
		ENDIF
		respuesta=ELIMIX1('Pr ctica '+msg,'PRA','CODPRA',9,.T.,"@R 99.99.99X")
	ENDIF
RETURN respuesta
