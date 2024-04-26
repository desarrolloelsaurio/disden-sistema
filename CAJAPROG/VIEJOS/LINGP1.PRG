********************************************************************************
*-- Programa: LINGP1
*-- Fecha   : 01-27-92 08:42pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE CAJA. INGRESOS
********************************************************************************
SELE Seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
	SELE PER
   SET ORDER TO 2
   SELE caj
   FISC='empty(caja) .and. LEFT(compre,2)="RE"'
   FISC=IIF(QUECLI=2,fisc+' .and. '+ELCLI,fisc)
   FISC=IIF(QUEFEC=2,fisc+' .and. '+ELFEC,fisc)
   FISC=IIF(QUEMON#1,fisc+' .and. '+ELMON,fisc)
   DO win0
   acti wind win
   STORE 1 TO pag
   =cabpan()
   STORE "|FECHA OP|" to acla
   if quecli=1
      acla=acla+padc('CLIENTE',20)+PAIP
   endif
   acla=acla+padc('COMPROBANTE',12)+PAIP
   if quemon=1 .or. quemon=2
      acla=acla+padc(alltrim(XAUSS),XACDIGI)+PAIP
   endif
   if quemon=1 .or. quemon=3
      acla=acla+padc(alltrim(XADOLS),XACDIGI)+PAIP
   endif
   STORE REPL("=",LEN(acla)) TO lns
   tt='Listado de Caja - Ingresos'
   ttmon=iif(quemon=2,'Operaciones en '+alltrim(xauss),iif(quemon=3,'Operaciones en '+alltrim(xadols),''))
   ttfec=iif(quefec=2,'Entre el '+dtoc(FECINI)+' y el '+dtoc(FECFIN),'')
   ttcli=iif(quecli=2,'Opreaciones del Cliente '+alltrim(PER.cliente),'')
   _wrap=.T.
   _alignment='CENTER'
   do tlingp1
   STORE nul TO totalus,totalpes
   SCAN for &fisc
      IF ROW()>20
=flingp1("SUBTOTAL")
         IF INKEY(0)=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         do tlingp1
      ENDIF
      ? PAIP
      ?? FECHAOP
      ?? PAIP
if quecli=1
		SELE PER
      ?? IIF(SEEK(CAJ.CODCLI),LEFT(PER.CLIente,20),SPACE(20))
      ?? PAIP
      SELE CAJ
endif
      ?? COMPR
      ?? PAIP
      if moneda=left(xaus,1)
         if quemon=1 .or. quemon=2
            ?? str(monto,xacdigi,2)
            ?? paip
            if quemon=1
               ?? space(xacdigi)
               ?? paip
            endif
            totalpes=totalpes+monto
         endif
      else
         if quemon=1 .or. quemon=3
            if quemon=1
               ?? space(xacdigi)
               ?? paip
            endif
            ?? str(MONTO,xacdigi,2)
            ?? paip
            totalus=totalus+monto
         endif
      endif
   ENDSCAN
=flingp1("TOTAL")
=INKEY(NUL)
=RELEwin("win")
ELSE
   =IAUDI()
ENDIF
=men_lin(botom)
RETURN
FUNCTION tlingp1
_wrap=.t.
   if !empty(ttmon)
   endif
   ? lns
   ? acla
   ? lns
return(.T.)
FUNCTION FLINGP1
PARAMETER COSA
   ? lns
   ? PAIP
?? PADR(COSA,8)
?? PAIP
 if quecli=1
   ?? SPACE(20)
   ?? PAIP
endif
   ?? SPACE(12)
   ?? PAIP
   if quemon=1 .or. quemon=2
      ?? STR(totalPES,XACDIGI,2)
      ?? PAIP
   endif
   if quemon=1 .or. quemon=3
      ?? STR(TOTALUS,XACDIGI,2)
      ?? PAIP
   endif
RETURN(.T.)
