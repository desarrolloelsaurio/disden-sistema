* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : RECFA3.PRG                                               บ
* บ COMENTARIO    : RECIBE PAGA UNA FACTURA MANDADA A PAGAR                  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-15-94                                                    บ
* บ HORA       : 06:13:43pm                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
STORE NUL TO RESPUESTA
SELE CCP
=FLOCK("CCP") .OR. FLOK("CCP")
SET ORDER TO
=UNWORK()
=MOVEWIN(5,0,15,79,"win"," Recepciขn de Facturas Pagas ")
=MEN_LIN("[ENTER] Selecciona-Deselecciona / [TAB] Confirma / [ESC] Anula")
ON KEY LABEL ENTER DO RECFA31
ON KEY LABEL TAB KEYB CHR(23)
BROW ;
FIEL PR=SAYPER(CCP.PROCOD,"PRPCOD",20):H=PADC("PROPIETARIO",20):R ,;
DETALLE:H=PADC("DETALLE",10):P="!!!!!!!!!!!!!!!":R ,;
NUMERORE:H=PADC("NUMERO",14):R ,;
MONTO:H=PADC("MONTO",9):P="99,999.99":R,;
RECB=IIF(EMPTY(REGNO)," NO "," SI "):R ;
FREE DETALLE ;
FOR !PAGADA .AND. ;
	AUTORIZ .AND. ;
	COMPRRE="FA" .AND. ;
	EMPTY(COMPR) .AND. ;
	IDA ;
	WIND WIN ;
	NOCLEAR
	ON KEY LABEL ENTER
	ON KEY LABEL TAB
	IF LAST()#27 .AND. ;
		CONFIRMA("facturas recibidas ",.t.,21,0)
		SCAN FOR !PAGADA .AND. ;
			AUTORIZ .AND. ;
			COMPRRE="FA" .AND. ;
			EMPTY(COMPR) .AND. ;
			REGNO=9999 .AND. ;
			PROCOD=PER.CODCLI
			REPL IDA WITH .T.
			REPL REGNO WITH NUMERO
			SUMA=SUMA+CCP.MONTO
			M.CAJA="F3"
			M.CODCLI=PER.CODCLI
			M.FECHAOP=DATE()
			M.COMPR="OP Nง "+ZERO(NUMERO,8)
			M.COMPRRE="FA"
			M.NUMERE="A0001-"+ZERO(NUMERO,8)
			M.MONTO=0-CCP.MONTO
			M.MONEDA=CCP.MONEDA
			M.PROCOD=PER.CODCLI
			=AGRABAR("CAJ")
		ENDSCAN
	ENDIF
	=RELEWIN("WIN")
RETURN

PROCEDURE RECFA31
	IF EMPTY(REGNO)
		REPL REGNO WITH 9999
	ELSE
		REPL REGNO WITH NUL
	ENDIF
RETURN
