* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMIN.PRG                                                 บ
* บ COMENTARIO    : LISTADO COSTOS                                           บ
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
DO OPSEG
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
    DESDE=DESDE()
	STORE 80 TO LARGO,LARGOIM,XACANCHO,XACHOJA
	STORE NUL TO CASOS
	SELE MER
	=OPMIX()
	M.POR=GETNU1("PORLISMIN","FOXGRL")
	M.FLE=GETNU1("FLETE","FOXGRL")
	ACLA=PAIP+;
	PADC("FICHA",5)+;
	PAIP+;
	PADC("DESCRIPCION",40)+;
	PAIP+;
	PADC("PROVEEDOR",20)+;
	PAIP+;
	PADC("PUB. S/IVA",10)+;
	PAIP+;
	PADC("IVA 18%",10)+;
	PAIP+;
	PADC("IVA 9%",10)+;
	PAIP+;
	PADC("C. FINAL",10)+;
	PAIP+;
	PADC("RSP NO INS",10)+;
	PAIP
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	PEPE="LISTA DE PRECIOS MINORISTA"
	=ARTTIT()
	PEPE="PARA USO EN MOSTRADOR"
	=ARTTIT()
	SELE MER
	IF DESDE#1
	   GO DESDE
	ELSE
	   GO TOP
	ENDIF
	SCAN WHILE !EOF()
		IF LEN(RTRIM(LTRIM(detalle)))#0
			IF _PLINENO>63
				=FIN_LIN(3,NUL)
				=cabpri1()
				IF LEN(RTRIM(artic))#3
					PEPE=PEPE+" Cont."
					=ARTTIT()
					=_LIN(.T.)
				ENDIF
			ENDI
			IF LEN(RTRIM(artic))=3
				pepe=RTRIM(detalle)+' ('+LEFT(artic,3)+')'
				pepe=PADR(pepe,40)
				? M.LINEA
				?
				DO arttit
				=_LIN(.T.)
			ELSE
				? PAIP
				?? STR(RECNO(),5)
				?? PAIP
				?? detalle
				?? PAIP
				if empty(mer.proveedor)
					?? space(20)
				else
					GO mer.PROVEEDOR IN PRO
					?? left(PRO.FIRMA,20)
				endif
				?? PAIP
				IF IMPORPROP
					CSTO=DOLAR
				ELSE
					CSTO=PORCEN(DOLAR,M.FLE)
				ENDIF
				CSTO=PORCEN(CSTO,M.POR)
				IV18=CSTO*.18
				IV09=CSTO*.09
				?? STR(CSTO,10,2)
				?? PAIP
				?? STR(IV18,10,2)
				?? PAIP
				?? STR(IV09,10,2)
				?? PAIP
				?? STR(CSTO+IV18,10,2)
				?? PAIP
				?? STR(CSTO+IV18+IV09,10,2)
				?? PAIP
			ENDIF
		ENDIF
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
