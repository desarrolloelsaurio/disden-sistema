* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ FUNCTION      : LCCLR0.PRG                              บ
* บ COMENTARIO    : GENERA CABECERA PARA LISTADOS DE SALDOS บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                บ
* บ FECHA      : 08-26-93                                   บ
* บ HORA       : 02:17:37pm                                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                    บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LCCLPR1
PARAMETER PORPAN,MALIMPUT,SALDONEG
	#DEFINE NUL    0                               && NUL
	#DEFINE PAIP   "|"                             && PAIP
    EXTERNAL PROCEDURE LCCLR00.PRG
	=WORKING()
	=DOTALK()
	SELE CCL
    IF MALIMPUT .OR. SALDONEG
       FISC=".T."
    ENDIF
	=FLOCK() .OR. FLOK()
	SET ORDER TO
	REPL ALL GY_DEBE WITH 0,GY_HABER WITH 0
	REPL GY_DEBE WITH MONTO FOR CCL.COMPRRE="FA"
	REPL GY_DEBE WITH MONTO FOR CCL.COMPRRE="ND"		
	REPL GY_DEBE WITH MONTO FOR CCL.COMPRRE="SD"			
	REPL GY_HABER WITH ABS(MONTO) FOR GY_DEBE=0
    SET ORDER TO TAG CODCLI
    TMP=GENTMP()
    TOTAL ON CODCLI FIELD gy_debe,gy_haber,cuota TO (TMP) FOR &FISC
    =UNLO_PRX("CCL",TMP,"TMP")
    DO CASE
    CASE SALDONEG
       DELE FOR GY_DEBE>=GY_HABER
  	   TT='Listado Cuentas con Saldo Negativo'
    CASE MALIMPUT
       DELE FOR (GY_DEBE-GY_HABER)=(GY_DEBE-CUOTA)
  	   TT='Listado Cuentas mal Imputadas'       
    OTHERWISE
       DELE FOR GY_DEBE=GY_HABER
	   TT='Listado de Saldos'+TTQUE       
    ENDCASE
    PACK
    SET ORDER TO TAG CODCLI IN PER
    SET RELA TO CODCLI INTO PER
    REPL ALL DETALLE WITH PER.CLIENTE
    INDEX ON DETALLE TAG DETALLE
    SET ORDER TO TAG DETALLE
    IF MALIMPUT
       ACLA=PAIP+"  CODIGO  "+PAIP+;
   	   PADC(IIF(SSTM2="EXPENSAS","Consorcista","Cliente"),25)+;
	   PAIP+PADC("SALDO",XACDIGI)+;
	   PAIP+PADC("IMPUTACION",XACDIGI)+;
	   PAIP
    ELSE
       ACLA=PAIP+"  CODIGO  "+PAIP+;
	   PADC(IIF(SSTM2="EXPENSAS","Consorcista","Cliente"),25)+;
	   PAIP+PADC("DEBE",XACDIGI)+;
	   PAIP+PADC("HABER",XACDIGI)+;
	   PAIP+PADC("SALDO",XACDIGI)+;
	   PAIP
	ENDIF
	LNS=REPL("=",LEN(ACLA))
	=UNTALK()
    =UNWORK()
*RETURN LGRL2(.T.,"TMP","LCCLR00()","","LCCLR",IIF(MALIMPUT,2,3),"99,999,999.99")
RETURN XPRN1(4,"TMP","LCCLR00()","","LCCLR",3,"99,999,999.99")