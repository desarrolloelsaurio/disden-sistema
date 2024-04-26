#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
FUNCTION LPAC
	PARAMETER PORP,escuatro
EXTERNAL PROCEDURE LPAC2.PRG
	STORE .T. TO M.OK
	STORE NUL TO M.OPTAR
	M.OPCION=iif(escuatro,5,ALGUN(30,;
	" Tipo de Listado ",;
	"\<Listados Comunes;"+;
	"Por \<M‚dico;"+;
	"Por \<Obra Social;"+;
	"Por \<Pr ctica;"+;
	"Por \<Fecha;"+;
	"Cu ndo Vino \<?;"+;
	"Resumen por Obra Social"))
	DO CASE
	CASE M.OPCION=1
		DO LPER WITH PORP
		STORE .F. TO M.OK
	CASE M.OPCION=2
		STORE NUL TO M.RESPUESTA
		IF ELIMED("a Listar",-1,1)
			FISC="LIQ.MEDICO='"+per.codcli+"'"
			TT="Pacientes de "+alltrim(per.cliente)
		ELSE
			=NOSELEC("MEDICO")
			STORE .F. TO M.OK
		ENDIF
	CASE M.OPCION=3
		=OPMUT()
		STORE NUL TO M.RESPUESTA
		IF ELIMUT("a Listar",-1,1)
			FISC="PER.TEXTO1='"+MUT.codMUT+"'"
			TT="Pacientes de "+alltrim(MUT.MUTUALABR)
		ELSE
			=NOSELEC("MUTUAL")
			STORE .F. TO M.OK
		ENDIF
	CASE M.OPCION=4
		=OPPRA()
		STORE NUL TO M.RESPUESTA
		IF ELIPRA("a Listar",-1,1)
			FISC="LIQ.PRACTICA='"+PRA.codPRA+"'"
			TT="Pacientes c/Pr ctica "+alltrim(pra.practicabr)
		ELSE
			=NOSELEC("PRACTICA")
			STORE .F. TO M.OK
		ENDIF
	CASE M.OPCION=5
		M.OPTAR=iif(escuatro,5,ALGUN(30,;
		" L¡mites de Pacientes ",;
		"C\<ompleto;"+;
		"\<C mara Gamma;"+;
		"\<Ecograf¡a;"+;
		"\<Tomograf¡a"))
		TT="Listado de Pacientes"
		DO CASE
		CASE M.OPTAR=1
			FISC=".T."
		CASE M.OPTAR=2
			FISC="LIQ.TPR='CG'"
			TT=TT+CRLF+"Pacientes de C mara Gamma"
		CASE M.OPTAR=3
			FISC="LIQ.TPR='EG'"
			TT=TT+CRLF+"Pacientes de Ecograf¡a"
		CASE M.OPTAR=4
			FISC="LIQ.TPR='TG'"
			TT=TT+CRLF+"Pacientes de Tomograf¡a"
		OTHERWISE
			STORE .F. TO M.OK
		ENDCASE
	CASE M.OPCION=6
		STORE NUL TO M.RESPUESTA
		IF ELIPAC("a Listar",-1,1)
			FISC="LIQ.PACIENTE='"+PER.CODCLI+"'"
			TT="Consultas de "+alltrim(per.CLIENTE)
		ELSE
			=NOSELEC("PACIENTE")
			STORE .F. TO M.OK
		ENDIF
	CASE M.OPCION=7
	    TT='Resumen de Pacientes por Obra Social'
	    STORE '.T.' TO M.FISC
	OTHERWISE
		STORE .F. TO M.OK
	ENDCASE
	IF M.OK
		store {} to m.fecini,m.fecfin
		if (M.OPCION=6) .OR. entre_fe("a Listar")
			=working()
			=dotalk()
			IF M.OPCION#6
				FISC=FISC+" .AND. ;
				BETW(liq.fechain,{"+DTOC(m.fecini)+"},{"+DTOC(m.fecfin)+"})"
			ENDIF
			SELE PER
			SET ORDER TO TAG PACCOD
			=OPLIQ()
			SELE LIQ
			IF M.OPCION<5
				SET RELA TO PACIENTE INTO PER
			ENDIF
			TMP=GENTMP()
			=FLOCK() .OR. FLOK()
			IF M.OPCION=5 .or. ;
			M.OPCION=7
			TT=TT+;
			CRLF+;
			"entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
			    =OPPRA()
			    SELE LIQ
			    SET ORDER TO
				SORT ON TPR,NUMERO ;
				TO (TMP) FOR &FISC
			ELSE
				SORT ON PER.CLIENTE,FECHAIN ;
				TO (TMP) FOR &FISC
			ENDIF
			TT1="entre el "+dtoc(m.fecini)+" al "+dtoc(m.fecfin)
			UNLO IN LIQ
			=OFF_RELA()
			=PRXAREA(.T.)
			USE (TMP) ALIAS TMP
			IF M.OPCION=5
				ACLA=PAIP+;
				PADC("NUMERO",10)+;
				PAIP+;
				" FECHA  "+;
				PAIP+;
				PADC("APELLIDO Y NOMBRE",30)+;
				PAIP+;
				PADC("MUTUAL",20)+;
				PAIP+;
				PADC("PRACTICA",30)+;
				PAIP+;
				PADC("MEDICO",30)+;
				PAIP
				ELTIT='"Tipo de Pr ctica:"+saymix(elcontrol,"tprcod")'
				=IIF(PORP,;
				LGRLCP("TMP","LPAC2()","TPR",ELTIT,"","LPACFP"),;
				LGRLCI("TMP","LPAC2()","TPR",ELTIT,"","LPACFP"))
			ELSE
			IF M.OPCION=7
