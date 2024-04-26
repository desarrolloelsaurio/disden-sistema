*********************************************
*-- Programa: XCCLH.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE CTA CTE CLIENTES HISTORICA
*********************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
PROCEDURE XCCLH
	ULPR=HORA_ULP(PROGRAM())
	IF CHEQSEG()
		IF FUERARED()#27
			SELE CCLH
			=MEN_LIN('Reindexando el Archivo de Cta Cte Clientes Hist¢rica')
			=FLOCK("CCLH") .OR. FLOK("CCLH")
			=DOTALK()
			=OPCCLhX(JANNRO)
			INDEX ON CODCLI TAG  CODCLI			
			INDEX ON NUMERORE TAG NUMERORE
			INDEX ON COD_OPER TAG COD_OPER
			=REOPCCLH()
			=UNTALK()
			=IAUD(' CTA CTE HISTORICA')
		ENDIF
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)
