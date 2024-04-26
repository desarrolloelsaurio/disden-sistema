* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CCNS.PRG              บ
* บ COMENTARIO    : CORRIGE CONSORCIOS    บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : R. 'EL BATA'/GOYO REINER บ
* บ FECHA      : 12-29-93                 บ
* บ HORA       : 08:10:57pm               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE ME1    " Correcciขn Consorcios - "       && ME1
STOR RECNO() TO FF
REGISTRO=STR(FF)
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=MOVEWIN(CCNSR,CCNSC,CCNSR+CCNSLA,CCNSC+CCNSAN,'WIN'," Correcciขn Consorcios ")
	SELE CNS
	=LOCK("CNS") .OR. LOK("CNS")
	SCAT MEMV
	STOR 17 TO COL
	STOR .F. TO CAMBIO
	=MCNS(.T.)
	@ 2,COL GET m.consorcio ;
	PICT "@!" ;
	VALID (!SEEK(M.CONSORCIO))  .OR. !UPDATED();
	ERROR 'NOMBRE DE CONSORCIO EXISTENTE' MESS me1+'[ENTER] para Menฃ'
	READ
	IF LASTKEY()#27 .and. !EMPTY(m.consorcio)
		ACTI WIND WIN
		@ 3, COL GET M.DIRECCION PICT "@X"
		READ
		M.NADA=MIX.TEXTO1
		@ 4, COL GET M.NADA
		READ
		IF UPDATE()
			STORE NUL TO RESPUESTA
			=ELICIU(" del Consorcio",4,COL)
			M.LOCALIDAD=MIX.NU1
			M.NADA=MIX.TEXTO1
			ACTI WIND WIN
			@ 4,COL GET M.NADA
			CLEAR GETS
		ENDIF
		ACTI SCRE
		=MEN_LIN(GRABANDO)
		SELE CNS
		GOTO FF
		GATH MEMV
		=REPUSE()
		STOR .T. TO KOK
		=IAUD(M.CONCOD)
	ENDIF
	UNLO IN CNS
	=RELEWIN('WIN')
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
