#DEFINE PICU "999,999,999.99"
#DEFINE NUL  0                                   && NUL
#DEFINE PAIP "|"                                 && PAIP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

PARAMETER OPANUM,L_FACNUM,L_PROCOD
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   W=PAIP
   STOR NUL TO CASOS
   STOR 90 TO T1
   C1=2
   C2=18
   C7=48
   STORE 60 TO C3,C6
   C4=C3+10
   C5=55
   STORE "" TO NLQ1,NLQ2
   RELE LPT1,LPT2,LPT3
   =CABPRI3(2,36)
   PRINTJOB
      ***************************************************
      =CABEMP(.F.,ZERO(OPANUM,8))
      ?
      =XSEEK(L_FACNUM+L_PROCOD,"FAR","FACTURAC")
      ? "PROVEEDOR:"
      ?? SAYPER(L_PROCOD,"PROCOD")
      ? "FACTURA  :"
      ?? L_FACNUM
      ?
      ? "FORMA DE PAGO:"
      SELE CAJ
      SET ORDER TO TAG COMPR
      OPBUSCO="OP N§ "+ZERO(OPANUM,8)
      SEEK OPBUSCO
      STORE NUL TO M.TOTAL
      SCAN WHILE COMPR=OPBUSCO
         ? PAIP
         ?? FECHAOP
         ?? PAIP
         ?? ABS(MONTO)
         ?? PAIP
         ?? MONEDA
         ?? PAIP
         M.TOTAL=M.TOTAL+ABS(MONTO)
      ENDSCAN
      ?
      ? "TOTAL:"
      ?? M.TOTAL PICT PICU
      ?
      ? "SON:"
      ?? SAY_NUM(M.TOTAL)
      ?
      ?
      ? PADC(DTOC(DATE())+SPACE(10)+"PP ADMINISTRACION RAFULS",80)
      ? PADC("--------"+SPACE(10)+REPL("-",24),80)
      _WRAP=.F.
      _LMARGIN=NUL
      EJECT PAGE
   ENDP
   =FINIMP()
   =IAUD(OPBUSCO)
   RELE LPT1,LPT2,LPT3
ELSE
   =IAUDI()
ENDI
RETURN MEN_LIN(BOTOM)
