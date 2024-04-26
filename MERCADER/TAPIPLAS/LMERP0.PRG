* ÚÄ FUNCION  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LMERP.PRG                                                  ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 11-01-92                                                   ³
* ³ Time created: 05:37:53pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LMERP0
	=WORKING()
	SET ORDER TO TAG MARCOD in mi1
	SET ORDER TO TAG TODOS in rub
	SET ORDER TO TAG PROCOD in PRO
	SELE mer
	SET ORDER TO tag articulo
	SET RELA TO MARCA INTO MI1
	SET RELA TO STR(VAL(RUBRO))+STR(VAL(SUBRUBRO)) INTO RUB ADDI
	=LMERO(GENTMP())
	GO TOP
	stor LEFT(RUB.PALISTAR,20) TO RUB1
	STOR RUB.RUBRO TO SRUB1
	acla=HAZ_ACLA()
	TT='Listado de Mercader¡as'
	IF !EMPTY(TTQUE)
	   IF ASC(LEFT(TTQUE,1))#13
	      TT=TT+CHR(13)+CHR(10)
	   ENDIF
    TT=TT+TTQUE
	ENDIF
	m.linea=REPL("=",LEN(acla))
	=UNWORK()
RETURN .T.
