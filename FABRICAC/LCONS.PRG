* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCONS.PRG               บ
* บ COMENTARIO    : LISTADO DE CONSISTENCIA บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 11-01-93                   บ
* บ HORA       : 01:50:15pm                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=OPCOR()
	=OPFAB()
	SET ORDER TO TAG NUMERO IN COR
	SELE FAX
	SET RELA TO NUMERO INTO COR
	=WORKING()
	=DOTALK()
	set order to
	TMP=GENTMP()
	=FLOCK("FAX") .OR. FLOK("FAX")
	sort on numero,REMITO,posic,taller to (TMP) for tipo="@" .AND. ;
		EMPTY(COR.FECHAFIN) ;
		FIELD NUMERO,;
		POSIC,;
		REMITO,;
		PRC,;
		TALLER,;
		EF,;
		SF,;
		EEC,;
		ESC,;
		SEC,;
		SSC
	UNLO IN FAX
	SET RELA OFF INTO COR
	=PRXAREA(.T.)
	use (TMP) ALIAS TMP EXCL
	dele for empty(numero)
	PACK
	STOR NUL TO CASOS
	ACLA=PAIP+;
		"O.COR"+PAIP
	FOR A=1 TO 8
		ACLA=ACLA+PADC("REMITO Nง "+ALLTRIM(STR(A)),15)+PAIP
	NEXT
	LINEA=REPL("=",LEN(ACLA))
	=untalk()
	=unwork()
	=CABPRI()
	_PCOPIES=1
	TT="Listado de Consistencia"
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE TMP
	store nul to elnum
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		if TMP.NUMERO#elnum
			IF !EMPTY(ELNUM)
				CANTIDAD=UNO[1]
				STORE .T. TO OK
				FOR A=1 TO PUNTERO
					IF UNO[A]#CANTIDAD .OR. ;
							DOS[A]#CANTIDAD .OR. ;
							TRES[A]#CANTIDAD .OR. ;
							CUATRO[A]#CANTIDAD
						STORE .F. TO OK
						EXIT
					ENDIF
				NEXT
				IF !OK
					?"|"
					?? STR(ELNUM,5)
					?? "|"
					FOR A=1 TO PUNTERO
						?? STR(UNO[A],4)
						?? "/"
						?? IIF(EMPTY(CA1[A]),SPACE(4),STR(CA1[A],4))
						?? "-"
						?? STR(CUATRO[A],4)
						?? " >"
					NEXT
				ENDIF
			ENDIF
			elnum=TMP.NUMERO
			STORE 0 TO PUNTERO
			RELE RE,CA,TA
			DIME RE[1],UNO[1],TA[1],CA1[1],PO[1],;
				DOS[1],TRES[1],CUATRO[1]
			STORE 0 TO UNO[1],CA1[1],DOS[1],TRES[1],CUATRO[1]
		ENDIF

		ESERRE=(LEFT(REMITO,1)="R")
		POSI=ASCAN(RE,LEFT(REMITO,14))
		IF EMPTY(POSI)
			IF ESERRE
				POSI=ASCAN(TA,TMP.TALLER)
			ENDIF
			IF EMPTY(POSI)
				PUNTERO=PUNTERO+1
				DIME RE[PUNTERO],UNO[PUNTERO],TA[PUNTERO],CA1[PUNTERO],PO[PUNTERO],;
					DOS[PUNTERO],TRES[PUNTERO],CUATRO[PUNTERO]
				RE[PUNTERO]=TMP.REMITO
				UNO[PUNTERO]=TMP.EEC
				DOS[PUNTERO]=TMP.ESC
				TRES[PUNTERO]=TMP.SEC
				CUATRO[PUNTERO]=TMP.SSC
				TA[PUNTERO]=TMP.TALLER
				CA1[PUNTERO]=0
				PO[PUNTERO]=POSIC
			ELSE
				IF ESERRE
					CA1[POSI]=CA1[POSI]+SSC
				ELSE
					UNO[POSI]=UNO[POSI]+EEC
					DOS[POSI]=DOS[POSI]+ESC
					TRES[POSI]=TRES[POSI]+SEC
					CUATRO[POSI]=CUATRO[POSI]+SSC
				ENDIF
			ENDIF
		ELSE
			IF ESERRE
				CA1[POSI]=CA1[POSI]+SSC
			ELSE
				UNO[POSI]=UNO[POSI]+EEC
				DOS[POSI]=DOS[POSI]+ESC
				TRES[POSI]=TRES[POSI]+SEC
				CUATRO[POSI]=CUATRO[POSI]+SSC
			ENDIF
		ENDIF
		SELE TMP

	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
	=BORTEMP(FULL(DBF()))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
