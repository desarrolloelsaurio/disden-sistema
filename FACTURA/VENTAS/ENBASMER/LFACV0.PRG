* ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LFACV0.PRG                         บ
* บ COMENTARIO    : LISTADO DE FACTURAS POR MERCADERIA บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                           บ
* บ FECHA      : 01-07-94                              บ
* บ HORA       : 01:54:36am                            บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER               บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LFACV0

	#DEFINE NUL    0                               && NUL
	#DEFINE PAIP   "|"                             && PAIP

	=WORKING()
	=DOTALK()
	SELE FAC
	SET ORDER TO TAG FACTURA
	SET ORDER TO TAG CODCLI IN PER
	SET RELATION TO FAC.CODCLI INTO PER
	SET ORDER TO TAG CODVIA IN VIA
	SET RELATION TO FAC.CODVIA INTO VIA ADDI
	SET ORDER TO TAG PAGCOD IN MIX
	SET RELATION TO FAC.CONDPAGO INTO MIX ADDI
	SELE FAX
	SET RELA TO FACTURA INTO FAC ADDI
	SET ORDER TO TAG ARTICULO IN MER
	SET RELA TO ARTICULO INTO MER ADDI

	STOR NUL TO CASOS,TTL
	TMP=GENTMP()
	LISTACAMPO=LISTACPO()

	SORT ON FAX.FACTURA ;
	TO (TMP) FOR ;
	&FISC ;
	FIELDS &LISTACAMPO

	SELE FAX
	USE
	USE (TMP) ALIAS FAX
	STORE .F. TO HAY
	tt='Listado de '+PROP(TIT_INVOS)+TTQUE
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	=UNTALK()
RETURN UNWORK()
