* 浜様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LINTER.PRG                  �
* � COMENTARIO    : LISTADO DE MEDICOS INTERNOS �
* 麺様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                    �
* � FECHA      : 07-28-94                       �
* � HORA       : 11:07:19am                     �
* � COPYRIGHT  : 1994 by GREGORIO REINER        �
* 藩様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

PARAMETER PORPAN
STOR {} TO M.FECINI,M.FECFIN
IF ENTRE_FE("L�mites del Listado")
   DO OPMUT
   DO OPPRA
   DO OPINTER
	STOR NUL TO RESPUESTA
	IF ELIINTER("a Listar",-1,1)
	=WORKING()
	=DOTALK()
		DO OPLIQ
		SELE LIQ
		SET ORDER TO
		tmp=gentmp()
		=FLOCK() .OR. FLOK()
		SORT ON TPR,;
		NUMERO ;
		TO (TMP) ;
		FOR INTERNO=PER.CODCLI .AND. ;
			FECHAIN>=M.FECINI .AND. ;
			FECHAIN<=M.FECFIN .AND. ;
			LIQUIDADO
			
			USE (TMP) ALIAS LIQ EXCL
			ACLA=PAIP+;
			PADC("NUMERO",IIF(PORPAN,6,13))+;
			PAIP+;
			" FECHA  "+;
			PAIP+;
			PADC("PACIENTE",IIF(PORPAN,20,27))+;
			PAIP+;
			PADC("O. SOCIAL",20)+;
			PAIP+;
			PADC("PRACTICA",IIF(PORPAN,8,31))+;
			PAIP+;
			"SUBCODIGO "+;
			PAIP
			M.LINEA=REPL("=",LEN(ACLA))
			M.TT="Listado de Pr�cticas Realizadas y Facturadas"+;
			crlf+;
			"Entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)+;
			crlf+;
			alltrim(per.cliente)
			=UNTALK()
			=UNWORK()
			IF PORPAN
				DO LINTERP
			ELSE
				DO LINTERI
			ENDIF
			=off_tmp()
			=OPLIQ(.T.)
		ENDIF
	ENDIF
RETURN
