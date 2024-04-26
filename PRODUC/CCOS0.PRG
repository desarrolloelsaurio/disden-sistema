#DEFINE PAIP   "|"                               && PAIP
FUNCTION CCOS0
	? PAIP
	IF tipo=LEFT(abio,1)
		=XSEEK(aviCODPRO,'AVIS','AVICODPRO')
		?? LEFT(aviS.avio,IIF(PORPAN, 20, 30))
		uo=AVIS.unidad
		st=AVIS.stock
		mt=AVIS.monto
	ELSE
		=XSEEK(TELCODPRO,"telS","TELCODPRO")
		?? LEFT(TELS.tela,IIF(PORPAN, 20, 30))
		uo=TELS.unidad
		st=TELS.stock
		mt=TELS.monto
	ENDIF
	ct2=cantidad*camut
	ct4=iif(st>=CT2, nul, CEILING(CT2-st))
	ct5=ct4*mt
	ct6=CT2*mt
	?? PAIP
	?? str(ct2,10,3)
	?? PAIP
	?? SAYMIX(uo,"MDDCOD",10)
	?? PAIP
	?? IIF(PORPAN, '', STR(ST,10,3)+PAIP)
	?? IIF(empty(CT4), REPL('-',10), STR(ct4,10,3))
	?? PAIP
	?? IIF(PORPAN, '', STR(CT5,XACDIGI,2)+PAIP)
	?? str(ct6,XACDIGI,2)
	?? PAIP
	STORE TOTAL[1]+ct5 TO TOTAL[1]
	STORE TOTAL[2]+ct6 TO TOTAL[2]
	STORE casos+1 TO casos
RETURN
