*:*********************************************************************
*:
*:        Program: LKARP5.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 08/22/91     15:21
*:
*:      Called by: LKARP.PRG
*:
*:      Documented 09/25/91 at 13:47               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LKARP5.prg
*-- Fecha   : 06/20/91
*-- Version : g reiner
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
   SET ORDER TO TAG TELCOD
   SELE avi
   SET ORDER TO TAG AVICOD
   acla="|Nro.OP|FECHA OP|"+PADC(tella+'/'+abio,15)+PAIP+PADC("TALLER",15)+PAIP+PADC("OPERACION",15)+"|  CANTIDAD  |"
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
      ?? PAIP
      SELE kar
      GO rcd
IF kar->taller#0
         GOTO kar->taller IN tal
         ?? LEFT(tal->talleres,15)
      ELSE
         ?? 'DEPOSITO/FABRIC'
      ENDIF
      ??PAIP
      GOTO kar->opk IN opk
      ??LEFT(opk->operacion,15)
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
   A=INKEY(0)
   =relewin("WIN")
ELSE
  =iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
