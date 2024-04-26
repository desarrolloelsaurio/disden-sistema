#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
PROCEDURE CONSAVI
	PARAMETER PORPX1,ELTIP
	EXTERNAL PROCEDURE CONSAVI0.PRG
	=OPMDD()
	=OPAVIS()
	=OPKARS()
	STORE NUL TO M.RESPUESTA
	IF ELIAVIS("a Listar",-1,1)
		=WORKING()
		=DOTALK()
		TT="Listado de Consumo de Av¡os"+;
			crlf+;
			alltrim(avis.avio)+" ("+alltrim(avis.avicodpro)+")"+;
			CRLF+;
			"Cantidades expresadas en "+alltrim(upper(saymix(avis.unidad,"mddcod")))
		lacosa=avis.avicodpro
		tmp=gentmp()
		tmp1=gentmp()
		SELE KARS
		SET ORDER TO
		=FLOCK() .OR. FLOK()
		SORT ON FECHAOP ;
			TO (TMP) FOR ;
			KARS.AVICODPRO=LACOSA .AND. ;
			!EMPTY(KARS.SALIDA) .AND. ;
			!EMPTY(KARS.REFERENCIA)
		UNLO IN KARS
		=PRXAREA(.T.)
		USE (TMP) ALIAS TMP
		REPL ALL AVICODPRO WITH STR(YEAR(FECHAOP),4)+STR(MONTH(FECHAOP),2)
		INDEX ON AVICODPRO TAG AVICODPRO
		TOTAL ON AVICODPRO TO (TMP1) FIELD SALIDA
		=PRXAREA(.T.)
		USE (TMP1) ALIAS TMP1
		ACLA=PAIP+;
		"MES"+PAIP+;
		"A¥O"+PAIP+;
		PADC("CONSUMO",XACDIGI)+PAIP+;
		PADC("MONTO",XACDIGI)+PAIP
		=LGRL2(PORPX1,"TMP1","CONSAVI0()","","LCNSAVI",2,REPL("9",XACDIGI))
 		=OFF_TMP()
		=UNWORK()
		=UNTALK()
	ENDIF
RETURN MEN_LIN(BOTOM)
