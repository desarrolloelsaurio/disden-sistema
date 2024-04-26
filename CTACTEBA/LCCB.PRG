PROCEDURE LCCB
	PARAMETER PORPAN
	ULPR=HORA_ULP(PROGRAM())
	=CHEQSEG()
	=WORKING()
	=DOTALK()
	#DEFINE NUL    0                              && NUL
	#DEFINE BOTOM  "  "+repl("°",78)              && BOTOM
	#DEFINE PAIP   "|"                            && PAIP
	#DEFINE CRLF CHR(13)+CHR(10)                  && CRLF
	TMP=GENTMP()
	SELE CCB
	SORT ON FECHADEP TO ;
		(TMP) FOR CODBAN=MIX.NU1 .AND. ;
		BETW(FECHADEP,FECINI,FECFIN
	CALC SUM(MONTO) TO SALDO FOR ;
		CODBAN=MIX.NU1 .AND. ;
		FECHADEP<=FECINI

	TT="RESUMEN DE CUENTA"+;
		CRLF+;
		"Entre el "+;
		dtoc(m.fecini)+"al "+;
		dtoc(m.fecfin)+;
		CRLF+;
		alltrim(mix.texto1)+"-"+;
		alltrim(mix.texto2)

	ACLA=PAIP+;
		" FECHA  "+PAIP+;
		PADC("DETALLE",15)+PAIP+;
		PADC("N§ CHEQUE",11)+PAIP+;
		PADC("USUARIO",15)+PAIP+;
		PADC("PROVEED",15)+PAIP+;
		PADC("MONTO",11)+PAIP

	LINEA=REPL("=",LEN(ACLA))
	SELE CCB
	USE (TMP) ALIAS TMP
	=UNTALK()
	=UNWORK()
	=IIF(PORPAN,LCCBP(),LCCBI())
	USE
RETURN MEN_LIN(BOTOM)
