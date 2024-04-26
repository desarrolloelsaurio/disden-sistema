* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LSERMARP.PRG                    บ
* บ COMENTARIO    : LISTADO DE SERVICES (UNA MARCA) บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                        บ
* บ FECHA      : 08-20-93                           บ
* บ HORA       : 00:45:57am                         บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER            บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
ULPA=ULPR
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=WORKING()
	stor nul TO casos
	ACLA=PAIP+PADC("SERVICE",30)+PAIP+;
	PADC("DOMICILIO",30)+PAIP+;
	PADC("TELEFONO",15)
    M.LINEA=REPL("=",LEN(ACLA))
    SELE PER
    =FLOCK() .OR. FLOK()
    TMP=GENTMP()
    SORT ON CODCLI ;
    TO (TMP) ;
    FIEL CLIENTE,DOMICILIO,TELEFONO ;
    FOR &FISC
    =PRXAREA(.T.)
    USE (TMP) ALIAS TMP EXCL
	=UNWORK()
	=win0()
	pag=1
	=cabpan()
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		? PAIP
		?? TMP.CLIENTE
		?? PAIP
		?? TMP.DOMICILIO
        ?? PAIP
        ?? LEFT(TMP.TELEFONO,15)
		STORE CASOS+1 TO CASOS
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
	=IAUD(FISC)
	=OFF_TMP()
ELSE
	=iaudI()
ENDIF
ULPR=ULPA
RETURN MEN_LIN(BOTOM)
