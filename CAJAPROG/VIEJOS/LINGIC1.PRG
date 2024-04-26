********************************************************************************
*-- Programa: LINGIC1.PRG
*-- Fecha   : 02-10-92 01:10pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE CAJA. INGRESOS - DISCRIMINADO POR CLIENTE
********************************************************************************
SELE Seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   @ 0,rh SAY TIME() COLOR I
   @ 0,rp SAY PADC(ULPR,10) COLOR I
   DO impresor
	SELE PER
   SET ORDER TO 2
   SELE caj
   FISC='empty(caja) .and. LEFT(compre,2)="RE"'
   *FISC=IIF(QUECLI=2,fisc+' .and. '+ELCLI,fisc)
   FISC=IIF(QUEFEC=2,fisc+' .and. '+ELFEC,fisc)
   FISC=IIF(QUEMON#1,fisc+' .and. '+ELMON,fisc)
   INDE ON CODCLI TO TMP FOR &FISC UNIQ
   COUNT TO CANCLI
   if !empty(cancli)
      INDE ON CODCLI+DTOS(FECHAOP) TO TMP FOR &FISC
      RELE TCLI
      DIME TCLI[CANCLI,3]
      STORE 0 TO pag
      STORE "|FECHA OP|" to acla
      acla=acla+IIF(QUECLI=1,padc('CLIENTE',20)+PAIP,'')+padc('COMPROBANTE',12)+PAIP
      acla=acla+IIF(QUEMON=1 .OR. QUEMON=2,padc(alltrim(XAUSS),XACDIGI)+PAIP,'')
      acla=acla+IIF(QUEMON=1 .OR. QUEMON=3,padc(alltrim(XADOLS),XACDIGI)+PAIP,'')
      STORE REPL("=",LEN(acla)) TO lns
      tt='Listado de Caja - Ingresos'
      ttmon=iif(quemon=2,'Operaciones en '+alltrim(xauss),iif(quemon=3,'Operaciones en '+alltrim(xadols),''))
      ttfec=iif(quefec=2,'Entre el '+dtoc(FECINI)+' y el '+dtoc(FECFIN),'')
      DO cabpri
      _PCOPIES=1
      _wrap=.T.
      _alignment='CENTER'
      print
         do cabpri1
         ELCLI="-"
         STORE 1 TO PUNCLI
         SCAN for &fisc
            IF CODCLI#ELCLI
               TCLI[PUNCLI,1]=PER.CODCLI
               IF !EMPTY(PAG)
                  =clini1("TOTAL")
                  EJECT PAGE
                  TCLI[PUNCLI,2]=totalus
                  TCLI[PUNCLI,3]=totalpes
                  PUNCLI=PUNCLI+1
                  DO cabpri1
                  DO clini2
               ELSE
                  PAG=1
               ENDIF
					SELE PER
               =SEEK(CAJ.CODCLI)
               SELE CAJ
               ELCLI=CAJ.CODCLI
               ELCLINOM=PER.CLIENTE
               ttcli=alltrim(PER.cliente)
               STORE nul TO totalus,totalpes
            ENDI
            IF ROW()>66
               =clini1("SUBTOTAL")
               STOR pag+1 TO pag
               eject page
               DO cabpri1
               do clini2
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
         =clini1("TOTAL")
         TCLI[PUNCLI,1]=PER.CODCLI
         TCLI[PUNCLI,2]=totalus
         TCLI[PUNCLI,3]=totalpes
         ACLA='|  CODIGO  |'+PADC("CLIENTE",30)+PAIP
         if quemon=1 .or. quemon=2
            acla=acla+padc(alltrim(XAUSS),XACDIGI)+PAIP
         endif
         if quemon=1 .or. quemon=3
            acla=acla+padc(alltrim(XADOLS),XACDIGI)+PAIP
         endif
         STORE REPL("=",LEN(acla)) TO lns
         eject page
         PAG=PAG+1
         do cabpri1
         Ttcli='Resumen de Ingresos'
         DO clini2
         STORE nul TO totalus,totalpes
			SELE PER
         FOR A=1 TO CANCLI
            =SEEK(TCLI[A,1])
            ? PAIP
            ?? TCLI[A,1]
            ?? PAIP
            ?? PER.CLIENTE
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
         =clini3("TOTAL")
         eject page
      endp
      =finimp()
   endif
ELSE
   =iaudI()
ENDIF
SELE CAJ
USE
DO OPCAj
=men_lin(botom)
RETURN
FUNCTION clini2
_wrap=.t.
if !empty(ttfec)
? lns
endif
return(.T.)
FUNCTION clini1
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
FUNCTION clini3
PARAMETER COSA
? lns
? PAIP
?? PADR(COSA,10)
?? PAIP
?? space(30)
?? PAIP
if quemon=1 .or. quemon=2
   ?? STR(totalPES,XACDIGI,2)
   ?? PAIP
endif
if quemon=1 .or. quemon=3
   ?? STR(TOTALUS,XACDIGI,2)
   ?? PAIP
endif
RETURN .T.
