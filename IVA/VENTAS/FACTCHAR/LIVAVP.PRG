********************************************************************************
*-- Programa: LIVAVP.PRG
*-- Fecha   : 09/26/91
*-- Version : V.LEEGSTRA
*-- Notas   : IVA VENTAS POR PANTALLA
********************************************************************************
SELE seg
ULPR=HORA_ULP(PROGRAM())
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   =win0()
   pag=1
   =cabpan()
   nada=""
   FOR A=1 TO 3
     IF !EMPTY(xaci[A])
       nada=nada+PAIP+PADC(xaci[A],11)
     ENDIF
   endfor
   STORE "  FECHA |"+PADC("COMPROBANTE",17)+PAIP+PADC("MONTO NETO",11) TO acla
   STORE acla+nada+PAIP+PADC("FACTURADO",11) TO acla
   STORE REPL("=",LEN(acla)) TO lns
   =tit_lns(1)
   STORE 0 TO totbru,totiva,totot2,totot3,totnet
   SELE fac
   SCAN FOR &fisc
      IF ROW()=21
         IF TLIVAVP("SUBTOTAL")=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         =tit_lns(2)
      ENDIF
      ? fac->fechaem
      ?? PAIP
      ?? IiF(EMPTY(fac->tipo),"FA ",FAC->TIPO+' ')+fac->factura
      ?? PAIP
      IF xamoneda#xauss
         if fac->tipo="NC"
            ?? "-"+str(ABS(fac->montobru*fac->cotiz),10,2)
            STORE totbru-ABS(fac->montobru*fac->cotiz) TO totbru
         else
            ?? " "+STR(fac->montobru*fac->cotiz,10,2)
            STORE totbru+fac->montobru*fac->cotiz TO totbru
         endif
      ELSE
         if fac->tipo="NC"
           ?? "-"+str(ABS(fac->montobru),10,2)
           STORE totbru-ABS(fac->montobru) TO totbru
         else
           ?? " "+STR(fac->montobru,10,2)
           STORE totbru+fac->montobru TO totbru
         endif
      ENDIF
      ?? '|'
      IF !EMPTY(xaci[1])
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
           ?? " "+STR(fac->montoiva,10,2)
           STORE totiva+fac->montoiva TO totiva
         ELSE
           IF fac->tipo="NC"
              ?? "-"+STR(ABS(fac->montoiva),10,2)
              STORE totiva-ABS(fac->montoiva) TO totiva
           ENDIF
         ENDIF
         ?? '|'
      ENDIF
      IF !EMPTY(xaci[2])
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
           ?? " "+STR(fac->montoot2,10,2)
           STORE totot2+fac->montoot2 TO totot2
         ELSE
           IF fac->tipo="NC"
              ?? "-"+STR(ABS(fac->montoot2),10,2)
              STORE totot2-ABS(fac->montoot2) TO totot2
           ENDIF
         ENDIF
         ?? '|'
      ENDIF
      IF !EMPTY(xaci[3])
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
           ?? " "+STR(fac->montoot3,10,2)
           STORE totot3+fac->montoot3 TO totot3
         ELSE
           IF fac->tipo="NC"
              ?? "-"+STR(ABS(fac->montoot3),10,2)
              STORE totot3-(fac->montoot3) TO totot3
           ENDIF
         ENDIF
         ?? '|'
      ENDIF
      IF xamoneda#xauss
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
           ?? " "+STR(fac->montonet*fac->cotiz,10,2)
           STORE totnet+fac->montonet*fac->cotiz TO totnet
         ELSE
           IF fac->tipo="NC"
             ?? "-"+STR(ABS(Fac->montonet*fac->cotiz),10,2)
             STORE totnet-ABS(fac->montonet*fac->cotiz) TO totnet
           ENDIF
         ENDIF
      ELSE
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
           ?? " "+STR(fac->montonet,10,2)
           STORE totnet+fac->montonet TO totnet
         ELSE
           IF fac->tipo="NC"
             ?? "-"+STR(ABS(fac->montonet),10,2)
             STORE totnet-ABS(fac->montonet) TO totnet
           ENDIF
         ENDIF
      ENDIF
   ENDSCAN
   =TLIVAVP("TOTAL")
   =relewin("WIN")
ELSE
   =iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
FUNCTION TLIVAVP
PARAMETER COSA
PRIVATE COSA
if lastkey()#27
   ? lns
   ? SPACE(11)
   ?? PADR(COSA,7)+": "
   ?? STR(totbru,10,2)+'|'
   IF !EMPTY(xaci[1])
     ?? STR(totiva,10,2)
     ?? '|'
   ENDIF
   IF !EMPTY(xaci[2])
     ?? STR(totot2,10,2)
     ?? '|'
   ENDIF
   IF !EMPTY(xaci[3])
     ?? STR(totot3,10,2)
     ?? '|'
   ENDIF
   ?? STR(totnet,10,2)
   ? lns
   _WRAP=.F.
   =INKEY(0)
endif
RETURN(LASTKEY())
*: EOF: LIVAVP.PRG
