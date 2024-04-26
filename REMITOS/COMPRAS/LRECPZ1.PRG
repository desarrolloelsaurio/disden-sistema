* ÚÄ Funci¢n  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LRECPZ1                                                    ³
* ³       Author: G. REINER
* ³ Date created: 10-15-92                                                   ³
* ³ Time created: 06:30:12pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LRECPZ1
	? PAIP
	=IIF(VARIABLE[1],QOUT(DTOC(FECHAREM)+PAIP),'')	
	=IIF(VARIABLE[2],QOUT(REMITO+PAIP),'')
	=IIF(VARIABLE[3],QOUT(LEFT(PRO.PROVEEDOR,TEXTO[3,2])+PAIP),"")
	=IIF(VARIABLE[4],QOUT(PEDIDO+PAIP),'')
	=IIF(VARIABLE[5],QOUT(DTOC(FECHAPED)+PAIP),'')
	=IIF(VARIABLE[6],QOUT(FACTURA+PAIP),'')
	=IIF(VARIABLE[7],QOUT(DTOC(FECHAFAC)+PAIP),'')
	=IIF(VARIABLE[8],QOUT(USUARIO+PAIP),'')
	CASOS=CASOS+1
RETURN .T.
