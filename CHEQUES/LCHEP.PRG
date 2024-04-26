********************************************************************************
*-- Programa: LCCHEP.PRG
*-- Fecha   : 11/25/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE CHEQUES, POR PANTALLA
********************************************************************************
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   DO WIN0
   pag=1
   do cabpan
   STORE 0 TO casos
   acla='|'+PADC("N§ CHEQUE",15)+PAIP+PADC("BANCO",15)+PAIP+PADC("MONTO",14)+"|MON|FEC.DEP.|"+PADC("CLIENTE",15)+'|'
   lineas=REPL("=",LEN(acla))
   tt='Listado de Cheques'
   _WRAP=.T.
   _ALIGNMENT='CENTER'
   ? tt
   ? lineas
   ? acla
   ? lineas
   SELE cch
   go top
   SCAN WHILE !EOF()
     IF cch.fechaac={} .AND. EMPTY(cch.entregado)
      IF ROW()=21
         ? LEFT(lineas,LEN(lineas)-4)
         ?? '\\\\'
         if INKEY(nul,"HM")=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         do cabpan
         ? tt
         ? lineas
         ? acla
         ? lineas
      ENDIF
      ?'|'
      ?? cch.nroche
      ??'|'
      ?? left(cch.banco,15)
      ??'|'
      ?? str(cch.monto,14,2)
      ??'|'
      ?? left(iif(left(xauss,1)=cch.moneda,xauss,xadols),3)
      ??'|'
      ?? cch.fechade
      ??'|'
		SELE PER
      set order to 2
      ?? iif(seek(cch.codcli),left(PER.cliente,15),"CLIENTE INEXIS.")
      sele cch
      ??'|'
      STORE casos+1 TO casos
    ENDIF
   ENDSCAN
   ? lineas
   _WRAP=.F.
   ? "Cantidad de Cheques: "
   ?? STR(casos,10)
   =INKEY(nul,"HM")
   RELE WIND win
ELSE
   =iaudi()
ENDIF
=men_lin(botom)
RETURN
*: EOF: LCHEP.PRG
