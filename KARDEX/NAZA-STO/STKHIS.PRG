#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
FUNCTION STKHIS
	PARAMETER PORPAN,S_TIPO
	M.FECINI=INFEC("WIN","L¡mite del Listado")
	IF !EMPTY(M.FECINI)
		ULPR=HORA_ULP(PROGRAM())
		tt="Listado Stock Hist¢rico de "
		DO CASE
		CASE S_TIPO=1
			=OPAVIS()
			FISC="!EMPTY(KARS.AVICODPRO)"
			CAMPO="KARS.AVICODPRO"
			TT1="AVIO"
			tt=tt+"Av¡os"
		CASE S_TIPO=2
			=OPTELS()
			FISC="!EMPTY(KARS.TELCODPRO)"
			CAMPO="KARS.TELCODPRO"
			TT1="TELA"
			tt=tt+"Telas"
		CASE S_TIPO=3
			=OPCOMS()
			FISC="!EMPTY(KARS.COMCODPRO)"
			CAMPO="KARS.COMCODPRO"
			TT1="P. TERMINADO"
			tt=tt+"Productos Terminados"
		CASE S_TIPO=4
			=OPOTRS()
			FISC="!EMPTY(KARS.OTRCODPRO)"
			CAMPO="KARS.OTRCODPRO"
			TT1="DESCRIPCION"
			tt=tt+"Otros Productos"
		ENDCASE
		=OPKARS()
		SET ORDER TO
		=WORKING()
		=DOTALK()
		tt=tt+;
			crlf+;
			"al "+dtoc(m.fecini)
		FISC=FISC+" .AND. FECHAOP<={"+;
			DTOC(M.FECINI)+"}"
		=FLOCK() .OR. FLOK()
		TMP=GENTMP()
		SORT ON &CAMPO ;
			FOR &FISC ;
				TO (TMP)
		UNLO IN KARS
		=PRXAREA(.T.)
		USE (TMP) ALIAS TMP EXCL
		ACLA=PAIP+;
				PADC("Art¡culo",20)+;
				PAIP+;
				PADC(TT1,IIF(PORPAN,20,30))+;
				PAIP+;
				PADC("St. Hist.",XACDIGI)+;
				PAIP+;
				"UN"+PAIP+;
				PADC("P.Unit.",XACDIGI)+;
				PAIP+;
				PADC("Valoriz.",xacdigi+2)+;
				PAIP
		=IIF(PORPAN,STKHISP(),STKHISI())
		=UNTALK()
		=UNWORK()
		=OFF_TMP()
	ENDIF
RETURN MEN_LIN(BOTOM)
