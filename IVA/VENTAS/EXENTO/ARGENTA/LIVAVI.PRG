********************************************************************************
*-- Programa: LIVAVI.PRG
*-- Fecha   : 09/26/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DEL IVA VENTAS, POR IMPRESORA
*-- Modificaci¢n GOYO 06-25-92 02:30pm (correccion ncre - y +)
********************************************************************************
parameter ARTEMIO
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   SET ORDER TO TAG CODCLI IN PER
   SELE FAC
   nada=""
   PAIP='|'
   truch=xacdigi-1
   FOR A=1 TO 3
      IF !EMPTY(xaci[A])
         nada=nada+paip+PADC(xaci[A],XACDIGI)
      ENDIF
   endfor
   ACLA="|  FECHA |"+IIF(ARTEMIO,PADC("COMPROBANTE",19),PADC("COMPROBANTE",9))+paip+PADC("CLIENTE",20)+paip
   IF ARTEMIO
      ACLA=ACLA+padc("N§ C.U.I.T",13)+paip
   ELSE
      ACLA=ACLA+'  CODIGO  '+PAIP+PADC("MONTO BRUTO",XACDIGI)+paip+PADC("DESCUENTOS",XACDIGI)+PAIP
   ENDIF
   ACLA=ACLA+PADC("MONTO NETO",XACDIGI)
   STORE acla+nada+paip+PADC("MONTO EXENTO",XACDIGI)+PAIP+PADC("FACTURADO",XACDIGI)+paip TO acla
   STORE REPL("=",LEN(acla)) TO lns
   STORE LEN(acla) TO largo
   STORE MIN(xacancho,xachoja) TO largoim
   MXRN=63
   =men_lin(imprimiendo)
   IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
      A=left(sincosas(janname),8)+'.TXT'
      ACTI SCRE
      @ 24,0 SAY PADC("Imprimiendo Listado en Archivo "+ALLTRIM(A),80) COLO SCHE 19
      SET PRINTER TO FILE &a
      MXRN=IIF(largoim>80,63,49)
   ENDIF
   SET PRINT ON
   SET CONSOLE OFF
   =cabpri()
   _PCOPIES=1
   _pageno=1
   PRINTJOB
      =CABPRI2()
      =TIT_LNS(3)
      STORE NUL TO totmon,totdes,totbru,totiva,totot2,totot3,totexe,totnet
      SELE fac
      SCAN FOR &fisc
         IF _PLINENO>MXRN
            =TLIVAVI("SUBTOTAL")
            =CABPRI2()
            =TIT_LNS(4)
         ENDI
         ? paip
         ?? fac->fechaem
         ?? paip
         IF EMPTY(fac->tipo)
            ?? IIF(ARTEMIO,"FACTU.","FA.")
         ELSE
            IF fac->tipo="ND"
               ?? IIF(ARTEMIO,"N.DEB.",'ND.')
            ELSE
               IF fac->tipo="NC"
                  ?? IIF(ARTEMIO,"N.CRE.",'NC.')
               ELSE
                  ?? SPACE(IIF(ARTEMIO,16,9))
               ENDIF
            ENDIF
         ENDIF
         IF ARTEMIO
            ?? SUCU
            ?? '-'
            ?? ZERO(fac->factura,8)
         ELSE
            ?? STR(FAC->FACTURA,6)
         ENDIF
         ?? paip
			SELE PER
         IF FAC.CODCLI='ANULADA'
            ?? PADC("A N U L A D A",30)
         ?? paip
         IF ARTEMIO
            ?? space(13)
            ?? paip
         ELSE
            ?? space(10)
            ?? PAIP
         ENDIF
         ELSE
         ?? iIF(SEEK(fac->codcli),LEFT(PER.cliente,20),PADL("NO EXISTE",30))
         ?? paip
         IF ARTEMIO
            ?? left(PER.nroiva,13)
            ?? paip
         ELSE
            ?? PER.CODCLI
            ?? PAIP
         ENDIF
         ENDIF
         IF xamoneda#xauss
            if fac->tipo="NC"
               IF !ARTEMIO
                  ?? "-"+str(ABS(fac->monto*fac->cotiz),truch,2)
                  ?? paip
                  ?? "-"+str(ABS(fac->DESCUENTo*fac->cotiz),truch,2)
                  ?? paip
                  STORE totMON-ABS(fac->monto*fac->cotiz) TO totMON
                  STORE totDES-ABS(fac->DESCUENTO*fac->cotiz) TO totDES
               ENDIF
               ?? "-"+str(ABS(fac->montobru*fac->cotiz),truch,2)
               STORE totbru-ABS(fac->montobru*fac->cotiz) TO totbru
            else
               IF !ARTEMIO
                  ?? " "+str(fac->monto*fac->cotiz,truch,2)
                  ?? paip
                  ?? " "+str(fac->DESCUENTo*fac->cotiz,truch,2)
                  ?? paip
                  STORE totMON+fac->monto*fac->cotiz TO totMON
                  STORE totDES+fac->DESCUENTO*fac->cotiz TO totDES
               ENDIF
               ?? " "+STR(fac->montobru*fac->cotiz,truch,2)
               STORE totbru+fac->montobru*fac->cotiz TO totbru
            endif
         ELSE
            if fac->tipo="NC"
               IF !ARTEMIO
                  ?? "-"+str(ABS(fac->monto),truch,2)
                  ?? paip
                  STORE totMON-ABS(fac->monto) TO totMON
                  ?? "-"+str(ABS(fac->DESCUENTO),truch,2)
                  ?? paip
                  STORE totDES-ABS(fac->DESCUENTO) TO totDES
               ENDIF
               ?? "-"+str(ABS(fac->montobru),truch,2)
               STORE totbru-ABS(fac->montobru) TO totbru
            else
               IF !ARTEMIO
                  ?? " "+str(fac->monto,truch,2)
                  ?? paip
                  STORE totMON+fac->monto TO totMON
                  ?? " "+str(fac->DESCUENTo,truch,2)
                  ?? paip
                  STORE totDES+fac->DESCUENTO TO totDES
               ENDIF
               ?? " "+STR(fac->montobru,truch,2)
               STORE totbru+fac->montobru TO totbru
            endif
         ENDIF
         ?? paip
         IF !EMPTY(xaci[1])
          IF xamoneda#xauss
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montoiva*fac->cotiz,truch,2)
               STORE totiva+fac->montoiva*fac->cotiz TO totiva
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montoiva*fac->cotiz),truch,2)
                  STORE totiva-ABS(fac->montoiva*fac->cotiz) TO totiva
               ENDIF
            ENDIF
           ELSE
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montoiva,truch,2)
               STORE totiva+fac->montoiva TO totiva
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montoiva),truch,2)
                  STORE totiva-ABS(fac->montoiva) TO totiva
               ENDIF
            ENDIF
           ENDIF
            ?? paip
         ENDIF
         IF !EMPTY(xaci[2])
          IF xamoneda#xauss
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montoot2*fac->cotiz,truch,2)
               STORE totot2+fac->montoot2*fac->cotiz TO totot2
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montoot2*fac->cotiz),truch,2)
                  STORE totot2-ABS(fac->montoot2*fac->cotiz) TO totot2
               ENDIF
            ENDIF
            ELSE
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montoot2,truch,2)
               STORE totot2+fac->montoot2 TO totot2
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montoot2),truch,2)
                  STORE totot2-ABS(fac->montoot2) TO totot2
               ENDIF
            ENDIF
            ENDIF
            ?? paip
         ENDIF
         IF !EMPTY(xaci[3])
          IF xamoneda#xauss
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montoot3*fac->cotiz,truch,2)
               STORE totot3+fac->montoot3*fac->cotiz TO totot3
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montoot3*fac->cotiz),truch,2)
                  STORE totot3-ABS(fac->montoot3*fac->cotiz) TO totot3
               ENDIF
            ENDIF
            ELSE
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montoot3,truch,2)
               STORE totot3+fac->montoot3 TO totot3
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montoot3),truch,2)
                  STORE totot3-ABS(fac->montoot3) TO totot3
               ENDIF
            ENDIF
            ENDIF
            ?? paip
         ENDIF
         IF xamoneda#xauss
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montoexe*fac->cotiz,truch,2)
               STORE totexe+fac->montoexe*fac->cotiz TO totexe
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montoexe*fac->cotiz),truch,2)
                  STORE totexe-ABS(fac->montoexe*fac->cotiz) TO totexe
               ENDIF
            ENDIF
         ELSE
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montoexe,truch,2)
               STORE totexe+fac->montoexe TO totexe
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montoexe),truch,2)
                  STORE totexe-ABS(fac->montoexe) TO totexe
               ENDIF
            ENDIF
         ENDIF
         ?? PAIP
         IF xamoneda#xauss
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montonet*fac->cotiz,truch,2)
               STORE totnet+fac->montonet*fac->cotiz TO totnet
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montonet*fac->cotiz),truch,2)
                  STORE totnet-ABS(fac->montonet*fac->cotiz) TO totnet
               ENDIF
            ENDIF
         ELSE
            IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
               ?? " "+STR(fac->montonet,truch,2)
               STORE totnet+fac->montonet TO totnet
            ELSE
               IF fac->tipo="NC"
                  ?? "-"+STR(ABS(fac->montonet),truch,2)
                  STORE totnet-ABS(fac->montonet) TO totnet
               ENDIF
            ENDIF
         ENDIF
         ?? paip
      ENDSCAN
      =TLIVAVI("TOTAL")
   ENDP
   =finimp()
   =Iaud((FISC))
