* 浜様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LALQCTRL.PRG                     �
* � COMENTARIO    : LISTADOS DE CONTROL DE ALQUILERES�
* 麺様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                         �
* � FECHA      : 12-09-93                            �
* � HORA       : 07:02:20pm                          �
* � COPYRIGHT  : 1993 by GREGORIO REINER             �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様夕
PARAMETER P_PAN
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE NUL     0                                && NUL

ULPR=PROGRAM()
CA_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
DO CASE
CASE CA_DIJO='Fincas OK'
	=OPIAC()
	=OPINM()
	=OPINQ()
	=OPALQ()
	=OPCCL()
	=OPCCP()
	=IIF(P_PAN,LALQOKP(),LALQOKI())
CASE CA_DIJO='Fincas con Problemas'
	=OPIAC()
	=OPINM()
	=OPALQ()
	=OPINQ()
	=OPCCL()
	=OPCCP()
	STORE "" TO ACLA,LINEA,TT,CASOS
	STORE .F. TO PORPAN
	=LALQNOK0()
	=LGRL2(P_PAN,"ALQ","LALQNOK1()","","LALQNO")
CASE CA_DIJO='Fincas sin Contrato'
	=WORKING()
	=DOTALK()
	TMP=GENTMP()
	=OPINM()
	=OPALQ()
	=OPINQ()
	SET ORDER TO TAG CODINM IN ALQ
	SELE INM
	SET RELA TO CODINM INTO ALQ
	SET ORDER TO
	GO TOP
	DO CASE
	CASE TYPE("ORDINM")#"L" .OR. ORDINM
		SORT ON CODINM ;
			TO (TMP) FOR ;
			INM.CODINM#ALQ.CODINM
	OTHERWISE
		SORT ON DOMICILIO;
			TO (TMP) FOR ;
			INM.CODINM#ALQ.CODINM
	ENDCASE
	ACLA=PAIP+;
		'  CODIGO  '+PAIP+;
		PADC("DOMICILIO",30)+PAIP+;
		PADC("PROPIETARIO",30)+PAIP
	M.LINEA=REPL("=",LEN(ACLA))
	STORE NUL TO CASOS
	SELE INM
	USE (TMP) EXCL ALIAS INM
	TT="Listado de Inmuebles Desocupados"
	=UNWORK()
	=UNTALK()
	=LGRL2(P_PAN,"INM","LINMNCO0()","","LINMNCO")
	=REOPINM()
CASE CA_DIJO='Vencimiento de Contrato'
	M.FECINI=INFEC("WIN","Tope del Listado")
	IF LAST()#27 .AND. !EMPTY(M.FECINI)
		=WORKING()
		=DOTALK()
		TMP=GENTMP()
		DO OPINM
		DO OPALQ
		DO OPINQ
		SET ORDER TO TAG CODINM IN INM
		SELE ALQ
		SET RELA TO CODINM INTO INM
		SET ORDER TO
		GO TOP
		DO CASE
		CASE TYPE("ORDINM")#"L" .OR. ORDINM
			SORT ON CODINM ;
				TO (TMP) FOR ;
				ALQ.FECHAVENC<=M.FECINI ;
				FIELD CODINM,INM.DOMICILIO,INM.PROCOD,CODCLI,FECHAVENC
		OTHERWISE
			SORT ON DOMICILIO;
				TO (TMP) FOR ;
				ALQ.FECHAVENC<=M.FECINI ;
				FIELD CODINM,INM.DOMICILIO,INM.PROCOD,CODCLI,FECHAVENC
		ENDCASE
		LA_LARGO=IIF(P_PAN,15,30)
		LA_LARG1=IIF(P_PAN,25,LEN(INM.DOMICILIO))
		ACLA=IIF(P_PAN,"",PAIP)+;
			'  CODIGO  '+PAIP+;
			PADC("DOMICILIO",LA_LARG1)+PAIP+;
			PADC("PROPIETARIO",LA_LARGO)+PAIP+;
			PADC("INQUILINO",LA_LARGO)+PAIP+;
			"F. VENC."+;
			IIF(P_PAN,"",PAIP)
		M.LINEA=REPL("=",LEN(ACLA))
		STORE NUL TO CASOS
		SELE ALQ
		USE (TMP) EXCL ALIAS ALQ
		TT="Listado de Vencimiento de Contrato"+CHR(13)+CHR(10)+;
			"Hasta el "+DTOC(M.FECINI)
		=UNWORK()
		=UNTALK()
		=LGRL2(P_PAN,"ALQ","LCONVEN0()",DTOC(M.FECINI),"LCONVEN")
		=REOPALQ()
	ENDIF
ENDCASE
=OFF_TMP()
=OFF_RELA()
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
