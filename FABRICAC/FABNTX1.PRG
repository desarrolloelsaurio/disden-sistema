#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE PAIP   "|"                               && PAIP
respuesta=infic("Cant. de d¡as",999999)
if last()#27 .and. ;
		!empty(respuesta)
	losdias=respuesta
	store nul to respuesta
	if !empty(elirub("a Listar",-1,1))
		elrub=left(mix.texto2,3)
		store nul to respuesta
		if !empty(eliprc("a Listar",-1,1))
			elprc=prc.prccod
			=working()
			=dotalk()
			tmp=gentmp()
			SELE COR
			SET ORDER TO TAG NUMERO
			sele FAX
			SET RELA TO NUMERO INTO COR
			=flock() .or. flok()
			FISC='tipo="@" .and. EMPTY(SF) .AND. PRC="'+ELPRC+'" .AND. ;
				LEFT(COR.ARTICULO,3)="'+ELRUB+'" .AND. ;
				date()-ef>='+ALLTRIM(STR(losdias))
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
				"de m s de "+alltrim(str(LOSDIAS))+" d¡as"+;
				CRLF+;
				"RUBRO:"+;
				ALLTRIM(SAYMIX(ELRUB,"RUBCOD"))+;
				CRLF+;
				"PROCESO:"+;
				SAYGRL(ELPRC,'PRC',"PRCCOD","ALLTRIM(PRC.PROCFAB)")
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
	ENDIF
ENDIF
RETURN .T.
