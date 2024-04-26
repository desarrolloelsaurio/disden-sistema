* ษออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LORPAG.PRG               บ
* บ COMENTARIO    : LISTA ORDENES DE PAGO    บ
* ฬออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                 บ
* บ FECHA      : 11-01-93                    บ
* บ HORA       : 01:50:15pm                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER     บ
* ศออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER NUORPAG
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
=CHEQSEG()
=OPPER()
=OPFAR()
=OPOPAG()
IF XSEEK(M.NUOPAG,"ORP","NUMERO")
   STOR NUL TO CASOS
   LINEA=REPL("=",LEN(ACLA))
   =CABPRI()
   _PCOPIES=1
   PRINTJOB
      =CABPRI1()
      =TIT_(3)
      ? PADL("Orden de Pago Nง:"+zero(m.nuopag,8),70)
      ? PADL("Fecha           :"+dtoc(date()),70)
?
? "PROVEEDOR:"
?? SAYPER(ORP.PROCOD,"PROCOD")+"  ("+ALLTRIM(PER.PROCOD)+")" AT 20
? PER.DOMICILIO AT 20
? SAYMIX(PER.LOCALIDAD,"CIUCOD") AT 20
*** IMPRIME FACTURAS A PAGAR
SELE FAR
SET ORDER TO TAG ORPAG
SEEK M.NUOPAG
SCAN WHILE FAR.ORPAG=M.NUORPAG
? FAR.FACTURA
?? " "
?? FAR.FECHAEM
?? " "
?? TRANS(FAR.MONTO,"999,999.99")
ENDSCAN
*** IMPRIME DATOS DE LA ORDEN DE PAGO
SELE ORP
SET ORDER TO TAG NUMERO
SEEK M.NUORPAG
      SCAN WHILE NUMERO=M.NUORPAG
      ? DETALLE
      ?? PAIP
      ?? TRANS(ORP.EFECTIVO,"999,999.99")
      ?? "|"
      ?? TRANS(ORP.CHEQUES,"999,999.99")
      ?? "|"
      ?? TRANS(ORP.CHEQUES3,"999,999.99")
      ?? "|"
      ?? TRANS(ORP.DOLARES,"999,999.99")
      ?? "|"
      ?? TRANS(ORP.TARJETA,"999,999.99")
      ?? "|"
      ENDSCAN
      TMP=GENTMP()
      =FLOCK() .OR. LOK()
      TOTAL ON NUMERO TO (TMP) FOR NUMERO=M.NUORPAG
      =UNLO_PRX("ORP",TMP,"TEMP1")
      SELE TEMP1
      ? PADR("TOTAL",30)
      ?? PAIP
      ?? TRANS(EFECTIVO,"999,999.99")
      ?? "|"
      ?? TRANS(CHEQUES,"999,999.99")
      ?? "|"
      ?? TRANS(CHEQUES3,"999,999.99")
      ?? "|"
      ?? TRANS(DOLARES,"999,999.99")
      ?? "|"
      ?? TRANS(TARJETA,"999,999.99")
      ?? "|"
   ENDP
   =FINIMP()
   =IAUD(ALLTRIM(STR(M.NUORPAG)))
   =OFF_TMP()
ELSE
=NOSELEC("ORDEN DE PAGO")
ENDIF   
RETURN MEN_LIN(BOTOM)
