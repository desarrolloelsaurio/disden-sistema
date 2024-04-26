* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: LSTOP1.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 11-01-92                                                   ³
* ³ Time created: 06:23:39pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LSTOP1

	? PAIP
	=IIF(VARIABLE[1],QOUT(RUBRO+PAIP),"")
	=IIF(VARIABLE[2],QOUT(SUBRUBRO+PAIP),"")
	=IIF(VARIABLE[3],QOUT(STR(ARTICULO,TEXTO[3,2])+PAIP),"")
	=IIF(VARIABLE[4],QOUT(LEFT(MERCA,TEXTO[4,2])+PAIP),"")
	=IIF(VARIABLE[5],QOUT(LEFT(MI1.TEXTO1,TEXTO[6,2])+PAIP),"")
	=IIF(VARIABLE[6],QOUT(LEFT(PRO.PROVEEDOR,TEXTO[6,2])+PAIP),"")

	IF VARIABLE[7]
		?? STR(MER.STOCK,XACDIGI,2)
		?? PAIP
		ttl[7]=ttl[7]+MER.STOCK
		Rtl[7]=Rtl[7]+MER.STOCK
		Gtl[7]=Gtl[7]+MER.STOCK
	ENDIF

	IF VARIABLE[8]
		NADA=MER.STOCK*MER.COSTODOL*XACOTIZ
		?? STR(NADA,XACDIGI,2)
		?? PAIP
		ttl[8]=ttl[8]+NADA
		Rtl[8]=Rtl[8]+NADA
		Gtl[8]=Gtl[8]+NADA
	ENDIF

	IF VARIABLE[9]
		NADA=MER.STOCK*MER.COSTODOL
		?? STR(NADA,XACDIGI,2)
		?? PAIP
		ttl[9]=ttl[9]+NADA
		Rtl[9]=Rtl[9]+NADA
		Gtl[9]=Gtl[9]+NADA
	ENDIF

	CASOS=CASOS+1

RETURN .T.
