******************************************************************************
*-- Programa: LRECIU.PRG
*-- Fecha   : 10-14-92 11:47am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA - TIPO B
*-- MODIFICACION goyo ADAPTACION FACTURAS - RECIBOS (TIPO B)
*-- MODIFICACION GOYO / NOVOGAR
*-- PAGOS CUOTAS
*-- MODIFICACION 10-22-95 01:15am
********************************************************************************
#DEFINE PICU "999,999,999.99"                    && PICU
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
PARAMETER EL_RECIBO
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   M.EL_RECIBO=IIF(EMPTY(M.EL_RECIBO),RECI.RECIBO,M.EL_RECIBO)
   =OPCCL()
   =OPPER()
   =OPCLITXT()
   =OPCHEQ()
   =OPTARJ()
   SELE RECI
   SET ORDER TO TAG RECIBO
   IF SEEK(M.EL_RECIBO)
      ELREC=RECNO()
      STORE RECI.PESOS+RECI.DOLARES+RECI.TARJETAS+RECI.CHEQUES TO M.SUMPAG
      STORE "" TO NLQ1,NLQ2
      IF SUCU="0002"
         STORE .F. TO LPT1
         STORE .T. TO LPT2
         =IMPRESOR("LPT2")
      ELSE
         RELE LPT1,LPT2,LPT3
         =IMPRESOR("LPT1")
      ENDIF
      W=PAIP
      STOR NUL TO casos
      STOR 90 TO T1
      C1=2
      C2=18
      C7=48
      STORE 60 TO C3,C6
      C4=C3+10
      C5=55
      =CABPRI3(2,36)
      PRINTJOB
         ***************************************************
         ? 'RECIBO N§:'+RECI.RECIBO AT 40
         ? IIF(SUCU='0002','ARROYO SECO','ROSARIO') AT 40
         ?? ', '
         ?? DATECOMP(RECI.FECHAOP)
         ?
         ? "RECIBIMOS DEL SR. " at 40
         IF RIGHT(RECI.CODCLI,7)="CONTADO"
            =XSEEK(RECI.FACTURA,"CLITXT","FACTURA")
            SELE CLITXT
            SCAT MEMV
            ? alltrim(M.CLITXTNA) at 40
            ? Alltrim(M.CLITXTAD) at 40
            ? ALLTRIM(CLITXTLO) at 40
            ?
            ? "CONSUMIDOR FINAL" AT 40
            ?
         ELSE
            =XSEEK(RECI.CODCLI,"PER","CODCLI")
            ? alltrim(PER.cliente) at 40
            ?? " ("
            ?? alltrim(PER.codcli)
            ?? ")"
            ? Alltrim(PER.domicilio) at 40
            ELCODIGO=PER.CODCLI
            =XSEEK(PER.localidad,'mix','CIUCOD')
            STORE mix.texto1 TO nada
            ? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 40
            =XSEEK(right(MIX.TEXTO2,2),'MIX','PRVCOD')
            ?? ' - '
            ?? alltrim(mix.texto1)
            ?
            ? SAYMIX(PER.CONDIVA,"IVACOD") AT 40
            ? PER.NROIVA AT 40
         ENDIF
         ?
         ? "LA SUMA DE "+ALLTRIM(UPPER(xauss))+' '
 
         TT=SAY_NUM(M.SUMPAG)
         IF LEN(TT)>80
            =AJUSTE(TT,80,"-","I")
         ELSE
            ? PADR(TT,80,'-')
         ENDIF
         IF !EMPTY(RECI.FACTURA)
            TT='EN PAGO DE LA FACTURA '+RECI.FACTURA
            ? padr(tt,80,'-')
         ELSE
            SELE CCL
            SET ORDER TO TAG NUMERORE
            SEEK RECI.RECIBO
            SCAN WHILE CCL.NUMERORE=RECI.RECIBO
            ? CHR(15)            
            ?? CCL.DETALLE
            ?? " "
            ?? CCL.COMPR
            ?? " "
            ?? STR(CCL.MONTO,9,2)
            ?? " "
            ?? CCL.FECHAVE
            ?? " "
            IF CCL.FECHAVE<CCL.FECHAOP
               ?? "RETR:"
               ?? STR(CCL.FECHAOP-CCL.FECHAVE,4)
               ?? ".Ds"
            ENDIF
            ENDSCAN
         ENDIF
         ? CHR(18)
         ? "DISCRIMINACION DEL PAGO"
         if !empty(RECI.CHEQUES)
            SELE CHEQ
            SET ORDER TO TAG RECIBO
            IF XSEEK(RECI.RECIBO,"CHEQ","RECIBO")
               STORE NUL TO TT
               ACLA=PAIP+"FECHA CH"+PAIP+PADC("NUMERO",15)+PAIP+PADC("BANCO",20)+PAIP+PADC("MONTO",14)+PAIP
               LINEA=REPL("=",LEN(ACLA))
               ? LINEA
               ? ACLA
               SCAN WHILE CHEQ.RECIBO=RECI.RECIBO
                  ? PAIP
                  ?? FECHADEP
                  ?? PAIP
                  ?? LEFT(NUMERO,15)
                  ?? PAIP
                  ?? BANCO
                  ?? PAIP
                  ?? MONTO PICT PICU
                  ?? PAIP
                  TT=TT+MONTO
               ENDS
               ? PAIP+"T. CHEQ."+PAIP+SPACE(15)+PAIP+SPACE(20)+PAIP
               ?? TT PICT PICU
               ?? PAIP
               ? LINEA
            ENDIF
         endif
         IF !EMPTY(RECI.TARJETAS)
            ? SAYMIX(RECI.TARJETA,"TARCOD")
            ?? ':' AT 46
            ?? RECI.TARJETAS PICT PICU
            =XSEEK(RECI.RECIBO,"TARJ","RECIBO")
            ? "N§ TARJETA    :" AT 2
            ?? TARJ.NUMERO
            ? "N§ FORMULARIO :" AT 2
            ?? TARJ.FORMULARIO
         ENDIF
         IF !EMPTY(RECI.PESOS)
            ? XAUSS
            ?? ':' AT 46
            ?? RECI.PESOS PICT PICU
         ENDIF
         IF !EMPTY(RECI.DOLARES)
            ? XADOLS
            ?? ':' AT 46
            ?? RECI.DOLARES PICT PICU
         ENDIF
         ? "TOTAL"
         ?? ':' AT 46
         ?? M.SUMPAG PICT PICU
         _WRAP=.F.
         _lmargin=NUL
         ?
         EJECT PAGE
      ENDP
      =FINIMP()
      =IAUD(RECI.RECIBO)
      RELE LPT1,LPT2,LPT3
   ELSE
      =WNCL("RECIBO "+M.EL_RECIBO+" NO ENCONTRADO")
   ENDIF
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
