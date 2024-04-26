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
   nada=nada+PAIP+PADC("I.V.A.",14)++PAIP+PADC("MONTO EXENTO",14)
   STORE "  FECHA |"+PADC("COMPROBANTE",10)+PAIP+PADC("MONTO NETO",14) TO acla
   STORE acla+nada+PAIP+PADC("FACTURADO",14) TO acla
   STORE REPL("=",LEN(acla)) TO lns
   =tit_lns(1)
   STORE 0 TO totbru,totiva,totot2,totot3,totexe,totnet
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
      store 0 to subiva
      ? fac->fechaem
      ?? PAIP
      ?? IiF(EMPTY(fac->tipo),"FA",FAC->TIPO)+STR(fac->factura,8)
      ?? PAIP
      IF xamoneda#xauss
         if fac->tipo="NC"
            ?? "-"+str(ABS(fac->montobru*fac->cotiz),13,2)
            STORE totbru-ABS(fac->montobru*fac->cotiz) TO totbru
         else
            ?? " "+STR(fac->montobru*fac->cotiz,13,2)
            STORE totbru+fac->montobru*fac->cotiz TO totbru
         endif
      ELSE
         if fac->tipo="NC"
           ?? "-"+str(ABS(fac->montobru),13,2)
           STORE totbru-ABS(fac->montobru) TO totbru
         else
           ?? " "+STR(fac->montobru,13,2)
           STORE totbru+fac->montobru TO totbru
         endif
      ENDIF
      ?? '|'
      IF !EMPTY(xaci[1])
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
*           ?? " "+STR(fac->montoiva,13,2)
           IF xamoneda#xauss
             STORE totiva+fac->montoiva*fac.cotiz TO totiva
             STORE subiva+fac->montoiva*fac.cotiz TO subiva
           ELSE
             STORE totiva+fac->montoiva TO totiva
             STORE subiva+fac->montoiva TO subiva
           ENDIF  
         ELSE
           IF fac->tipo="NC"
*              ?? "-"+STR(ABS(fac->montoiva),13,2)
           IF xamoneda#xauss
              STORE totiva-ABS(fac->montoiva)*fac.cotiz TO totiva
              STORE subiva-ABS(fac->montoiva)*fac.cotiz TO subiva
             ELSE
              STORE totiva-ABS(fac->montoiva) TO totiva
              STORE subiva-ABS(fac->montoiva) TO subiva
             ENDIF 
           ENDIF
         ENDIF
*         ?? '|'
      ENDIF
      IF !EMPTY(xaci[2])
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
 *          ?? " "+STR(fac->montoot2,13,2)
         IF xamoneda#xauss
           STORE totot2+fac->montoot2*fac.cotiz TO totot2
           STORE subiva+fac->montoot2*fac.cotiz TO subiva
         ELSE  
           STORE totot2+fac->montoot2 TO totot2
           STORE subiva+fac->montoot2 TO subiva
          ENDIF
        ELSE
           IF fac->tipo="NC"
*              ?? "-"+STR(ABS(fac->montoot2),13,2)
           IF xamoneda#xauss
              STORE totot2-ABS(fac->montoot2)*fac.cotiz TO totot2
              STORE subiva-ABS(fac->montoot2)*fac.cotiz TO subiva
           ELSE     
              STORE totot2-ABS(fac->montoot2) TO totot2
              STORE subiva-ABS(fac->montoot2) TO subiva
           ENDIF
           ENDIF
         ENDIF
*         ?? '|'
      ENDIF
      IF !EMPTY(xaci[3])
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
*           ?? " "+STR(fac->montoot3,13,2)
           IF xamoneda#xauss
            STORE totot3+fac->montoot3*fac.cotiz TO totot3
            STORE subiva+fac->montoot3*fac.cotiz TO subiva
           ELSE 
            STORE totot3+fac->montoot3 TO totot3
            STORE subiva+fac->montoot3 TO subiva
           ENDIF  
         ELSE
           IF fac->tipo="NC"
*             ?? "-"+STR(ABS(fac->montoot3),13,2)
           IF xamoneda#xauss
              STORE totot3-(fac->montoot3)*fac.cotiz TO totot3
              STORE subiva-ABS(fac->montoot3)*fac.cotiz TO subiva
           ELSE
              STORE totot3-(fac->montoot3) TO totot3
              STORE subiva-ABS(fac->montoot3) TO subiva
           ENDIF
           ENDIF
         ENDIF
       ENDIF
       IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
            ?? " "+STR(subiva,13,2)
            ?? '|'
           IF xamoneda#xauss
            STORE montoexe+fac->montoexe*fac.cotiz TO totexe
           ELSE
            STORE montoexe+fac->montoexe TO totexe
           ENDIF 
            ?? " "+STR(fac->montoexe,13,2)
         ELSE
           IF fac->tipo="NC"
            ?? "-"+STR(ABS(subiva),13,2)
            ?? '|'
           IF xamoneda#xauss
            STORE montoexe-ABS(fac->montoexe)*fac.cotiz TO totexe
           ELSE
            STORE montoexe-ABS(fac->montoexe) TO totexe
           ENDIF 
            ?? " "+STR(fac->montoexe,13,2)
           ENDIF
      ENDIF
      ?? '|'
      IF xamoneda#xauss
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
           ?? " "+STR(fac->montonet*fac->cotiz,13,2)
           STORE totnet+fac->montonet*fac->cotiz TO totnet
         ELSE
           IF fac->tipo="NC"
             ?? "-"+STR(ABS(Fac->montonet*fac->cotiz),13,2)
             STORE totnet-ABS(fac->montonet*fac->cotiz) TO totnet
           ENDIF
         ENDIF
      ELSE
         IF EMPTY(fac->tipo) .OR. fac->tipo="ND"
           ?? " "+STR(fac->montonet,13,2)
           STORE totnet+fac->montonet TO totnet
         ELSE
           IF fac->tipo="NC"
             ?? "-"+STR(ABS(fac->montonet),13,2)
             STORE totnet-ABS(fac->montonet) TO totnet
           ENDIF
         ENDIF
      ENDIF
   ENDSCAN
   STORE totiva+totot2+totot3 TO totiva
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
   ?? STR(totbru,14,2)+'|'
   ?? STR(totiva,14,2)
   ?? '|'
   ?? STR(totexe,14,2)
   ?? '|'
   ?? STR(totnet,14,2)
   ? lns
   _WRAP=.F.
   =INKEY(0)
endif
RETURN(LASTKEY())
*: EOF: LIVAVP.PRG
