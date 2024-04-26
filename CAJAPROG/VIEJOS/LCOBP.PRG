********************************************************************************
*-- Programa: LCOBP.PRG
*-- Fecha   : 09/12/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE CUENTA CORRIENTE DEL CLIENTE, por pantalla
********************************************************************************
SELE seg
stor PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   PAG=1
   sele ccl
   GO TOP
   =WIN0()
   =CABPAN()
   stor PAIP+PADC("DETALLE",14)+"|FEC.OPER|FEC.VENC|"+PADC('COMPROBANTE',15)+PAIP+PADC('COMPR.REF.',13)+PAIP+PADC('MONTO EN '+LEFT(xadols,3)+".",15) TO acla
   stor REPL("=",LEN(acla)) TO lns
   TT='Cta. Cte Cliente'+IIf(!empty(ttu)," - "+ttu,"")
    =TIT_LNS(1)
   COBTOT=NUL
   SELE ccl
   SCAN FOR &fisc
      IF ROW()=21
         =TLCOB("SUBTOTAL")
         IF LASTKEY()=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =CABPAN()
         =TIT_LNS(2)
      ENDIF
      ? PAIP
      ?? SUBSTR(ccl.detalle,1,14)
      ?? PAIP
      ?? ccl.fechaop
      ?? PAIP
      ?? ccl.fechave
      ?? PAIP
      ?? LEFT(ccl.compr,15)
      ?? PAIP
      ?? ccl.comprre+"-"+padR(alltrim(str(ccl.numerore)),10)
      ?? PAIP
      IF ccl.comprre="RE" .or. ccl.comprre="NC"
         ?? "-"+STR(ccl.equivale,14,2)
         stor cobtot-ccl.equivale TO cobtot
      ELSE
         ?? " "+STR(ccl.equivale,14,2)
         stor cobtot+ccl.equivale TO cobtot
      ENDIF
   ENDSCAN
   =TLCOB("TOTAL")
   =relewin("WIN")
ELSE
   =iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
FUNCTION TLCOB
PARAMETER COSA
PRIVATE COSA
IF LASTKEY()#27
   ? lns
   ? SPACE(58)+PADR(COSA,7)
   ?? cobtot PICTURE "99999999999.99"
   =INKEY(0)
ENDIF
RETURN(.T.)
