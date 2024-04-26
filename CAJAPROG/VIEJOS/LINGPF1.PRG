********************************************************************************
*-- Programa: LINGPf1.PRG
*-- Fecha   : 02-05-92 08:07am
*-- Version : G. REINER
*-- Notas   : LISTADO DE CAJA. INGRESOS - DISCRIMINADO POR FECHA
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
   FISC=IIF(QUEFEC>1,fisc+' .and. '+ELFEC,fisc)
   FISC=IIF(QUEMON#1,fisc+' .and. '+ELMON,fisc)
   INDE ON FECHAOP TO TMP FOR &FISC UNIQ opti
   COUNT TO CANCLI
   if !empty(cancli)
   INDE ON DTOS(FECHAOP)+CODCLI TO TMP FOR &FISC
   RELE TCLI
   DIME TCLI[CANCLI,3]
   DO win0
   acti wind win
   STORE 0 TO pag
   =cabpan()
   STORE PAIP to acla
   if quecli=1
      acla=acla+padc('CLIENTE',30)+PAIP
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
   _wrap=.T.
   _alignment='CENTER'
   ELCLI={}
   STORE 1 TO PUNCLI
   SCAN for &fisc
      IF FECHAOP#ELCLI
         IF !EMPTY(PAG)
            =FLING1("TOTAL")
            IF INKEY(0)=27
               EXIT
            ENDIF
            TCLI[PUNCLI,1]=ELCLI
            TCLI[PUNCLI,2]=totalus
            TCLI[PUNCLI,3]=totalpes
            PUNCLI=PUNCLI+1
         ENDIF
         CLEA
         ELCLI=FECHAOP
         ELCLINOM=FECHAOP
         ttcli='DIA '+DTOC(ELCLINOM)
         STORE nul TO totalus,totalpes
         PAG=PAG+1
         =cabpan()
         DO FLING2
      ENDIF
      IF ROW()>20
         =flingp1("SUBTOTAL")
         IF INKEY(0)=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         do FLING2
      ENDIF
      ? PAIP
		SELE PER
      =SEEK(CAJ.CODCLI)
      SELE CAJ
      ELCLI=CAJ.FECHAOP
      if quecli=1
			SELE PER
         ?? IIF(SEEK(CAJ.CODCLI),LEFT(PER.CLIente,30),SPACE(30))
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
   =FLING1("TOTAL")
   TCLI[PUNCLI,1]=ELCLI
   TCLI[PUNCLI,2]=totalus
   TCLI[PUNCLI,3]=totalpes
   =INKEY(0)
   ACLA='| FECHA  |'
   if quemon=1 .or. quemon=2
      acla=acla+padc(alltrim(XAUSS),XACDIGI)+PAIP
   endif
   if quemon=1 .or. quemon=3
      acla=acla+padc(alltrim(XADOLS),XACDIGI)+PAIP
   endif
   STORE REPL("=",LEN(acla)) TO lns
   CLEA
   PAG=PAG+1
   =cabpan()
   Ttcli='Resumen de Ingresos'
   DO FLING2
   STORE nul TO totalus,totalpes
	SELE PER
   FOR A=1 TO CANCLI
      ? PAIP
      ?? TCLI[A,1]
      ?? PAIP
      IF QUEMON=1 .OR. QUEMON=2
         ?? STR(TCLI[A,3],xacdigi,2)
         ?? PAIP
         STORE TOTalPES+TCLI[A,3] TO TOTalPES
      ENDIF
      IF QUEMON=1 .OR. QUEMON=3
         ?? STR(TCLI[A,2],xacdigi,2)
         ?? PAIP
         STORE TOTALUS+TCLI[A,2] TO totalus
      ENDIF
   ENDFOR
   =FLING3("TOTAL")
   =INKEY(0)
   RELE wind win
   endif
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
SELE CAJ
USE
DO OPCAJ
@ 24,NUL SAY BOTOM
RETURN
procedure FLING2
_wrap=.t.
if !empty(ttfec)
? lns
endif
return(.T.)
FUNCTION FLING1
PARAMETER COSA
? lns
? PAIP
   ?? PADR(COSA,30)
   ?? PAIP
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
FUNCTION FLING3
PARAMETER COSA
? lns
? PAIP
?? PADR(COSA,8)
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
* EOF - INDENT
