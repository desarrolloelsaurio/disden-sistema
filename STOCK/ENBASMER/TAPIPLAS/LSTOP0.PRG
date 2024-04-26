* ÚÄ FUNCION  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LMERP.PRG                                                  ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 11-01-92                                                   ³
* ³ Time created: 05:37:53pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LSTOP0
	=WORKING()
	=TTLCHEQ(7)
	SET ORDER TO TAG MARCOD in mi1
	SET ORDER TO TAG TODOS in rub
	SET ORDER TO TAG PROCOD in PRO
	SELE mer
	SET ORDER TO tag articulo
	SET RELA TO MARCA INTO MI1
	SET RELA TO STR(VAL(RUBRO))+STR(VAL(SUBRUBRO)) INTO RUB ADDI
	SET RELA TO PRO1 INTO PRO ADDI
	=LMERO(GENTMP())
	GO TOP
	stor LEFT(RUB.PALISTAR,20) TO RUB1
	STOR RUB.RUBRO TO SRUB1
	acla=HAZ_ACLA()
	TT='Listado de Stock'+iif(!empty(ttque),ttque,'')
	m.linea=REPL("=",LEN(acla))
	=UNWORK()
RETURN .T.
