#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE PAIP   "|"                               && PAIP
respuesta=infic("L¡mite",999999)
if last()#27 .and. ;
		!empty(respuesta)
	=working()
	=dotalk()
	tmp=gentmp()
	sele FAX
	=flock() .or. flok()
	FISC='tipo="@" .and. EMPTY(SF) .AND. date()-ef>='+ALLTRIM(STR(respuesta))
	TT1="TODAS LAS ORDENES"
	=FABNTZ()
	sort on numero ;
		TO (TMP) ;
		field numero,;
		remito,;
		prc,;
		taller,;
		ef,;
		esc for &FISC
	UNLO IN FAX
	USE (TMP) ALIAS TMP EXCL
	TT="Ordenes de Corte Pendientes"+;
		crlf+;
		TT1+CRLF+;
		"de m s de "+alltrim(str(respuesta))+" d¡as"
	ACLA=PAIP+;
		" O.C. "+PAIP+;
		PADC("REMITO",15)+PAIP+;
		PADC("PROCESO",IIF(LG_PORP,10,20))+PAIP+;
		PADC("TALLER",IIF(LG_PORP,15,30))+PAIP+;
		PADC("CANTIDAD",XACDIGI)+PAIP+;
		"F. ENTR."+PAIP+;
		PADC("RETRASO",XACDIGI)+PAIP
	M.LINEA=REPL("=",LEN(ACLA))
	STORE NUL TO CASOS
	=untalk()
	=unwork()
	=LGRL2(LG_PORP,"TMP","LPENDIA0()",ALLTRIM(STR(RESPUESTA))+" DIAS","LPENDIA")
	SELE TMP
	USE
	ERASE (TMP)
	=OPFAB()
ENDIF
RETURN .T.
