*********************************************
*-- Programa: XCCL.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE CTA CTE CLIENTES
*********************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
PROCEDURE XCCL
	PARAMETER COMPACTA
	ULPR=HORA_ULP(PROGRAM())
	IF CHEQSEG()
		IF FUERARED()#27
			SELE CCL
			=MEN_LIN('Reindexando el Archivo de Cta Cte Clientes')
			=FLOCK("CCL") .OR. FLOK("CCL")
			=DOTALK()
			=OPCCLX(JANNRO)
			=MEN_LIN('Reindexando el Archivo de Cta Cte Cheques')
			if JANNAME#"DIS-DEN Odontología"
			=FLOCK("CHEQ") .or. FLOK("CHEQ")
			=OPCHEQ(.T.)
			ENDIF
			SELE CCL
			IF COMPACTA
				SET ORDER TO
				PACK
			ENDIF
			INDEX ON FECHAOP TAG FECHAOP
			INDEX ON NUMERORE TAG NUMERORE
			INDEX ON CODCLI TAG  CODCLI
			INDEX ON FECHAVE TAG FECHAVE
			if JANNAME#"DIS-DEN Odontología"			
            IF SSTM1="HOGAR"
               =OPCHEQ(.T.)
               SELE CHEQ
               =FLOCK() .OR. FLOCK()
			   INDEX ON CODCLI TAG  CODCLI
			   INDEX ON FECHAOP TAG FECHAOP
			   INDEX ON COD_OPER TAG COD_OPER
  			   IF SSTM1="ADMIN"
				INDEX TAG ALQUILER ON LEFT(DETALLE,7)+CODINM
				INDEX TAG CODINM ON CODINM
				INDEX TAG EXPENSAS ON LEFT(DETALLE,7)+CODCLI
  			    ENDIF
               =OPCHEQ(.F.,.T.)
            ENDIF
			ENDIF
			=REOPCCL()
			=UNTALK()
			=IAUD(' CTA CTE - CTE CHEQ')
		ENDIF
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)
