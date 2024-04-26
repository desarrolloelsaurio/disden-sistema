FUNCTION LDES0
	#DEFINE NUL    0                               && NUL
	#DEFINE PAIP   "|"                             && PAIP
	? PAIP
	?? LEFT(IIF(des.tipo=LEFT(abio,1),abio,tella),4)
	?? PAIP
	?? QDES(DES.TIPO,DES.AVI)
	?? PAIP
	?? STR(cantidad,xacdigi,3)
	?? PAIP
	?? PADR(unid[DES.UNIDAD],nada3)
	?? PAIP
	?? IIF(ORIGINAL,' ','*')
	?? PAIP
	STORE .T. TO nada
	STORE CASOS+1 TO CASOS
RETURN .T.
