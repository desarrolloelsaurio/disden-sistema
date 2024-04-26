* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPREPRAI.PRG                                             บ
* บ COMENTARIO    : LISTA DE PRECIOS POR IMPRESORA                           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-01-93                                                    บ
* บ HORA       : 01:50:15pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	ACLA=PAIP+;
	PADC("CODIGO",9)+PAIP+;
	PADC("DENOMINACION",40)+PAIP
	SELE MIX
	SET ORDER TO TAG TIPCOD
	COUNT TO REGS
	DIME COD[REGS+1],CTD[REGS+1],CONTEN[REGS+1]
	REGHON=REGS
	REGGAS=REGS+1
	STORE NUL TO CTD,PUNTERO
	SCAN
		IF EMPTY(AT("UNIDADES",MIX.TEXTO1))
			PUNTERO=PUNTERO+1
			COD[PUNTERO]=LEFT(MIX.TEXTO2,3)
			ACLA=ACLA+PADC(MIX.TEXTO1,XACDIGI)+PAIP
		ENDIF
	ENDSCAN
	COD[REGHON]="HON"
	COD[REGGAS]="GTS"
	ACLA=ACLA+PADC("HONORARIOS",XACDIGI)+PAIP+;
	PADC("GASTOS",XACDIGI)+PAIP
	ACLA=ACLA+PADC("TOTAL",XACDIGI)+PAIP+;
	"C"+PAIP
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE PRA
	SET ORDER TO TAG PRACTICA
	SCAN FOR TPR=ELTPR
		STORE "" TO CONTEN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		? PAIP
		?? PRA.CODPRA PICT "@R 99.99.99X"
		?? PAIP
		?? PRA.PRACTICA
		?? PAIP
		LAPOS=ASCAN(COD,PRA.TIPO3)
		IF !EMPTY(LAPOS)
			CTD[LAPOS]=CTD[LAPOS]+PRA.CANTIDAD3
			CONTEN[LAPOS]=PRA.UNIDAD3
		ENDIF
		CTD[REGHON]=CTD[REGHON]+PRA.CANTIDAD1
		CONTEN[REGHON]=PRA.UNIDAD1
		CTD[REGGAS]=CTD[REGGAS]+PRA.CANTIDAD2
		CONTEN[REGGAS]=PRA.UNIDAD2

		STORE NUL TO ELTOT
		FOR XA=1 TO REGGAS
			IF !EMPTY(CONTEN[XA])
				IF XA=REGGAS .OR. ;
					XA=REGGAS-1
					=XSEEK(ELTAR+CONTEN[XA],"MIX","ARACOD")
					CTD[XA]=CTD[XA]*MIX.NU1
				ELSE
					=XSEEK(CONTEN[XA],"MIX",COD[XA]+"COD")
					CTD[XA]=CTD[XA]*MIX.NU1
				ENDIF
			ENDIF
			?? STR(CTD[XA],XACDIGI,2)
			?? PAIP
			ELTOT=ELTOT+CTD[XA]
			STORE NUL TO CTD[XA]
		NEXT
		?? STR(ELTOT,XACDIGI,2)
		?? PAIP
		?? IIF(EMPTY(PRA.CONTRASTE)," ","*")
		?? PAIP
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
