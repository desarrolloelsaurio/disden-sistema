* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LBOCH1.PRG                                               บ
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
	M.PO1=GETNU1("PORLISMAY","FOXGRL")
	M.PO2=GETNU1("PORLISMIN","FOXGRL")
	M.FLE=GETNU1("FLETE","FOXGRL")
	ACLA=PAIP+;
	PADC("FICHA",5)+;
	PAIP+;
	PADC("DESCRIPCION",40)+;
	PAIP+;
	PADC("PROVEEDOR",20)+;
	PAIP+;
	PADC("COSTO",10)+;
	PAIP+;
	PADC("COSTO REAL",10)+;
	PAIP+;
	PADC("MAY S/IVA",10)+;
	PAIP+;
	PADC("MIN S/IVA",10)+;
	PAIP

	=IMPRESOR()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	PEPE="LISTA DE PRECIOS SIN IVA"
	=ARTTIT()
	PEPE="NO SE USA PARA DAR PRECIOS"
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
				IF EMPTY(MER.PROVEEDOR)
					?? SPACE(20)
				ELSE
					GO MER.PROVEEDOR IN PRO
					?? LEFT(PRO.FIRMA,20)
				ENDIF
				?? PAIP
				IF IMPORPROP
					STORE DOLAR TO CSTO,CSTOF,CSTOMAY
				ELSE
					CSTO=DOLAR
					CSTOF=PORCEN(CSTO,M.FLE)
					CSTOMAY=PORCEN(CSTOF,M.PO1)
				ENDIF
				CSTOMIN=PORCEN(CSTOF,M.PO2)
				?? STR(CSTO,10,2)
				?? PAIP
				?? STR(CSTOF,10,2)
				?? PAIP
				?? STR(CSTOMAY,10,2)
				?? PAIP
				?? STR(CSTOMIN,10,2)
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