ELSE
   =iaudi()
ENDIF
=MEN_LIN(BOTOM)
SET PRINT OFF
SET CONSOLE ON
RETURN
FUNCTION TLIVAVI
PARAMETER COSA
PRIVATE COSA
? lns
? paip
?? SPACE(8)
?? paip
?? PADR(COSA,IIF(ARTEMIO,19,9))
?? paip
?? space(30)
?? paip
IF ARTEMIO
   ?? space(13)
   ?? paip
ELSE
   ?? SPACE(10)
   ?? PAIP
   ?? STR(totmon,XACDIGI,2)+paip+STR(totdes,XACDIGI,2)+paip
ENDIF
?? STR(totbru,XACDIGI,2)
?? paip
IF !EMPTY(xaci[1])
   ?? STR(totiva,XACDIGI,2)
   ?? paip
ENDIF
IF !EMPTY(xaci[2])
   ?? STR(totot2,XACDIGI,2)
   ?? paip
ENDIF
IF !EMPTY(xaci[3])
   ?? STR(totot3,XACDIGI,2)
   ?? paip
ENDIF
?? STR(totexe,XACDIGI,2)
?? paip
?? STR(totnet,XACDIGI,2)
?? paip
_WRAP=.F.
?
EJECT PAGE
?
RETURN(.T.)
