* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LSERMARI.PRG                                             บ
* บ COMENTARIO    : LISTADO DE SERVICES POR MARCA - TODAS LAS MARCAS         บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-01-93                                                    บ
* บ HORA       : 01:50:05pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	SELE PER
	SET ORDER TO TAG SERVICE
	SELE MI1
	SET ORDER TO TAG MARTEX
	stor nul TO casos
	ACLA=PAIP+;
	PADC("SERVICE",30)+PAIP+;
	PADC("DOMICILIO",30)+PAIP+;
	PADC("LOCALIDAD",20)+PAIP+;
	PADC("TELEFONO",20)+PAIP+;
	PADC("DETALLE",40)+PAIP
	LINEA=REPL("=",LEN(ACLA))
	TT="Listado de Srvices"
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_(3)
	SCAN
		STORE LEFT(MI1.TEXTO2,2) TO M.LAMARCA
		STORE .T. TO PRIMERO
		SELE PER
		SCAN FOR !EMPTY(AT(M.LAMARCA,CAG))
			IF _PLINENO>63
				=FIN_LIN(3,NUL)
				=cabpri1()
				IF !PRIMERO
					=TIT_LIN(4)
				ELSE
					=TIT_(4)
					??? CHR(18)
					??? nlq
					?? "MARCA:"
					?? MI1.TEXTO1
					??? OFFNLQ
					?
					??? CHR(15)
					=_LIN(.T.)
				ENDIF
			ENDI
			IF PRIMERO
				STORE .F. TO PRIMERO
				    ? M.LINEA
				    ?
				    ?
					??? CHR(18)
					??? nlq
					?? "MARCA:"
					?? MI1.TEXTO1
					??? OFFNLQ
					??? CHR(15)
					=_LIN(.T.)
			ENDIF
			? PAIP
			?? PER.CLIENTE
			?? PAIP
			?? PER.DOMICILIO
			?? PAIP
			?? SAYMIX(PER.LOCALIDAD,"CIUCOD")
			?? PAIP
			?? PER.TELEFONO
			?? PAIP
			?? PER.DETALLE
			?? PAIP
		ENDSCAN
		SELE MI1
	ENDSCAN
	=FIN_LIN(4,CASOS)
	EJECT PAGE
	ENDP
	=FINIMP()
	=iaud('')
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
