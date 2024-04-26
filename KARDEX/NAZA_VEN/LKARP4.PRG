*:*********************************************************************
*:
*:        Program: LKARP4.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 08/30/91     13:10
*:
*:      Called by: LKARP.PRG
*:
*:      Documented 09/25/91 at 13:47               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LKARP4.PRG
*-- Fecha   : 06/20/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE KARDEX, POR PANTALLA
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   SELE kar
=WIN0()
pag=1
=CABPAN()
   STOR NUL TO suma,resta
   SELE tel
   SET ORDER TO 2
   SELE avi
   SET ORDER TO 1
   acla="|Nro.OP|FECHA OP|"+PADC(tella+'/'+abio,15)+"|OPER.DE KARDEX|"+PADC("DETALLE",17)+"|  CANTIDAD  |"
   lines=REPL("=",LEN(acla))
   _WRAP=.T.
   _ALIGNMENT='CENTER'
   ? tt
   _WRAP=.F.
   ? lines
   ? acla
   ? lines
   SELE kar
   SCAN FOR &FISC
      IF ROW()=21
         ? LEFT(lines,LEN(lines)-4)
         ?? '\\\\'
         IF inkey(0)=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
=CABPAN()
         ? tt
         ? lines
         ? acla
         ? lines
      ENDIF
      rcd=RECNO()
      ?PAIP
      ?? STR(RECNO(),6)
      ??PAIP
      ?? fechaop
      ??PAIP
      IF tipo=LEFT(tella,1)
         SELE tel
         IF SEEK(ALLTRIM(kar->articulo))
            ?? LEFT(tel->tela,15)
         ELSE
            ?? SPACE(15)
         ENDIF
      ELSE
         SELE avi
         IF SEEK(ALLTRIM(kar->articulo))
            ?? LEFT(avi->avios,15)
         ELSE
            ?? SPACE(15)
         ENDIF
      ENDIF
      SELE kar
      GO rcd
      ??PAIP
      GOTO kar->opk IN opk
      ??LEFT(opk->operacion,14)
      ??PAIP
      ??LEFT(detalle,17)
      ??PAIP
IF entrada#0
         ??STR(entrada,12,2)
         STORE suma+entrada TO suma
      ELSE
IF salida#0
            ?? STR(-1*salida,12,2)
            STORE resta+salida TO resta
         ELSE
            ?? PADC("----",12)
         ENDIF
      ENDIF
      ??PAIP
   ENDSCAN
   STORE suma-resta TO TOTAL
   ? lines
   _WRAP=.F.
   ? SPACE(51)+"Cantidad Total: "+STR(TOTAL,10,2)
   =INKEY(0)
   =relewin("WIN")
ELSE
=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
*: EOF: LKARP4.PRG
