***********************************
*-- Programa: OPOCO.PRG
*-- Fecha   : 05/16/95
*-- Version : R. BATA
*-- Notas   : ABRE ARCHIVO DE ORDEN DE CORTE
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
PROCEDURE OPOCO
	PARAMETER NROCOR, CUALAREA
	NOMBRCOR=PATH+"\XC"+ZERO(NROCOR,6)+".DBF"
	IF FILE(NOMBRCOR)
		=MEN_LIN(ABA+"Ordenes de Corte")
		IF TYPE("CUALAREA")="N"
			SELE (CUALAREA)
		ELSE
			IF USED('OCO')
				SELE OCO
				USE
			ELSE
				=PRXAREA(.T.)
			ENDIF
		ENDIF
		USE (NOMBRCOR) ALIAS OCO EXCL
		RETURN MEN_LIN(BOTOM)
	ENDIF
RETURN .F.
