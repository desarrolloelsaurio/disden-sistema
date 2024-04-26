* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Application: Billing Information System                                 ³
* ³    File Name: LMERP1.PRG                                                 ³
* ³       Author: Bill French                                                ³
* ³ Date created: 11-01-92                                                   ³
* ³ Time created: 06:23:39pm                                                 ³
* ³    Make File: DEMO.RMK                                                   ³
* ³    Exec File: DEMO.EXE                                                   ³
* ³    Copyright: 1992 by Global Technologies Corporation                    ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LMERP1

    ? PAIP
	=IIF(VARIABLE[1],QOUT(RUBRO+PAIP),"")
	=IIF(VARIABLE[2],QOUT(SUBRUBRO+PAIP),"")
	=IIF(VARIABLE[3],QOUT(STR(ARTICULO,TEXTO[3,2])+PAIP),"")
	=IIF(VARIABLE[4],QOUT(LEFT(MERCA,TEXTO[4,2])+PAIP),"")

	IF VARIABLE[5]
		=XSEEK(MER.COLOR,'MIX','COLCOD')
		?? LEFT(MIX.TEXTO1,TEXTO[5,2])
		?? PAIP
	ENDIF

	=IIF(VARIABLE[6],QOUT(LEFT(MI1.TEXTO1,TEXTO[6,2])+PAIP),"")

	IF VARIABLE[7]
		=XSEEK(MER.LINEA,'MIX','LINCOD')
		?? LEFT(MIX.TEXTO1,TEXTO[7,2])
		?? PAIP
	ENDIF

	FOR XA= 8 TO 10
		IF VARIABLE[XA]
			=XSEEK(IIF(xa=8,MER.pro1,IIF(xa=9,MER.pro2,MER.pro3)),'PRO','PROCOD')
			?? LEFT(PRO.PROVEEDOR,TEXTO[XA,2])
			?? PAIP
		ENDIF
	NEXT

	IF VARIABLE[11]
		=XSEEK(MER.MATERIAL,'MIX','MATCOD')
		?? LEFT(MIX.TEXTO1,TEXTO[11,2])
		?? PAIP
	ENDIF

	IF VARIABLE[12]
		=XSEEK(MER.GRUPO,'MIX','GRUCOD')
		?? LEFT(MIX.TEXTO1,TEXTO[12,2])
		?? PAIP
	ENDIF

	=IIF(VARIABLE[13],QOUT(IIF(NACIONAL,'NAC','IMP')+PAIP),"")
	CASOS=CASOS+1

RETURN .T.
