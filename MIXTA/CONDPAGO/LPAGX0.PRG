* ษออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPAGX0.PRG                 บ
* บ COMENTARIO    : GENERA CABECERA COND. PAGO บ
* ศออออออออออออออออออออออออออออออออออออออออออออผ
* 12/10/95 CAMBIO DE NOMBRE. LOS ERRORES SE PAGAN CARO.
FUNCTION LPAGX0
=WORKING()
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
STOR NUL TO CASOS
ACLA=PAIP+;
"CD"+PAIP+;
PADC("CONDICIONES DE PAGO",20)+PAIP+;
"CUOTAS"+PAIP+;
"DS. 1ฆ"+PAIP+;
"SALTO"+PAIP+;
PADC("% EN "+UPPER(XAUSS),XACDIGI)+PAIP+;
PADC("% EN "+UPPER(XADOLS),XACDIGI)+;
"|FECHA IN|  USUARIO |"
tt='Listado de Condiciones de Pago'
SELE MIX
IF TYPE("ORDPAG")="U" .OR. ORDPAG
	SET ORDER TO TAG PAGCOD
ELSE
	SET ORDER TO TAG PAGTEX
ENDIF
RETURN UNWORK()
