*:*********************************************************************
*:
*:        Program: LKARI5.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/04/91     17:50
*:
*:      Called by: LKARI.PRG
*:
*:          Calls: IMPRESOR.PRG
*:               : ABPR.PRG
*:               : HLP.PRG
*:
*:      Documented 09/25/91 at 13:47               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LKARI5.PRG
*-- Fecha   : 05/06/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE GRUPOS POR IMPRESORA
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
SELE kar
DO impresor
@ 24,nul SAY IMPRIMIENDO COLO SCHE 19
STOR NUL TO casos
acla="|Nro.OP|FECHA OP|"+PADC(tella+'/'+abio,30)+PAIP+PADC("TALLER",30)+PAIP+PADC("OPERACION",20)+PAIP+PADC("DETALLE",20)+PAIP+PADC("CANTIDAD",xacdigi)+PAIP
STORE REPL("=",LEN(acla)) TO lns
STORE LEN(acla) TO largo
STORE MIN(xacancho,xachoja) TO largoim
=CABPRI()
_PCOPIES=1
PRINTJOB
?
? lns
? acla
? lns
STOR NUL TO suma,resta
SCAN
IF _PLINENO>63
? LEFT(lns,largoim-3)
?? '///'
? lns
? PAIP
?? "TOTAL"
cl=LEN(acla)-xacdigi-1
?? STR(suma-resta,xacdigi,2) AT cl
EJECT PAGE
_RMARGIN=80
_WRAP=.F.
?
?
? lns
? acla
? lns
ENDI
?PAIP
?? STR(RECNO(),6)
??PAIP
?? fechaop
??PAIP
IF tipo=LEFT(tella,1)
SELE tel
IF SEEK(ALLTRIM(kar->articulo))
?? tel->tela
ELSE
?? SPACE(30)
ENDIF
ELSE
SELE avi
IF SEEK(ALLTRIM(kar->articulo))
?? avi->avios
ELSE
?? SPACE(30)
ENDIF
ENDIF
?? PAIP
SELE kar
GO rcd
IF kar->taller#0
GOTO kar->taller IN tal
?? tal->talleres
ELSE
?? PADR('DEPOSITO/FABRIC',30)
ENDIF
??PAIP
GOTO kar->opk IN opk
?? opk->operacion
??PAIP
?? detalle
?? PAIP
IF entrada#0
??STR(entrada,xacdigi,2)
STORE suma+entrada TO suma
ELSE
IF salida#0
?? STR(-1*salida,xacdigi,2)
STORE resta+salida TO resta
ELSE
?? PADC("----",xacdigi)
ENDIF
ENDIF
??PAIP
ENDSCAN
? lns
? PAIP
?? "TOTAL"
cl=LEN(acla)-xacdigi-1
?? STR(suma-resta,xacdigi,2) AT cl
_WRAP=.F.
EJECT PAGE
?
ENDP
=FINIMP()
DO IAUD WITH 'LISTADO KARDEX por IMPRESORA'
ELSE
=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
*: EOF: LKARI5.PRG
