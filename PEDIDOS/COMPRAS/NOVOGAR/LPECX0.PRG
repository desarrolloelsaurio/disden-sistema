* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: LPECX0.PRG                                                   ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 02-08-93                                                   ³
* ³ Time created: 02:12:16pm                                                 ³
* ³    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* GENERA INDICES PARA LISTADO DE NOTAS DE PEDIDO
#DEFINE NUL    0                                 && NUL

FUNCTION LPECX0
	=WORKING()
	SELE PE1
	SET ORDER TO TAG PEDIDO IN PEC
	SET ORDER TO TAG ARTICULO IN MER
	SET ORDER TO TAG PEDIDO IN PE1
	SET RELA TO PEDIDO INTO PEC
	=XSEEK(MER.MARCA,'MI1','MARCOD')
	=XSEEK(MER.PRO1,'PRO','PROCOD')
	TT="LISTADO DE NOTAS DE PEDIDO"+CHR(13)+CHR(10)+;
	"PEDIDOS DE "+;
	ALLTRIM(MER.MERCA)+CHR(13)+CHR(10)+;
	ALLTRIM(PRO.PROVEEDOR)+CHR(13)+CHR(10)+;
	ALLTRIM(MI1.TEXTO1)
	INDEX ON PEC.FECHA FOR PE1.ARTICULO=MER.ARTICULO TO (GENTMP()) COMP
	ACLA=PAIP+" FECHA  "+PAIP+;
	PADC("NOTA PEDIDO",14)+PAIP+;
	PADC("C. PEDIDA",XACDIGI)+PAIP+;
	PADC("C. RECIBIDA",XACDIGI)+PAIP+;
	PADC("PENDIENTE",XACDIGI)+PAIP+;
	PADC("PROM/FAC",8)+PAIP+;
	PADC("MONTO UNIT.",XACDIGI)+PAIP+;
	PADC("MONTO TOTAL",XACDIGI)+PAIP
	M.LINEA=REPL("=",LEN(ACLA))
RETURN 	UNWORK()
