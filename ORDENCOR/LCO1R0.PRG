* 浜様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LCO1R0.PRG                        �
* � COMENTARIO    : GENERA CABECERAS - LCO1PR/LCO1IR  �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                          �
* � FECHA      : 08-16-93                             �
* � HORA       : 06:36:52pm                           �
* � COPYRIGHT  : 1993 by GREGORIO REINER              �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様�
FUNCTION LCO1R0
#DEFINE PAIP   "|"                               && PAIP
#DEFINE NUL    0                                 && NUL
	=WORKING()
	=DOTALK()
	ACLA=PAIP+"  ORDEN   "+PAIP+" FECHA  "+PAIP+;
		PADC("ARTICULO",15)+PAIP+;
		PADC("DESCRIPCION",30)+PAIP+;
		PADC("CANTIDAD",XACDIGI)+PAIP
	LINEA=REPL("=",LEN(ACLA))
	SET ORDER TO TAG NUMERO IN CO1
	SET ORDER TO TAG NUMERO IN COR
	SET ORDER TO TAG ARTIRED IN MER
	SELE COR
	SET RELA TO ARTICULO INTO MER
	SELE CO1
	SET RELA TO NUMERO INTO COR
	TMP2=GENTMP()
	SORT ON NUMERO TO (TMP2) FOR &FISC
	=PRXAREA(.T.)
	USE (TMP2) ALIAS TMP2 EXCL
	TMP=GENTMP()
	TOTAL ON NUMERO TO (TMP) FIELD CANTINI
	=PRXAREA(.T.)
	USE (TMP) ALIAS TMP EXCL
	=OFF_RELA()
	SELE COR
	SET RELA TO ARTICULO INTO MER
	SELE TMP
	SET RELA TO NUMERO INTO COR
	TT="Listado de Ordenes de Corte"+iif(empty(ttque),"",ttque)
	STORE NUL TO CASOS
	=UNTALK()
RETURN UNWORK()
