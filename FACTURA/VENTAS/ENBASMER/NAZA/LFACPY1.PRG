* ÚÄ Funci¢n  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LFACPY1.PRG                                                ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-15-92                                                   ³
* ³ Time created: 02:03:51pm                                                 ³
* ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
FUNCTION LFACPY1
	? PAIP
	=XSEEK(LEFT(LIS.MERCA,IIF(HAYMERCA,13,6)),'MER','ARTICULO')
	?? LAMER(LIS.MERCA)
	?? PAIP
	?? IIF(HAYMERCA,MER.MERCA,padr(sinesp1(MER.PALPOPUP),30))
	?? PAIP
	?? STR(LIS.CANTIDAD,10)
	TC=TC+LIS.CANTIDAD
	?? PAIP
	?? STR(LIS.MONTO,14,2)
	TP=TP+LIS.MONTO
	?? PAIP
RETURN .T.
