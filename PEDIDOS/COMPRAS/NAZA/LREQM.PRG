#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE FOLC  ".F."                              && FOLC
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

PROCEDURE LREQM
	PARAMETER PORPAN,DISCRIM,Q_TIPO
	M.MESANIO=MESANIO(" Mes a listar ",.t.,.t.)
	if !empty(m.mesanio) .and. ;
		CONFIRMA("l¡mites del listado",.t.,15,10) .and. ;
		RELEWIN("WIN")
		=OPKARS()
		=OPAVIS()
		=OPTELS()
		=OPCOMS()
		=OPPER()
		=OPMIX()
		DO CASE
		CASE Q_TIPO=1
			ELANIO=VAL(RIGHT(M.MESANIO,4))
			ELMES=VAL(LEFT(M.MESANIO,2))
			SELE PER
			SET ORDER TO TAG PROCOD
			SELE AVIS
			SET ORDER TO TAG AVICODPRO
			SET RELA TO PROCOD INTO PER
			SELE KARS
			SET RELA TO AVICODPRO INTO AVIS ADDI
			TMP=GENTMP()
			=FLOCK() .OR. FLOK()
			=WORKING()
			=DOTALK()
			SORT ON PER.CLIENTE ;
				TO (TMP) FOR ;
				!EMPTY(KARS.AVICODPRO) .AND. ;
				LEFT(REFERENCIA,3)="OR " .AND. ;
				MONTH(FECHAOP)=ELMES .AND. ;
				YEAR(FECHAOP)=ELANIO
			UNLO IN KARS
			=OFF_RELA()
			=PRXAREA(.T.)
			USE (TMP) ALIAS TMP
			ACLA=PAIP+;
				PADC("C. PROV.",10)
			=UNTALK()
			=UNWORK()
		ENDCASE
	ENDIF
RETURN RELEWIN("WIN") .and. MEN_LIN(BOTOM)
