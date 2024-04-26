* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LAGR0.PRG                             บ
* บ COMENTARIO    : GENERA CABECERA PARA LISTADO AGRUPADO บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                              บ
* บ FECHA      : 11-19-93                                 บ
* บ HORA       : 12:27:47pm                               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                  บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LAGR0
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
	=WORKING()
	=DOTALK()
	TMP=GENTMP()
	SET ORDER TO TAG CODCLI IN PER
	SELE CCL
	SET ORDER TO
	SET RELA TO CODCLI INTO PER
	IF TYPE("ORDCLI")#'L' .OR. ORDCLI
		SORT ON CODCLI,;
		PER.CLIENTE,;
		COMPR,;
		FECHAOP,;
		FECHAVE ;
		TO (TMP) FOR &FISC
	ELSE
		SORT ON PER.CLIENTE,;
		COMPR,;
		FECHAOP,;
		FECHAVE ;
		TO (TMP) FOR &FISC
	ENDIF
	SELE CCL
	USE
	USE (TMP) ALIAS CCL
	SET RELA TO CODCLI INTO PER
	GO TOP
	STORE NUL TO TDEBE,THABER,CDEBE,CHABER
	STORE NUL TO DEBE,HABER,CREDITO,ELCLIENTE,ELCODIGO,LAFACTURA,LAFACT1,CASOS
	=LAGRO()
	=LAGRO1()
	ACLA=PAIP+PADC("COMPROBANTE",20)+PAIP+;
	"  FECHA "+PAIP+;
	PADC("DEBE",XACDIGI)+PAIP+;
	PADC("HABER",XACDIGI)+PAIP+;
	PADC("SALDO",XACDIGI)+PAIP
	LINEA=REPL("=",LEN(ACLA))
	=UNTALK()
RETURN UNWORK()
