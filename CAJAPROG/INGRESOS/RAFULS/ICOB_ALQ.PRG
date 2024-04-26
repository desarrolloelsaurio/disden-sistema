* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ICOB_ALQ.PRG                                             บ
* บ COMENTARIO    : INGRESA COBROS                                           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-21-93                                                    บ
* บ HORA       : 08:40:31pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION ICOB_ALQ
PARAMETER HAYRECIBO
#DEFINE PICU "99,999,999.99"                   && PICU
#DEFINE ESCAFIN " - [ESC] para Fin"            && ESCAFIN
#DEFINE NUL    0                                 && NUL

ELCLI=PER.CODCLI
CLISHEM=ALLTRIM(PER.CLIENTE)
SELE CCL
SET ORDER TO TAG CODCLI
IF SEEK(ELCLI)
   STORE NUL TO M.SUMA
   =POPC1()
    REPL REGNO WITH 0 FOR CODCLI=ELCLI
    =MEN_LIN("[TAB] Marca / [ESC] Sale")
    ON KEY LABEL TAB DO ICOBALQ1
    =MOVECENT(0,0,10,60,"WAN",DOSSPAC(CLISHEM))
	BROW KEY ELCLI ;
	FOR EMPTY(RECIBO) .AND. EMPTY(NUMERO) .AND. !PAGADA ;
	FIELD DETALLE,;
	MTO=MONTO-CUOTA:H="MONTO",;
	MARCADO=IIF(EMPTY(REGNO),"    ","XXXX") ;
	WIND WAN ;
	FREE MARCADO ;
	NOEDIT NOMENU NOCLEAR
	ON KEY LABEL TAB
	IF !EMPTY(M.SUMA) .AND. ;
	CONFIRMA("Ingresar Cobro",.t.,16,10)
	   =OPRECB()
	   =LLIQB3(.F.,M.SUMA)
	ENDIF
	=RELEWIN("POPCARTE")
	=RELEWIN("WAN")
ELSE
   =ERROR1()
ENDIF
RETURN .T.

FUNCTION ICOBALQ1
SELE CCL
=LOCK() .OR. LOK()
=XSEEK(CCL.CODINM,"ALQ","CODINM")
IF LEFT(CCL.DETALLE,3)#"ALQ" .OR. ;
(LEFT(CCL.DETALLE,3)="ALQ" .AND. ;
ALQ.FECHAVENC>=CCL.FECHAVE)
IF EMPTY(REGNO)
   IF COMPRRE="NC"
      SUMA=SUMA-MONTO+CUOTA
   ELSE
      SUMA=SUMA+MONTO-CUOTA
   ENDIF
ELSE
   IF COMPRRE="NC"
      SUMA=SUMA+MONTO-CUOTA
   ELSE
      SUMA=SUMA-MONTO+CUOTA
   ENDIF
ENDIF
REPL REGNO WITH IIF(EMPTY(REGNO),999999,0)
UNLO IN CCL
=POPC1()
KEYB "{DNARROW}"
KEYB "{UPARROW}"
ELSE
=CARTEL("EL ALQUILER FIGURA EN CTA CTE PARA CONTROL",;
"PERO EL CONTRATO ESTA VENCIDO",;
"INGRESE EL COBRO POR LA OPCION",;
"ALQUILERES SIN CONTRATO")
ENDIF
RETURN .T.

FUNCTION POPC1
RETURN POPCARTE("MONTO:"+TRANS(SUMA,"99,999.99"))
