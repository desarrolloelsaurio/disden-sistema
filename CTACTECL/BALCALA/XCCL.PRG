********************************************************************************
*-- Programa: XCCL.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE CTA CTE CLIENTES
********************************************************************************
PROCEDURE XCCL
	Ulpr=hora_ulp(PROGRAM())
	IF CHEQSEG()
		STORE "" TO TX
		SELE CCL
		DO CASE
		CASE BAR()=1
			=men_lin('Reindexando el Archivo de Cta Cte Clientes')
			=FLOCK("CCL") .or. FLOK("CCL")
			=dotalk()
			=opCCLx(JANNRO)
			REINDEX
			=reopCCL()
			=men_lin('Reindexando el Archivo de Cta Cte Cheques')
			=FLOCK("CCH") .or. FLOK("CCH")
			=opCCHx(JANNRO)
			REINDEX
			=reopCCH()
			=untalk()
			****
			TX='REINDEX '
		CASE BAR()=2
			=men_lin('Generando Nuevo Indice de Cta Cte Clientes')
			=FLOCK("CCL") .or. FLOK("CCL")
			=OPCCLX(JANNRO)
			=dotalk()
			SELE CCL
			index on FECHAOP tag FECHAOP
			index on NUMERORE tag NUMERORE
			index on CODCLI tag  CODCLI
			index on FECHAVE tag FECHAVE
			SET TALK OFF
			=reopccl()
			SET TALK ON
			****
			=men_lin('Generando Nuevo Indice de Cta Cte de Cheques')
			=FLOCK("CCH") .or. FLOK("CCH")
			=OPCCHX()
			SET TALK ON
			SELE CCH
			index on CODCLI tag  CODCLI
			index on FECHAOP tag FECHAOP
			index on NUMERE tag NUMERE
			SET TALK OFF
			=reopCCH()
			=untalk()
			TX='CREA INDICE '
		ENDCASE
		=IIF(EMPTY(TX),"",iaud(' Cta Cte - Cte Cheq')
	ELSE
		=IAUDI()
	ENDIF
RETURN
