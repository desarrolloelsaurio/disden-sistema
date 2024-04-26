FUNCTION LFCDP1
#DEFINE PAIP   "|"                               && PAIP
	?paip
	=iif(variable[1],qout(PADR(FAR.FACTURA,texto[1,2])+paip),"")
	=iif(variable[2],qout(PADR(FAR.FECHAEM,texto[2,2])+paip),"")
	=iif(variable[3],qout(PADR(cns.Consorcio,texto[3,2])+paip),"")
	=iif(variable[4],qout(PADR(FAR.FECHAVE,texto[4,2])+paip),"")
	=iif(variable[5],qout(PADR(FAR.TIPO,texto[5,2])+paip),"")
	=iif(variable[6],qout(PADR(PER.CLIENTE,texto[6,2])+paip),"")
	=iif(variable[7],qout(PADR(SAYMIX(far.CONDPAGO,"PAGCOD"),texto[7,2])+paip),"")
	=IIF(variable[8],QOUT(SAY_TTL(8,FAR.MONTO)),"")
	=IIF(VARIABLE[9],QOUT(SAY_TTL(9,FAR.DESCUENTO)),"")
	=IIF(VARIABLE[10],QOUT(SAY_TTL(10,FAR.MONTOBRU)),"")
	=IIF(VARIABLE[11],QOUT(SAY_TTL(11,FAR.MONTOIVA)),"")
	=IIF(VARIABLE[12],QOUT(SAY_TTL(12,FAR.MONTOOT2)),"")
	=IIF(VARIABLE[13],QOUT(SAY_TTL(13,FAR.MONTOOT3)),"")
	=IIF(VARIABLE[14],QOUT(SAY_TTL(14,FAR.MONTOEXE)),"")	
	=IIF(VARIABLE[15],QOUT(SAY_TTL(15,FAR.MONTONET)),"")
	=iif(variable[16],qout(PADR(SAYMIX(FAR.GASCOD,'GASCOD'),texto[16,2])+paip),"")
	=iif(variable[17],qout(PADR(iif(far.MONEDA=left(xadols,1),xadols,xauss),texto[17,2])+paip),"")
	=iif(variable[18],qout(SAY_TTL(18,FAR.COTIZ)),"")
	casos=iif(variable[CANT_MAX],impuse(),casos+1)
RETURN .T.
