* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: LRECX0.PRG                                                   ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 02-08-93                                                   ³
* ³ Time created: 02:12:16pm                                                 ³
* ³    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* GENERA INDICES PARA LISTADO DE REMITOS DE COMPRA
FUNCTION LRECX0
	=WORKING()
	SELE RE1
	SET ORDER TO TAG REMITO IN REC
	SET ORDER TO TAG ARTICULO IN MER
	SET ORDER TO TAG REMITO IN RE1
	SET RELA TO NUMERO INTO REC
	=XSEEK(MER.MARCA,'MI1','MARCOD')
	=XSEEK(MER.PRO1,'PRO','PROCOD')
	TT="LISTADO DE REMITOS"+CHR(13)+CHR(10)+;
	"REMITOS DE "+;
	ALLTRIM(MER.MERCA)+CHR(13)+CHR(10)+;
	ALLTRIM(PRO.PROVEEDOR)+CHR(13)+CHR(10)+;
	ALLTRIM(MI1.TEXTO1)
	INDEX ON REC.FECHAREM FOR RE1.ARTICULO=MER.ARTICULO TO (GENTMP()) COMP
	ACLA=PAIP+" FECHA  "+PAIP+;
	PADC("REMITO",14)+PAIP+;
	PADC("C. RECIBIDA",XACDIGI)+PAIP+;
	PADC("FACTURA",14)+PAIP+;
	PADC("F. FACT.",8)+PAIP+;
	PADC("MONTO UNIT.",XACDIGI)+PAIP+;
	PADC("MONTO TOTAL",XACDIGI)+PAIP
	M.LINEA=REPL("=",LEN(ACLA))
	=UNWORK()
RETURN .T.