TMP1=GENTMP()
SET RELA TO PACIENTE INTO PER
REPL ALL PRXCOD WITH PER.TEXTO1,NUMERO WITH 1
INDEX ON PRXCOD+TPR TAG PRXCOD
SET ORDER TO TAG PRXCOD
TOTAL ON TPR TO (TMP1) FIELD NUMERO
=PRXAREA(.T.)
USE (TMP1) ALIAS TMP1
			=PRXAREA(.T.)
			CREATE CURSOR TEMPORAL ;
			(CODMUT C(10),;
			MUTUAL C(30),;
			EG N(5),;
			TG N(5),;
			CG N(5),;
			TTL N(5),;
			FECHA D,;
			USUARIO C(10))
			INDEX ON CODMUT TAG CODMUT
			SET ORDER TO TAG CODMUT
			SELE TMP1
SCAN
SELE TEMPORAL
IF !XSEEK(TMP1.PRXCOD,"TEMPORAL","CODMUT")
      SCAT MEMV BLAN
      M.CODMUT=TMP1.PRXCOD
      =AGRABAR("TEMPORAL")
ENDIF
=XSEEK(TMP1.PRXCOD,"TEMPORAL","CODMUT")
SCAT MEMV
DO CASE
CASE TMP1.TPR="EG"
   M.EG=TMP1.NUMERO
CASE TMP1.TPR="TG"
   M.TG=TMP1.NUMERO
CASE TMP1.TPR="CG"
   M.CG=TMP1.NUMERO
ENDCASE
=AGRABAR1("TEMPORAL")
SELE TMP1
ENDSCAN
SELE TEMPORAL
REPL ALL TTL WITH EG+TG+CG
SET ORDER TO TAG CODMUT IN MUT
SET RELA TO CODMUT INTO MUT
REPL ALL MUTUAL WITH MUT.MUTUALABR
ACLA=PAIP+;
PADC("OBRA SOCIAL",30)+;
PAIP+;
PADC("C. GAMMA",XACDIGI)+PAIP+;
PADC("E. G.",XACDIGI)+PAIP+;
PADC("TOM.",XACDIGI)+PAIP+;
PADC("TOTAL",XACDIGI)+PAIP
SELE TEMPORAL
INDEX ON MUTUAL TAG MUTUAL
SET ORDER TO TAG MUTUAL
=LGRL2(PORP,"TEMPORAL","LPAC10()",DTOC(M.FECINI)+'-'+DTOC(M.FECFIN),"LPACXOS",4,RIGHT("99,999,999,999",XACDIGI))
			ELSE
				IF PORP
					REPO FORM LPAC1 PREV
				ELSE
					REPO FORM LPAC1 ;
					TO PRIN ;
					NOCONSOLE ;
					NOEJECT
				ENDIF
				ENDIF
			ENDIF
			=OFF_TMP()
			=unwork()
			=untalk()
		ENDIF
	ENDIF
	SELE PER
	SET ORDER TO TAG PACIENTE
RETURN .T.
