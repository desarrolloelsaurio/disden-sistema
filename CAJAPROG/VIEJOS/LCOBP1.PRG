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
   sele ccl
   GO TOP
do win0
   pag=1
   =cabpan()
   stor '|'+PADC("DETALLE",14)+"|FEC.OPER|FEC.VENC|"+PADC('COMPROBANTE',15)+PAIP+PADC('COMPR.REF.',13)+PAIP+PADC('MONTO EN '+LEFT(xadols,3)+".",15) TO acla
   stor REPL("=",LEN(acla)) TO lns
   TT='Cta. Cte Cliente'+IIf(!empty(ttu)," - "+ttu,"")
   _WRAP=.T.
   _ALIGNMENT='LEFT'
=tit_lns(1)
   COBTOT=0
   SELE ccl
   SCAN FOR &fisc
      IF ROW()=21
         ? LEFT(lns,LEN(lns)-4)
         ?? '\\\\'
            ? SPACE(55)+"SUBTOTAL  "
   ?? cobtot PICTURE "99999999999.99"
         IF inKEY(0)=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
=tit_lns(1)
      ENDIF
      ? '|'
      ?? SUBSTR(ccl.detalle,1,14)
      ?? '|'
      ?? ccl.fechaop
      ?? '|'
      ?? ccl.fechave
      ?? '|'
      ?? LEFT(ccl.compr,15)
      ?? '|'
      ?? ccl.comprre+"-"+padR(alltrim(str(ccl.numerore)),10)
      ?? '|'
      IF ccl.comprre="RE" .or. ccl.comprre="NC"
         ?? "-"+STR(ccl.equivale,14,2)
         stor cobtot-ccl.equivale TO cobtot
      ELSE
         ?? " "+STR(ccl.equivale,14,2)
         stor cobtot+ccl.equivale TO cobtot
      ENDIF
   ENDSCAN
   ? lns
   ? SPACE(58)+"TOTAL  "
   ?? cobtot PICTURE "99999999999.99"
   _WRAP=.F.
   =INKEY(0)
   RELE WIND win
ELSE
   do iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,NUL SAY BOTOM
RETURN
